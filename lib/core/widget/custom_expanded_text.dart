import 'package:flutter/material.dart';

class CustomExpandedText extends StatelessWidget {
  const CustomExpandedText({
    super.key,
    required this.title,
    this.fontWeight, this.color,
  });
  final String title;
  final FontWeight? fontWeight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 17,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
