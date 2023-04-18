import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/models/user_model.dart';
import 'package:tagumpai/provider/user_provider.dart';
import 'package:tagumpai/views/personalized/preparing_screen.dart';
import 'package:tagumpai/views/switch_career/previous_job_screen.dart';
import 'package:tagumpai/views/switch_career/target_company_screen.dart';
import 'package:tagumpai/widgets/button_widget.dart';
import 'package:tagumpai/widgets/dropdown_widget.dart';
import 'package:tagumpai/widgets/form_widget.dart';
import 'package:tagumpai/widgets/personalizing_loading.dart';
import 'package:tagumpai/widgets/text_widget.dart';

class TargetCompanyScreen extends StatefulWidget {
  static String route = "targetCompanyScreen";
  const TargetCompanyScreen({super.key});

  @override
  State<TargetCompanyScreen> createState() => _TargetCompanyScreenState();
}

class _TargetCompanyScreenState extends State<TargetCompanyScreen> {
  final TextEditingController _targetcompanyController =
      TextEditingController();
  final TextEditingController _companyListingController =
      TextEditingController();

  bool isFinish = false;
  bool hasTarget = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _targetcompanyController.dispose();
    _companyListingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false);
    return isFinish
        ? PersonalizingLoading()
        : Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  color: Colors.black,
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
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
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
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
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              label: "Do you have a target company?",
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TargetCompanyButton(
                                    label: "Yes",
                                    onPressed: () {
                                      setState(() {
                                        hasTarget = true;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TargetCompanyButton(
                                    label: "No",
                                    onPressed: () {
                                      setState(() {
                                        hasTarget = false;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            hasTarget ? showTargetCompany() : SizedBox.shrink(),
                            SizedBox(
                              height: 200,
                            ),
                            ButtonWidget(
                              label: "Next",
                              backgroundColor: tBlueColor,
                              onPressed: () async {
                                setState(() {
                                  isFinish = true;
                                });
                              },
                            )
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

  Widget showTargetCompany() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        FormWidget(
            controller: _targetcompanyController,
            hintText: "Placeholder",
            prompText: "Target Company"),
        SizedBox(
          height: 20,
        ),
        FormWidget(
            controller: _companyListingController,
            hintText: "Placeholder",
            prompText: "Company Listing Description"),
      ],
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

class TargetCompanyButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  const TargetCompanyButton({
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
