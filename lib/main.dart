import 'package:cc206_tutor_app/feature/opening_screen.dart';
import 'package:cc206_tutor_app/feature/sign_in.dart';
import 'package:cc206_tutor_app/feature/sign_up.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign in',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext ctx) => const OpeningScreen(),
        '/sign_in': (BuildContext ctx) => const LoginScreen(),
        '/sign_up': (BuildContext ctx) => const SignUpScreen()
      },
    );
  }
}
