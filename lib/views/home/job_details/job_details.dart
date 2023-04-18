import 'package:flutter/material.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/widgets/card_widget.dart';
import 'package:tagumpai/widgets/text_widget.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    label: "Description:",
                    fontSize: 12,
                    color: tDarkBlueColor,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                    label:
                        "A UI UX designer is a professional who identifies new opportunities to create better user experiences. Aesthetically pleasing branding strategies help them effectively reach more customers. They also ensure that the end-to-end journey with their products or services meets desired outcomes.",
                    fontSize: 10,
                    color: tDarkBlueColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CardWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    label: "Skills Needed:",
                    color: tDarkBlueColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SkillsNeededCard(),
                      SkillsNeededCard(),
                      SkillsNeededCard(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CardWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    label: "Responsibilities",
                    fontSize: 12,
                    color: tDarkBlueColor,
                    fontWeight: FontWeight.w700,
                  ),
                  TextWidget(
                    label: "• Prepares User Journey Maps and UX/ UI Designs.",
                    fontSize: 10,
                    color: tDarkBlueColor,
                  ),
                  TextWidget(
                    label:
                        "• Working with brand style guides to tailor design assets",
                    fontSize: 10,
                    color: tDarkBlueColor,
                  ),
                  TextWidget(
                    label:
                        "• Designing tactical design assets across our CMS-driven websites",
                    fontSize: 10,
                    color: tDarkBlueColor,
                  ),
                  TextWidget(
                    label: "• Developing user interface visuals and layouts",
                    fontSize: 10,
                    color: tDarkBlueColor,
                  ),
                  TextWidget(
                    label:
                        "• This is not a technical role but you will be required to understand functional limitations of both user experience design and web platforms.",
                    fontSize: 10,
                    color: tDarkBlueColor,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class SkillsNeededCard extends StatelessWidget {
  const SkillsNeededCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(
              10,
            ),
            decoration: BoxDecoration(
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
                  spreadRadius: 2,
                  color: Colors.black.withOpacity(0.25),
                ),
              ],
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(Icons.abc),
          ),
          SizedBox(
            height: 10,
          ),
          TextWidget(
            label: "Design",
            fontSize: 10,
            color: tDarkBlueColor,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
