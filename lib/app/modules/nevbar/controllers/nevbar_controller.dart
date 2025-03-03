import 'package:get/get.dart';
import 'package:real_state_app/app/modules/home/views/home_view.dart';

class NevbarController extends GetxController {
  var selectedIndex = 0.obs;

  int get currentIndex => selectedIndex.value;

  @override
  void onInit() {
    super.onInit();
  }

  List screens = [
    const HomeView(),
    HomeView(),
    const HomeView(),
    HomeView(),
    const HomeView(),
  ];

  void changeIndex(int index) {
    if (selectedIndex.value == index) {
      return;
    }

    selectedIndex.value = index;
  }

  void backToHome() {
    changeIndex(0);
  }
}
