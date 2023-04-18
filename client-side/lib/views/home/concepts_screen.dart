import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../constants/global_variables.dart';
import '../../widgets/text_widget.dart';

class ConceptsScreen extends StatelessWidget {
  static String route = "conceptsScreen";
  const ConceptsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: tBlueColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset(tUserProfile),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: ListTile(
                          title: TextWidget(
                            label: "12 Dec, Monday",
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          subtitle: TextWidget(
                            label: "Learn a new lesson today!",
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 8,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          label: "Your Current Progress",
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                        LinearPercentIndicator(
                          lineHeight: 20,
                          percent: 0.3,
                          progressColor: tBlueColor,
                          barRadius: Radius.circular(10),
                          center: Text("30%"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  TextWidget(
                    label: "Become a UI/UX Designer",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(),
        ],
      ),
    );
  }
}
