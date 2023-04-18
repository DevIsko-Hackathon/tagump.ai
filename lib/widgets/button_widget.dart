import 'package:flutter/material.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Color backgroundColor;
  final Color? color;
  final double? fontSize;
  const ButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
    required this.backgroundColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color ?? tBlueColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            color: Colors.black.withOpacity(0.4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? tBlueColor,
        ),
        child: TextWidget(
          fontSize: fontSize ?? 14,
          label: label,
          color: color ?? Colors.white,
        ),
      ),
    );
  }
}
