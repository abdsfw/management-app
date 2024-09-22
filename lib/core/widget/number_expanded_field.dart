import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberExpandedField extends StatelessWidget {
  const NumberExpandedField({
    super.key,
    this.inputFormatters,
    this.readOnly = false,
    required this.content,
  });
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: SizedBox(
          // width: 70,
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: readOnly ? Colors.grey : Colors.black,
              ),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: TextFormField(
              controller: TextEditingController(text: content),
              inputFormatters: inputFormatters,
              readOnly: readOnly,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
