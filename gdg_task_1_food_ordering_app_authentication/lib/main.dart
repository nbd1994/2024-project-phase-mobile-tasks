import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gdg_task_1_food_ordering_app/firebase_options.dart';
import 'package:gdg_task_1_food_ordering_app/landing_page.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  
  runApp(MaterialApp(
    title: 'Food Ordering App',
    home: LandingPage(),
  ));
}