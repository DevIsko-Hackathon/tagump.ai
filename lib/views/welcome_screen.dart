import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/views/auth/auth_screen.dart';
import 'package:tagumpai/views/auth/signup_screen.dart';
import 'package:tagumpai/widgets/button_widget.dart';
import 'package:tagumpai/widgets/text_widget.dart';

class WelcomeScreen extends StatelessWidget {
  static String route = "welcomeScreen";
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  label: "Welcome!",
                  fontSize: 32,
                  color: tBlueColor,
                  fontWeight: FontWeight.bold,
                ),
                TextWidget(
                  label: "We are so glad you're here!",
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                  color: Colors.black,
                ),
                TextWidget(
                  label: "Discover amazing shit here",
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 100,
                ),
                Image.asset(tWelcomeBanner),
                SizedBox(
                  height: 100,
                ),
                ButtonWidget(
                  label: "Get Started",
                  backgroundColor: tBlueColor,
                  onPressed: () => Navigator.pushNamed(
                    context,
                    AuthScreen.route,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          color: tBlueColor,
                          fontSize: 11,
                        ),
                        text: "Already have an account? ",
                        children: [
                          TextSpan(
                            text: "Log in",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  AuthScreen.route,
                                );
                              },
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
