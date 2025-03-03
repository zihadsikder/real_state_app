import 'package:flutter/material.dart';

import '../../../../core/config/app_colors.dart';
import '../../../../core/widgets/custom_text.dart';


class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String buttonText;
  final String? secondaryButtonText;
  final bool showSkip;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    this.secondaryButtonText,
    this.showSkip = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image,height:220 ,width: 260,),
                SizedBox(height: 50),
                CustomText(
                  textAlign: TextAlign.center,
                  text: title,
                  color: AppColors.textPrimary,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 16),
                CustomText(
                  textAlign: TextAlign.center,
                  color: AppColors.textSecondary,
                  text: subtitle,
                  fontSize: 16,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
