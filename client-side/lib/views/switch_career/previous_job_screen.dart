import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/views/personalized/preparing_screen.dart';
import 'package:tagumpai/views/switch_career/current_job_screen.dart';
import 'package:tagumpai/views/switch_career/previous_job_screen.dart';
import 'package:tagumpai/widgets/button_widget.dart';
import 'package:tagumpai/widgets/dropdown_widget.dart';
import 'package:tagumpai/widgets/form_widget.dart';
import 'package:tagumpai/widgets/text_widget.dart';

class PreviousJobScreen extends StatefulWidget {
  static String route = "previousJobScreen";
  const PreviousJobScreen({super.key});

  @override
  State<PreviousJobScreen> createState() => _PreviousJobScreenState();
}

class _PreviousJobScreenState extends State<PreviousJobScreen> {
  final TextEditingController _jobTitleController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _jobTitleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
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
                  flex: 2,
                  child: Divider(
                    color: tBlueColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      label: "What is your previous industry?",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    SizedBox(height: 10),
                    DropdownWidget(
                      label: "Select Industry",
                      item: [
                        "Design",
                        "Technology",
                        "Marketing",
                        "Medicine",
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    FormWidget(
                      controller: _jobTitleController,
                      hintText: "Placeholder",
                      prompText: "What is your previous job title?",
                      fontSize: 18,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    TextWidget(
                      label:
                          "What skills do you have that are transferrable to your desired job?",
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    SizedBox(height: 10),
                    DropdownWidget(
                      label: "Select",
                      item: [
                        "Design",
                        "Technology",
                        "Marketing",
                        "Medicine",
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ButtonWidget(
                      label: "Next",
                      backgroundColor: tBlueColor,
                      onPressed: () => Navigator.pushNamed(
                        context,
                        CurrentJobScreen.route,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
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
