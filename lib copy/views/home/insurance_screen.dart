import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tagumpai/provider/api_provider.dart';

import '../../constants/global_variables.dart';
import '../../widgets/text_widget.dart';

class InsuranceScreen extends StatefulWidget {
  static String route = "insuranceScreen";
  const InsuranceScreen({super.key});

  @override
  State<InsuranceScreen> createState() => _InsuranceScreenState();
}

class _InsuranceScreenState extends State<InsuranceScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ApiProvider>(context, listen: false)
          .fetchApi("insuranceList");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    label: "Why You Need Insurance",
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  TextWidget(
                    label:
                        "Insurance provides peace of mind and financial protection against unexpected events like accidents, illnesses, or natural disasters. Invest in insurance today to protect yourself, your family, and your assets.",
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFB1C3E3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23),
                  topRight: Radius.circular(23),
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Image.asset(tInsuranceVector),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          label: "Freedom Health Insurance",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF022E7C),
                        ),
                        TextWidget(
                          label: "\$2300 per year",
                          color: Color(0xFF2E5EB4),
                          fontSize: 13,
                        ),
                        TextWidget(
                          label:
                              "Life stage benefit\nOption to increase over after\nMarriage,1st & 2nd child birth",
                          fontSize: 14,
                          color: Color(0xFF022E7C),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
