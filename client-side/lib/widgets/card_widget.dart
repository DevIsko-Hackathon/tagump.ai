import 'package:flutter/material.dart';

import '../constants/global_variables.dart';

class CardWidget extends StatelessWidget {
  Widget? child;
  Color? color;
  CardWidget({
    super.key,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: color ?? tLightColor,
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
              color: Colors.black.withOpacity(0.25),
            ),
          ]),
      child: child,
    );
  }
}
