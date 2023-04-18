import 'package:flutter/material.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/views/personalized/preparing_screen.dart';
import 'package:tagumpai/views/switch_career/previous_job_screen.dart';
import 'package:tagumpai/widgets/button_widget.dart';
import 'package:tagumpai/widgets/text_widget.dart';

class AccomplishScreen extends StatelessWidget {
  static String route = "accomplishScreen";
  const AccomplishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          label: "Personalization".toUpperCase(),
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: tBlueColor,
                        thickness: 3,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Divider(
                        color: tBlueColor,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        label: "What do you want to accomplish using this app?",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      AccomplishButton(
                        label: "Prepare for First Job",
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AccomplishButton(
                        label: "Switch Career Paths",
                        onPressed: () => Navigator.pushNamed(
                          context,
                          PreviousJobScreen.route,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AccomplishButton(
                        label: "Just Exploring",
                        onPressed: () {},
                      ),
                    ],
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

class AccomplishButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  const AccomplishButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: tLightColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 15,
            spreadRadius: 2,
            color: Colors.black.withOpacity(0.1),
          ),
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 2,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: tLightColor,
        ),
        child: TextWidget(
          label: label,
          color: tBlueColor,
        ),
      ),
    );
  }
}
