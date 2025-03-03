import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/config/image_path.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xffF9D2E0), // Figma background color
          body: Stack(
            fit: StackFit.expand,
            children: [
              // Background gradient (update if needed to match the Figma gradient)
              Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.linearGradient, // Ensure this matches Figma's background gradient
                ),
              ),
              // Animated logo with adjustments from Figma design
              Center(
                child: Image.asset(
                  ImagePath.appLogo,
                  fit: BoxFit.contain,
                  height: 150, // Adjust the height based on the Figma design
                  width: 200,  // Adjust the width based on the Figma design
                ),
              ),
              // Loading indicator (positioning might be adjusted based on Figma)
              Positioned(
                bottom: 80,  // Adjusted from 100 to match Figma
                left: 0,
                right: 0,
                child: FadeTransition(
                  opacity: controller.fadeAnimation,
                  child: Column(
                    children: [
                      Center(
                        child: SpinKitFadingCircle(
                          color: const Color(0xff760a13),  // Ensure primary color matches Figma
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}