// ignore: unused_import
import 'package:cc206_tutor_app/feature/profile.dart';
import 'package:flutter/material.dart';

import 'feature/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const SignUpScreen(),
    );
  }
}
