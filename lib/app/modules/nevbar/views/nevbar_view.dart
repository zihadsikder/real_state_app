import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/config/icon_path.dart';
import '../controllers/nevbar_controller.dart';

class NevbarView extends GetView<NevbarController> {
  const NevbarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.screens[controller.currentIndex]),
      bottomNavigationBar:
      Obx(() {
        return BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex,
          selectedItemColor: const Color(0xff0C0B0B),
          unselectedItemColor: const Color(0xff6B7280),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: controller.changeIndex,
          items: <BottomNavigationBarItem>[
            customBottomNavigationBarItem(
              iconPath: IconPath.home,
              activeIconPath: IconPath.home2,
              isActive: controller.currentIndex == 0, label: 'Inicio',
            ),
            customBottomNavigationBarItem(
              iconPath: IconPath.ventas,
              activeIconPath: IconPath.ventas2,
              isActive: controller.currentIndex == 1, label: 'Ventas',
            ),
            customBottomNavigationBarItem(
              iconPath: IconPath.growth,
              activeIconPath: IconPath.growth2,
              isActive: controller.currentIndex == 2, label: 'Productos',
            ),
            customBottomNavigationBarItem(
              iconPath: IconPath.award,
              activeIconPath: IconPath.award22,
              isActive: controller.currentIndex == 3, label: 'Premios',
            ),
            customBottomNavigationBarItem(
              iconPath: IconPath.setting,
              activeIconPath: IconPath.setting2,
              isActive: controller.currentIndex == 4,
              label: 'Configuración',
            ),
          ],
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: AppColors.primary,
          ),
        );
      }),

    );
  }

  BottomNavigationBarItem customBottomNavigationBarItem({
    required String iconPath,
    required String activeIconPath,
    required bool isActive,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            isActive ? activeIconPath : iconPath,
          ),
          const SizedBox(height: 4),
          if (isActive)
            Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                  color: AppColors.primary
              ),
            ),
          if (isActive)
            const SizedBox(height: 4),
          if (isActive)
            Container(
              width: 70,
              height: 3,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
        ],
      ),
      label: '',
    );
  }
}