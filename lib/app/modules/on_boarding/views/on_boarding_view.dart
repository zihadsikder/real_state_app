import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:real_state_app/app/modules/on_boarding/views/widgets/on_boarding_page.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/config/image_path.dart';
import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: controller.updatePageIndicator,
              children: const [
                OnboardingPage(
                  image: ImagePath.onb1,
                  title: "¡Bienvenidos a\n FIDELIA!",
                  subtitle:
                  "¡Bienvenido a bordo! \nCon FIDELIA, ganar recompensas y gestionar tu rendimiento de ventas nunca ha sido tan fácil.\n\nConfigura tu cuenta y comienza a disfrutar de todos los beneficios. ¡Vamos allá!",
                  buttonText: "Siguiente",
                  showSkip: true,
                ),
                OnboardingPage(
                  image: ImagePath.onb2,
                  title: "Registro sin inconvenientes",
                  subtitle:
                  "Regístrate con tu correo electrónico y crea una cuenta segura. Es rápido y fácil. ¡Tu viaje hacia las recompensas comienza ahora!",
                  buttonText: "Siguiente",
                  showSkip: true,
                ),
                // Last page content with two buttons
              ],
            ),
          ),
          // Hide regular skip and next button on the last page
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!controller.isLastPage) ...[
                  GestureDetector(
                    onTap: controller.skipPage,
                    child: const Text(
                      'Saltar',
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
                Row(
                  children: List.generate(
                    2,
                        (index) => Obx(
                          () => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: controller.selectedPageIndex.value == index
                              ? AppColors.primary
                              : AppColors.secondary,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: controller.nextPage,
                  child: const Row(
                    children: [
                      Text(
                        'Siguiente',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.primary,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
