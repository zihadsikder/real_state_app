

import 'package:flutter/material.dart';

import '../config/app_colors.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.readOnly = false, this.prefixIcon,
   this.fillColor, this.maxLine =1,this.radius = 8, // Default to TextInputType.text
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final dynamic fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool readOnly;
  final int maxLine;
  final double radius;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: TextFormField(
        maxLines:maxLine ,
        readOnly: readOnly,
        keyboardType: keyboardType, // Use optional keyboard type
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 20 / 14,
            //letterSpacing: -0.6,
            fontFamily: 'Poppins',
          ),
          fillColor:fillColor ?? Colors.transparent, // Make background transparent
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.borderColor, width: 1),
            borderRadius: BorderRadius.circular(radius)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.borderColor, width: 1),
              borderRadius: BorderRadius.circular(radius)
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
        ),
        validator: validator,
      ),
    );
  }
}
