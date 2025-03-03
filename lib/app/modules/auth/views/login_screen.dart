import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../core/config/app_colors.dart';
import '../../../core/config/icon_path.dart';
import '../../../core/constants/app_validator.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controllers/login_controller.dart';
import 'forget_password.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 24),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 1,
                    right: 6,
                  ),
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                    border: Border.all(
                      width: 1,
                      color: AppColors.borderColor,
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: AppColors.textPrimary,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 36),
              GestureDetector(
                onTap: (){
                  log('Login');
                  //Get.toNamed(AppRoute.home);
                },
                child: CustomText(
                  textAlign: TextAlign.center,
                  text: 'Acceso',
                  fontSize: 32,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 36),
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: 'Correo electrónico',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff232323),
                ),
              ),
              SizedBox(height: 8),
              CustomTextField(
                controller: controller.phoneTEController,
                hintText: 'Ingresa tu correo electrónico',
                keyboardType: TextInputType.emailAddress,
                // Keyboard type for email input
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Un e-mail est requis.';
                  } else {
                    return AppValidator.validateEmail(value);
                  }
                },
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: 'Contraseña',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff232323),
                ),
              ),
              SizedBox(height: 8),
              Obx(() => CustomTextField(
                    obscureText: !controller.isPasswordVisible.value,
                    controller: controller.passwordTEController,
                    hintText: 'Ingresa tu contraseña',
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.textSecondary,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                    validator: AppValidator.validatePassword,
                  )),
              SizedBox(height: 12),
              InkWell(
                onTap: () {
                  Get.to(()=> const ForgetPassword());
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: CustomText(
                    text: '¿Has olvidado tu contraseña?',
                    color: const Color(0xffC1272D),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 24),

              /// button
              CustomButton(
                onPressed: controller.signIn,
                title: "Acceso",
              ),
              SizedBox(height: 24),
              CustomText(
                text: 'o iniciar sesión con',
                fontSize: 14,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 34),
              Container(
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                  border: Border.all(
                    width: 1,
                    color: AppColors.borderColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      IconPath.google,
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    const CustomText(
                      text: 'Iniciar sesión con Google',
                      color: Color(0xff4B4B4B),
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              )
              // const Spacer(),
              // OnTapRow(
              //   onTap: () {
              //     Get.toNamed(AppRoute.signUpScreen);
              //   },
              //   textOne: "I don't have a account? ",
              //   textTwo: 'Sign up',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
