import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();

  bool get isLastPage => selectedPageIndex.value == 1;

  void skipPage() {
    //Get.offAllNamed(AppRoute.roleSelectionScreen);
  }

  void updatePageIndicator(int index) {
    selectedPageIndex.value = index;
  }

  void nextPage() {
    if (isLastPage) {
      //Get.offAllNamed(AppRoute.roleSelectionScreen);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }
}
