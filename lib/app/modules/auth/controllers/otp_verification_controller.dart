import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/widgets/App_snacber.dart';
import '../../../services/Auth_service.dart';
import '../../../services/app_urls.dart';
import '../../../services/network_caller.dart';


class OtpVerifyController extends GetxController {
  final TextEditingController otpTEController = TextEditingController();
  RxInt secondsRemaining = 60.obs;
  RxBool isClickable = false.obs;

  late final Timer _timer;
  final isLoading = true.obs;
  String? email;
  String? fromScreen;

  @override
  void onInit() {
    if (Get.arguments != null) {
      email = Get.arguments["user_email"];
      fromScreen = Get.arguments["form_screen"];
    }
    super.onInit();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsRemaining.value > 0) {
        secondsRemaining.value--;
      } else {
        isClickable.value = true;
        _timer.cancel();
      }
    });
  }

  void resetTimer() {
    secondsRemaining.value = 60;
    isClickable.value = false;
    _startCountdown();
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  void verifyOtp() async {
    // if (fromScreen == AppRoute.resetPasswordScreen){
    //Get.toNamed(AppRoute.bottomNevScreen);
    // }else{
    //   //Get.toNamed(AppRoute.verificationSuccess);
    // }

    // if (otpController.text.isEmpty || otpController.text.length != 4) {
    //   AppSnackBar.showCustomErrorSnackBar(
    //       title: "Error", message: 'Please enter a valid 6-digit OTP');
    //   return;
    // }
    //
    // final Map<String, dynamic> requestBody = {
    //   "email": email,
    //   'otp': otpController.text.trim(),
    // };
    //
    // try {
    //   Get.dialog(
    //     Center(
    //       child: SpinKitFadingCircle(
    //         color: AppColors.primary,
    //         size: 50.sp,
    //       ),
    //     ),
    //     barrierDismissible: false,
    //   );
    //
    //   // API Call
    //   final response = await NetworkCaller().postRequest(
    //     AppUrls.verifyOtp,
    //     body: requestBody,
    //     token: AuthService.token,
    //   );
    //   if (response.isSuccess) {
    //     String? token = response.responseData['data']['token'];
    //     if (token != null) {
    //       await AuthService.token;
    //
    //       //   if (fromScreen == AppRoute.signupScreen) {
    //       //     response.responseData['data']['role'] == 'Customer'?
    //       //     await Get.to(() => const UserNavBar()):
    //       //     await Get.to(() => const DriverNavBar());
    //       //   } else {
    //       //     await Get.off(()=> ChangePasswordScreen());
    //       //   }
    //       // } else {
    //       //   AppSnackBar.showCustomErrorSnackBar(
    //       //       title: "Error",
    //       //       message: 'Failed to retrieve token. Please try again.');
    //     }
    //   } else {
    //     AppSnackBar.showCustomErrorSnackBar(
    //         title: "Error", message: response.errorMessage);
    //   }
    // } catch (e) {
    //   AppSnackBar.showCustomErrorSnackBar(
    //       title: "Error",
    //       message: 'Something went wrong. Please try again later.');
    // } finally {
    //   // Ensure dialog is closed
    //   if (Get.isDialogOpen == true) {
    //     Get.back();
    //   }
    // }
  }

  void resendOtp() async {
    secondsRemaining.value = 60;
    isClickable.value = false;
    _startCountdown();

    final Map<String, dynamic> requestBody = {
      "email": email,
      'otp': otpTEController.text.trim(),
    };
    if (email != null) {
      final response = await NetworkCaller().postRequest(
        AppUrls.verifyOtp,
        body: requestBody,
        token: AuthService.token,
      );
      isLoading.value = false;
      if (response.isSuccess) {
        AppSnackBar.showCustomSnackBar(
            title: "Success",
            message: 'OTP Resent successfully. Please check your email.');
      } else {
        AppSnackBar.showCustomErrorSnackBar(
            title: "Error",
            message: 'Failed to send reset email. Please try again.');
      }
    }
  }
}
