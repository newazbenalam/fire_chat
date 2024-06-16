import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // save user data to firestore if not exists
      final userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();
      if (!userDoc.exists) {
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'email': email,
          'uid': userCredential.user!.uid,
        });
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code + e.message.toString());
      throw Exception(e.message);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<UserCredential> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // save user data to firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'uid': userCredential.user!.uid,
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code + e.message.toString());
      throw Exception(e.message);
    }
  }
}
