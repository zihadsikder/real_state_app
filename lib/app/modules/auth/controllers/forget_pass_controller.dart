import 'package:flutter/material.dart';
import 'package:get/get.dart';




class ForgetPassController extends GetxController{
  final TextEditingController newPasswordTEController = TextEditingController();
  final TextEditingController confirmPasswordTEController = TextEditingController();
  final TextEditingController phoneTEController = TextEditingController();

  final newPasswordVisible = false.obs;
  final confirmPasswordVisible = false.obs;


  void toggleNewPasswordVisibility() {
    newPasswordVisible.value = !newPasswordVisible.value;
  }
  void toggleConfirmPasswordVisibility() {
    confirmPasswordVisible.value = !confirmPasswordVisible.value;
  }

  void forgetPass() async {
    //Get.toNamed(AppRoute.otpVerificationScreen);
  }
}