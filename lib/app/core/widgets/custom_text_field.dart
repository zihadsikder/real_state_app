import 'package:flutter/material.dart';

class CustomesTextField extends StatelessWidget {
  CustomesTextField(
      {super.key,
        this.onChanged,
        required this.controller,
        this.prefixIcon,
        this.suffixIcon,
        this.hintText,
        this.labelText,
        this.obscureText = false,
        this.isFillColor,
        this.fillColor,
        this.radius = 10,
        this.height = 48
      });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon; // Callback for text change
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final double? radius, height ;
  final bool? isFillColor;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: height != null?

      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: fillColor??const Color(0xff36364D).withOpacity(0.05),
          filled: isFillColor,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14,color: Colors.grey),
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),

          /// border
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius!),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade700, width: 2),
            borderRadius: BorderRadius.circular(radius!),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            borderRadius: BorderRadius.circular(radius!),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),

        ),

      ),
    );
  }
}