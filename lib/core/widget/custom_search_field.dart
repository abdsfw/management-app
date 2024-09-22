import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    this.controller,
    required this.hintText,
    this.onChange,
    this.onTap,
    this.validator,
    this.inputFormatters,
    this.width = 250,
    this.autoFocus = true,
  });
  final TextEditingController? controller;
  final String hintText;
  final Function(String x)? onChange;
  final Function()? onTap;
  final String? Function(String? x)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final double? width;
  final bool autoFocus;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: width,
      // height: 60,
      child: TextFormField(
        controller: controller,
        onTapOutside: (event) {
          if (autoFocus) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        decoration: InputDecoration(
          // focusColor: AppColors.black,
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10),
          // ),
        ),
        // keyboardType: TextInputType.numberWithOptions(decimal: true),
        textInputAction: TextInputAction.go,
        onTap: onTap,
        validator: validator,
        onChanged: onChange,
        inputFormatters: inputFormatters,
      ),
    );
  }
}
