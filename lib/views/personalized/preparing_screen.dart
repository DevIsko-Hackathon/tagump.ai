import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/widgets/button_widget.dart';
import 'package:tagumpai/widgets/text_widget.dart';

class PreparingScreen extends StatelessWidget {
  static String route = "preparingScreen";
  const PreparingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.left_chevron,
            color: Colors.black,
          ),
        ),
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
                    child: Divider(
                      color: tBlueColor,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: tBlueColor,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextWidget(
                      label: "What is your preferred industry?",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    TextWidget(
                      label:
                          "What skills do you have that are relevant to your desired job?",
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    ButtonWidget(
                      label: "Next",
                      backgroundColor: Colors.black,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
