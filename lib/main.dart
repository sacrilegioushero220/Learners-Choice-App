import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learners_choice_app/app.dart';
import 'package:learners_choice_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}
