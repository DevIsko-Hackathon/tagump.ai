import 'package:flutter/material.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/views/personalized/preparing_screen.dart';
import 'package:tagumpai/views/switch_career/previous_job_screen.dart';
import 'package:tagumpai/views/switch_career/target_company_screen.dart';
import 'package:tagumpai/widgets/button_widget.dart';
import 'package:tagumpai/widgets/dropdown_widget.dart';
import 'package:tagumpai/widgets/form_widget.dart';
import 'package:tagumpai/widgets/text_widget.dart';

class CurrentJobScreen extends StatefulWidget {
  static String route = "currentJobScreen";
  const CurrentJobScreen({super.key});

  @override
  State<CurrentJobScreen> createState() => _CurrentJobScreenState();
}

class _CurrentJobScreenState extends State<CurrentJobScreen> {
  final TextEditingController _jobTitleController = TextEditingController();
  final ValueNotifier<String?> _currentIndustry = ValueNotifier(null);

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
                      child: Divider(
                        color: tBlueColor,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        label: "What is your preferred industry?",
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
                        valueNotifier: _currentIndustry,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      FormWidget(
                        controller: _jobTitleController,
                        hintText: "Placeholder",
                        prompText: "What is your desired job title?",
                        fontSize: 18,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      ButtonWidget(
                        label: "Next",
                        backgroundColor: tBlueColor,
                        onPressed: () => Navigator.pushNamed(
                          context,
                          TargetCompanyScreen.route,
                        ),
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
