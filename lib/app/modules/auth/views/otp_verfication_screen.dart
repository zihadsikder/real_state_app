import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/constants/app_validator.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controllers/otp_verification_controller.dart';


class OtpVerificationScreen extends GetView<OtpVerifyController> {
  const OtpVerificationScreen({super.key});

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
                text: 'Verificar cuenta',
                fontSize: 32,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  textAlign: TextAlign.center,
                  text:
                      'El código ha sido enviado a johndoe@gmail.com.\n Introduzca el código para verificar tu cuenta.',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff232323),
                ),
              ),
              SizedBox(height: 36),
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: 'Introducir código',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff232323),
                ),
              ),
              SizedBox(height: 8),

              CustomTextField(
                controller: controller.otpTEController,
                hintText: 'Código de 4 dígitos',
                keyboardType: TextInputType.emailAddress,
                // Keyboard type for email input
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Un Código est requis.';
                  } else {
                    return AppValidator.validateEmail(value);
                  }
                },
              ),

              SizedBox(height: 24),
              Obx(
                () {
                  return Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: '¿No recibiste el código? ',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textPrimary,
                        ),
                        GestureDetector(
                          onTap: controller.isClickable.value
                              ? () {
                                  controller.resetTimer();
                                  // Trigger resend SMS logic here
                                }
                              : null,
                          child: Text(
                            'Reenviar código',
                            style: TextStyle(

                              decorationThickness: 1,

                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: controller.isClickable.value
                                  ? const Color(0xff1C1C1C)
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: 12),
              Obx(
                () {
                  return Align(
                    alignment: Alignment.center,
                    child: CustomText(
                      text: controller.isClickable.value
                          ? 'Reenviar código en '
                          : 'Reenviar código en ${controller.formatTime(controller.secondsRemaining.value)}',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textPrimary,
                    ),
                  );
                },
              ),

              const Spacer(),

              /// button
              CustomButton(
                onPressed: controller.verifyOtp,
                //onPressed: () {},
                title: "Verificar cuenta",
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
