// Repository implementation for home
import 'package:fire_chat/features/home/domain/entities/home_entities.dart';
import 'package:fire_chat/features/home/domain/repositories/login_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final AuthServiceEntity authServices;
  final ChatServicesEntity chatServices;

  HomeRepositoryImpl({required this.chatServices, required this.authServices});

  @override
  Stream<List<Map<String, dynamic>>> getUsers() {
    return chatServices.getUsersStream();
  }

  @override
  Future<void> addMessage(String message) {
    // TODO: implement addMessage
    throw UnimplementedError();
  }

  @override
  Future<void> addMessageField(String message) {
    // TODO: implement addMessageField
    throw UnimplementedError();
  }

  @override
  Future<Stream> addUser(String name, String email) {
    // TODO: implement addUser
    throw UnimplementedError();
  }

  @override
  Future<void> clearAllMessages() {
    // TODO: implement clearAllMessages
    throw UnimplementedError();
  }

  @override
  Future<void> clearMessages() {
    // TODO: implement clearMessages
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMessage(String id) {
    // TODO: implement deleteMessage
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMessageField(String id) {
    // TODO: implement deleteMessageField
    throw UnimplementedError();
  }

  @override
  Future<Stream> deleteUser(String id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<void> getMessage(String id) {
    // TODO: implement getMessage
    throw UnimplementedError();
  }

  @override
  Future<void> getMessages() {
    // TODO: implement getMessages
    throw UnimplementedError();
  }

  @override
  Future<Stream> getUser(String id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<void> updateMessage(String id, String message) {
    // TODO: implement updateMessage
    throw UnimplementedError();
  }

  @override
  Future<void> updateMessageField(String id, String message) {
    // TODO: implement updateMessageField
    throw UnimplementedError();
  }

  @override
  Future<Stream> updateUser(String id, String name, String email) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
