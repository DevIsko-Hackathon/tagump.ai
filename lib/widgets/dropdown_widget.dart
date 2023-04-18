import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tagumpai/constants/global_variables.dart';
import 'package:tagumpai/widgets/text_widget.dart';

class DropdownWidget extends StatefulWidget {
  final ValueNotifier<String?> valueNotifier;
  final List<String> item;
  final String label;
  const DropdownWidget({
    super.key,
    required this.item,
    required this.label,
    required this.valueNotifier,
  });

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: boxShadow,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: TextWidget(
            label: widget.label,
            color: tGrayColor,
          ),
          value: value,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down),
          items: widget.item.map(buildMenuItem).toList(),
          onChanged: (value) {
            setState(() {
              this.value = value;
            });
            widget.valueNotifier.notifyListeners();
          },
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: TextWidget(
        label: item,
        color: Colors.black,
      ),
    );
  }
}
