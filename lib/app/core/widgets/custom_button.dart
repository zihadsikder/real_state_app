
import 'package:flutter/material.dart';

import '../config/app_colors.dart';
import '../config/icon_path.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.onPressed,
      this.buttonColor = AppColors.primary,
      this.buttonTextColor = Colors.white,
      required this.title,
      this.borderColor,
      this.isIcon = true,
        this.iconColor = AppColors.white,
       this.radius = 10.0, this.height = 44,
       this.icon
      });

  final VoidCallback onPressed;
  final dynamic buttonColor, borderColor, iconColor; // Can be either Color or Gradient
  final Color buttonTextColor;
  final double radius, height;
  final String title;
  final String? icon;
  bool isIcon;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        //padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          gradient: buttonColor is Gradient ? buttonColor : null,
          // Use gradient if provided
          color: buttonColor is Color ? buttonColor : const Color(0xff403B3E),
          // Default color if no gradient is passed
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            width: 1,
            color: borderColor ??
                AppColors
                    .primary, // Use borderColor if provided or fallback to default
          ),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: buttonTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  height: 22 / 16,
                  letterSpacing: -0.6,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(width: 12),
              if (isIcon == false)
                Image.asset(
                  icon ?? IconPath.arrowRight,
                  width: 17,
                  height: 11,
                  color: iconColor,
                )
            ],
          ),
        ),
      ),
    );
  }
}
