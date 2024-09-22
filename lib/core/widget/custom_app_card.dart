import 'package:flutter/material.dart';

class CustomAppCard extends StatelessWidget {
  const CustomAppCard({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: child,
      ),
    );
  }
}
