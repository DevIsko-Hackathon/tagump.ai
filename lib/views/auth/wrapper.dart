import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tagumpai/provider/user_provider.dart';
import 'package:tagumpai/views/auth/auth_screen.dart';
import 'package:tagumpai/views/auth/login_screen.dart';
import 'package:tagumpai/views/personalized/personalize_screen.dart';
import 'package:tagumpai/views/welcome_screen.dart';

class Wrapper extends StatefulWidget {
  static String route = "/";
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  

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
