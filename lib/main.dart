import 'package:flutter/material.dart';
import 'package:itk_astra_login/screens/screen_home.dart';
import 'package:itk_astra_login/screens/screen_login.dart';
import 'package:itk_astra_login/screens/screen_registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home:  ScreenRegister(),
    );
  }
}

