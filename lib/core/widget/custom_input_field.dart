import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    this.inputFormatters,
    this.controller,
  });
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: inputFormatters,
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}
