import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tagumpai/services/auth.dart';

import '../../constants/global_variables.dart';
import '../../models/syllabus.dart';
import '../../services/api.dart';
import '../../widgets/text_widget.dart';

class ConceptsScreen extends StatefulWidget {
  static String route = "conceptsScreen";
  const ConceptsScreen({super.key});

  @override
  State<ConceptsScreen> createState() => _ConceptsScreenState();
}

class _ConceptsScreenState extends State<ConceptsScreen> {
  var response;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final result = await ApiServices().fetchApi("syllabus");
    setState(() {
      response = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    final weekday = DateFormat("EEEE").format(date);
    final month = DateFormat("LLLL").format(date);
    final day = DateFormat("d").format(date);
    return SafeArea(
      child: response == null
          ? LoadingAnimationWidget.hexagonDots(color: tBlueColor, size: 50)
          : Column(
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
                                  label: "$day $month, $weekday",
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
                Padding(
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
                Expanded(
                  child: ListView.builder(
                      itemCount: response["result"]["syllabus"].length,
                      itemBuilder: (context, index) {
                        final result = response["result"]["syllabus"];
                        int length = index;
                        int subtitle = result[index].length;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: tLightColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: "Concept ${result[index][0]}:",
                                      style: TextStyle(
                                        color: tDarkBlueColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Foundations of UX Design",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ]),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 200,
                                  child: ListView.builder(
                                      itemCount: subtitle,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.only(bottom: 10),
                                          padding: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: tBlueColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: TextWidget(
                                            label:
                                                "${result[length][index + 1]}",
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
