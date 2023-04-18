import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/widgets/button_widget.dart';
import 'package:tagumpai/widgets/card_widget.dart';
import 'package:tagumpai/widgets/text_widget.dart';

class Companies extends StatelessWidget {
  const Companies({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardBorderWidget(
            color: tBlueishColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    tCompany1,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        label: "Company Name",
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                      TextWidget(
                        label: "ESTD 2019",
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      TextWidget(
                        label:
                            "Yorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.,",
                        color: Colors.white,
                        fontSize: 8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: CardBorderWidget(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        label: "About Us",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: tDarkBlueColor,
                      ),
                      TextWidget(
                        label:
                            "A UI UX designer is a professional who identifies new opportunities to create better user experiences. desired outcomes.",
                        fontSize: 8,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: CardBorderWidget(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        label: "Mission",
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: tDarkBlueColor,
                      ),
                      TextWidget(
                        label:
                            "A UI UX designer is a professional who identifies new opportunities to create better user experiences. desired outcomes.",
                        fontSize: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CardWidget(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        label: "Not sure if this company is the one for you?",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ButtonWidget(
                        label: "Explore other companies",
                        fontSize: 12,
                        onPressed: () {},
                        backgroundColor: tBlueColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Image.asset(
                  tCompanyBanner,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class CardBorderWidget extends StatelessWidget {
  Widget child;
  Color? color;
  CardBorderWidget({
    super.key,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: tBlueColor,
        ),
      ),
      child: child,
    );
  }
}
