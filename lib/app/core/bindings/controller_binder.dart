
import 'package:get/get.dart';
import 'package:real_state_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:real_state_app/app/modules/explore/controllers/explore_controller.dart';
import 'package:real_state_app/app/modules/home/controllers/home_controller.dart';
import 'package:real_state_app/app/modules/nevbar/controllers/nevbar_controller.dart';
import 'package:real_state_app/app/modules/on_boarding/controllers/on_boarding_controller.dart';
import 'package:real_state_app/app/modules/splash/controllers/splash_controller.dart';

import '../../modules/setting/controllers/setting_controller.dart';

class IntBinding extends Bindings {
  @override
  void dependencies() {

    //Get.put(SplashController(), permanent: true);
    Get.put(OnBoardingController(), permanent: true);
    Get.put(AuthController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.lazyPut<SplashController>(
          () => SplashController(),
      fenix: true,
    );
    // Get.lazyPut<OtpVerifyController>(
    //       () => OtpVerifyController(),
    //   fenix: true,
    // );
    // Get.lazyPut<ForgetPassController>(
    //       () => ForgetPassController(),
    //   fenix: true,
    // );
    Get.lazyPut<NevbarController>(
          () => NevbarController(),
      fenix: true,
    );
    Get.lazyPut<ExploreController>(
          () => ExploreController(),
      fenix: true,
    );
    // Get.lazyPut<ProfileController>(
    //       () => ProfileController(),
    //   fenix: true,
    // );
    Get.lazyPut<SettingController>(
          () => SettingController(),
      fenix: true,
    );

  }
}