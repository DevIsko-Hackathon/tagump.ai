import 'package:flutter/material.dart';
import 'package:tagumpai/widgets/text_widget.dart';

class FormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? prompText;
  final double fontSize;
  bool obscureText;
  final String? Function(String?)? validator;
  FormWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.prompText,
    this.fontSize = 14,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          label: prompText ?? "",
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: Container(
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 15,
                    spreadRadius: 2,
                    color: Colors.black.withOpacity(0.10),
                  ),
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 2,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ]),
            child: TextFormField(
              obscureText: obscureText,
              validator: validator,
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
