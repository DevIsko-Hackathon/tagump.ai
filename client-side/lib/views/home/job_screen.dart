import 'package:flutter/material.dart';
import 'package:tagumpai/views/home/job_details/companies.dart';
import 'package:tagumpai/views/home/job_details/job_details.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../constants/global_variables.dart';
import '../../widgets/text_widget.dart';

class JobScreen extends StatefulWidget {
  static String route = "jobScreen";
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  final PageController _controller = PageController(initialPage: 0);
  int _selectedPageIndex = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        label: "UX/UI Designer",
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      TextWidget(
                        label: "Php 50,000 - Php 100,000",
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Image.asset(tJobBanner),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: InkWell(
                            onTap: () => _controller.animateToPage(
                              0,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Job Details',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color:
                                        Colors.transparent, // Step 2 SEE HERE
                                    shadows: [
                                      Shadow(
                                        offset: Offset(0, -10),
                                        color: tBlueColor,
                                      ),
                                    ], // Step 3 SEE HERE
                                  ),
                                ),
                                Divider(
                                  color: _selectedPageIndex == 0
                                      ? tDarkBlueColor
                                      : null,
                                  thickness: _selectedPageIndex == 0 ? 3 : 0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: InkWell(
                            onTap: () => _controller.animateToPage(
                              1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Companies',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color:
                                        Colors.transparent, // Step 2 SEE HERE
                                    shadows: [
                                      Shadow(
                                        offset: Offset(0, -10),
                                        color: tBlueColor,
                                      ),
                                    ], // Step 3 SEE HERE
                                  ),
                                ),
                                Divider(
                                  color: _selectedPageIndex == 1
                                      ? tDarkBlueColor
                                      : null,
                                  thickness: _selectedPageIndex == 1 ? 3 : 0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: PageView(
                      controller: _controller,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        JobDetails(),
                        Companies(),
                      ],
                      onPageChanged: (value) {
                        setState(() {
                          _selectedPageIndex = value;
                        });
                      },
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
