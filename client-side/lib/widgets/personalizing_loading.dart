import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/views/home/home_page.dart';
import 'package:tagumpai/widgets/text_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PersonalizingLoading extends StatefulWidget {
  const PersonalizingLoading({super.key});

  @override
  State<PersonalizingLoading> createState() => _PersonalizingLoadingState();
}

class _PersonalizingLoadingState extends State<PersonalizingLoading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, HomePage.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.hexagonDots(
              color: tBlueColor,
              size: 50,
            ),
            SizedBox(
              height: 20,
            ),
            TextWidget(
              label: "Personalizing",
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
