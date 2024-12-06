import 'package:cc206_tutor_app/feature/opening_screen.dart';
import 'package:cc206_tutor_app/feature/sign_in.dart';
import 'package:cc206_tutor_app/feature/sign_up.dart';
import 'package:cc206_tutor_app/screens/dashboard.dart';
import 'package:cc206_tutor_app/screens/messages.dart';
import 'package:cc206_tutor_app/screens/schedule.dart';
import 'package:cc206_tutor_app/screens/search.dart';
import 'package:flutter/material.dart';

import 'screens/profile.dart';

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
        '/sign_up': (BuildContext ctx) => const SignUpScreen(),
        '/dashboard': (context) => const Dashboard(),
        '/search': (context) => const Search(),
        '/schedule': (context) => const Schedule(),
        '/messages': (context) => const Messages(),
        '/profile': (context) => const Profile(),
      },
    );
  }
}
