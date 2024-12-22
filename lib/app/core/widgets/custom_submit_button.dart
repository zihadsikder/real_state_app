import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomSubmitButton extends StatelessWidget {
  const CustomSubmitButton({
    super.key,
    required this.text,
    this.height = 48,
    this.width= 335,
    this.radius = 40,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w500,
    this.textColor = Colors.white,
    this.buttonColor = Colors.red, this.onTap,
  });

  final String text;
  final double? height, width, radius, fontSize;
  final FontWeight? fontWeight;
  final Color? textColor,buttonColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          color: buttonColor,
        ),
        child:  Center(
            child: CustomText(
              text: text,
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            )),
      ),
    );
  }
}