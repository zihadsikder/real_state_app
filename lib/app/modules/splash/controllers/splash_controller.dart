import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/config/image_path.dart';

class SplashController extends GetxController  with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();
    setupAnimations();
    navigateToHomeScreen();
    preloadImages();
  }

  void preloadImages() {
    precacheImage(const AssetImage(ImagePath.onb1), Get.context!);
    precacheImage(const AssetImage(ImagePath.onb2), Get.context!);
    precacheImage(const AssetImage(ImagePath.appLogo), Get.context!);
  }

  void setupAnimations() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4500),
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOutBack),
    );

    animationController.forward();
  }

  void navigateToHomeScreen() {
    Future.delayed(
      const Duration(milliseconds: 1500),
          () {
        // Get.offAll(
        //       () => OnboardingScreen(),
        //   transition: Transition.fade,
        //   duration: const Duration(milliseconds: 300),
        //   curve: Curves.easeOut,
        // );
      },
    );
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}