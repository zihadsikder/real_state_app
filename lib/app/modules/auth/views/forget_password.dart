import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/constants/app_validator.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controllers/forget_pass_controller.dart';



class ForgetPassword extends GetView<ForgetPassController> {
  const ForgetPassword({super.key});

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
              CustomText(
                textAlign: TextAlign.center,
                text: 'Olvidé mi contraseña',
                fontSize: 24,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  textAlign: TextAlign.center,
                  text: '¡No te preocupes! Introduce tu dirección de correo electrónico a continuación y te enviaremos un código para restablecer la contraseña.',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff232323),
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
              const Spacer(),
              /// button
              CustomButton(
                onPressed: controller.forgetPass,
                title: "Enviar código de reinicio",
              ),
              SizedBox(height: 24),

            ],
          ),
        ),
      ),
    );
  }
}
