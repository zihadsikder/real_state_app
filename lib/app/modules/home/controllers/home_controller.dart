import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late TabController tabController;

  var selectedLocation = "Jakarta".obs;
  var selectedCategory = "House".obs;
}
