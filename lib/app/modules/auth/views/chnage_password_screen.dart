
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/constants/app_validator.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controllers/forget_pass_controller.dart';


class ChangePasswordScreen extends GetView<ForgetPassController> {
  const ChangePasswordScreen({super.key});

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
                text: 'Crear nueva contraseña',
                fontSize: 24,
                color: AppColors.black,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  textAlign: TextAlign.center,
                  text: 'Por favor ingresa y confirma tu nueva contraseña.\nNecesitará iniciar sesión después de restablecer.',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff232323),
                ),
              ),
              SizedBox(height: 36),
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
                obscureText: !controller.newPasswordVisible.value,
                controller: controller.newPasswordTEController,
                hintText: 'Ingresa tu contraseña',
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.newPasswordVisible.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: controller.toggleNewPasswordVisibility,
                ),
                validator: AppValidator.validatePassword,
              )),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: 'Confirmar contraseña',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff232323),
                ),
              ),
              SizedBox(height: 8),
              Obx(() => CustomTextField(
                obscureText: !controller.confirmPasswordVisible.value,
                controller: controller.confirmPasswordTEController,
                hintText: 'Confirma tu contraseña',
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.confirmPasswordVisible.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.textSecondary,
                  ),
                  onPressed: controller.toggleConfirmPasswordVisibility,
                ),
                validator: AppValidator.validatePassword,
              )),
              const Spacer(),
              /// button
              CustomButton(
                onPressed: controller.forgetPass,
                title: "Restablecer contraseña",
              ),
              SizedBox(height: 24),

            ],
          ),
        ),
      ),
    );
  }
}
