import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tagumpai/views/auth/auth_screen.dart';
import 'package:tagumpai/views/auth/login_screen.dart';
import 'package:tagumpai/views/personalized/personalize_screen.dart';
import 'package:tagumpai/views/welcome_screen.dart';

class Wrapper extends StatelessWidget {
  static String route = "/";
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return PersonalizeScreen();
          } else {
            return AuthScreen();
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        return WelcomeScreen();
      },
    );
  }
}
