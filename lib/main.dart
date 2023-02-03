// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sahara/pages/screens/signup_screen.dart';
import 'package:sahara/utils/app_theme.dart';
import 'package:flutter/services.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppThemes.themeData(),
      home: SignupScreen(),
    );
  }
}
