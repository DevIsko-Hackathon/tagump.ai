import 'package:flutter/material.dart';

import '../../constants/global_variables.dart';
import '../../widgets/text_widget.dart';

class EditProfile extends StatelessWidget {
  static String route = "editProfile";
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 300,
              ),
              Container(
                height: 180,
                decoration: BoxDecoration(
                  color: tBlueColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              Positioned.fill(
                child: Image.asset(tUserBanner),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
