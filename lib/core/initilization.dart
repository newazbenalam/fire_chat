import 'package:fire_chat/core/injection_deps.dart';
import 'package:fire_chat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> coreInit() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Future.wait([
    init(),
  ]);
}
