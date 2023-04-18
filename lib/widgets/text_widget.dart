import 'package:flutter/material.dart';
import 'package:tagumpai/constants/global_variables.dart';

class TextWidget extends StatelessWidget {
  final String label;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  const TextWidget({
    super.key,
    required this.label,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color ?? tBlueColor,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight,
      ),
    );
  }
}
