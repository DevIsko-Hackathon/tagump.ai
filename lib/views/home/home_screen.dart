import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/widgets/button_widget.dart';
import 'package:tagumpai/widgets/text_widget.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _activeCompanyIndex = 0;
  int _activeJobsIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
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
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextWidget(
                      label: "Greetings, Hannah!",
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    TextWidget(
                      label: "You're here to become a UX/UI Designer!",
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProgressIndicator(),
                  SizedBox(height: 20),
                  InterviewCard(),
                  SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                    label: "Explore more jobs in  your field",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CarouselSlider.builder(
                        options: CarouselOptions(
                            height: 130,
                            viewportFraction: 0.4,
                            enableInfiniteScroll: false,
                            padEnds: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _activeJobsIndex = index;
                              });
                            }),
                        itemCount: 3,
                        itemBuilder: (context, index, realIndex) {
                          return JobCard();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AnimatedSmoothIndicator(
                        activeIndex: _activeJobsIndex,
                        count: 3,
                        effect: JumpingDotEffect(
                          dotWidth: 8,
                          dotHeight: 8,
                          activeDotColor: tBlueColor,
                          dotColor: tGrayColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                    label: "Recommended companies for you",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          height: 130,
                          viewportFraction: 0.4,
                          enableInfiniteScroll: false,
                          padEnds: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _activeCompanyIndex = index;
                            });
                          },
                        ),
                        itemCount: 3,
                        itemBuilder: (context, index, realIndex) {
                          return CompanyCard();
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AnimatedSmoothIndicator(
                        activeIndex: _activeCompanyIndex,
                        count: 3,
                        effect: JumpingDotEffect(
                          dotWidth: 8,
                          dotHeight: 8,
                          activeDotColor: tBlueColor,
                          dotColor: tGrayColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompanyCard extends StatelessWidget {
  const CompanyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
          color: Color(0xFFF3F6FB),
          borderRadius: BorderRadius.circular(20),
        ),
        width: 120,
        height: 120,
        child: Center(
          child: Image.asset(tCompany1),
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  const JobCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: tLightColor,
          borderRadius: BorderRadius.circular(20),
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
        ),
        width: 120,
        height: 120,
        child: Center(
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: CircleAvatar(
                child: Icon(
                  Icons.pending,
                ),
              ),
            ),
            subtitle: TextWidget(
              label: "Graphic Designer",
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}

class InterviewCard extends StatelessWidget {
  const InterviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: tLightColor,
      ),
      child: Row(
        children: [
          Image.asset(tInterviewBanner),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                TextWidget(
                  label: "Want to practice your interview skills?",
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  label: "Click here",
                  backgroundColor: tBlueColor,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: tBlueColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            label: "Congratulations!",
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
          TextWidget(
            label: "You're one step close to achieving your goals!",
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 20,
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
    );
  }
}
