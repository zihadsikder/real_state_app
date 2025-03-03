import 'package:get/get.dart';

import '../controllers/nevbar_controller.dart';

class NevbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NevbarController>(
      () => NevbarController(),
    );
  }
}
