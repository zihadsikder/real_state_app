import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../config/app_sizes.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final maxLines;
  final TextOverflow? textOverflow;

  const CustomText(
      {super.key,
      required this.text,
      this.maxLines,
      this.textOverflow,
      this.fontSize,
      this.color,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: fontSize ?? getWidth(14),
          color: color ?? AppColors.bgColor,
          fontWeight: fontWeight ?? FontWeight.w400),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
