import 'package:flutter/material.dart';
import 'package:tagumpai/views/personalized/accomplish_screen.dart';
import 'package:tagumpai/widgets/button_widget.dart';
import 'package:tagumpai/widgets/text_widget.dart';

class PersonalizeScreen extends StatelessWidget {
  static String route = "personalizeScreen";
  const PersonalizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  label: "Personalize your plan!",
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
                SizedBox(
                  height: 20,
                ),
                TextWidget(
                  label:
                      "Let's get to know you better so we can help you prepare for your career path",
                  color: Colors.black,
                ),
                SizedBox(
                  height: 100,
                ),
                ButtonWidget(
                  label: "Get Started",
                  backgroundColor: Colors.black,
                  onPressed: () => Navigator.pushReplacementNamed(
                    context,
                    AccomplishScreen.route,
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
