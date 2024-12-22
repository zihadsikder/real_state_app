import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_state_app/app/core/constants/app_icons.dart';
import 'package:real_state_app/app/core/widgets/custom_text.dart';
import 'package:real_state_app/app/modules/home/views/widgets/property_card.dart';

import '../../../core/config/app_colors.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    controller.tabController = tabController;
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location and Notification Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                          text: 'Location',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.hintTextColor),
                      Obx(() => DropdownButton<String>(
                            value: controller.selectedLocation.value,
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: AppColors.hintTextColor,
                            ),
                            items: ["Jakarta", "Bandung", "Bali"]
                                .map((location) => DropdownMenuItem(
                                      value: location,
                                      child: Text(
                                        location,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              controller.selectedLocation.value = value!;
                            },
                            underline: SizedBox.shrink(),
                          )),
                    ],
                  ),
                  Image.asset(AppIcons.notification),
                ],
              ),

              SizedBox(height: 16),

              // Search Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search address, or near you",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 16,
                          color: Color(0xff858585),
                        ),
                        fillColor: Color(0xffF7F7F7),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(AppIcons.filter),
                  )
                ],
              ),

              SizedBox(height: 16),

              // TabBar with Custom Styling
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TabBar(
                  controller: tabController,
                  onTap: (index) {
                    final categories = ["House", "Apartment", "Hotel", "Villa"];
                    controller.selectedCategory.value = categories[index];
                  },
                  dividerHeight: 0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  //isScrollable: true,
                  indicator: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Color(0xff858585),
                  tabs: [
                    Tab(text: "House"),
                    Tab(text: "Apartment"),
                    Tab(text: "Hotel"),
                    Tab(text: "Villa"),
                  ],
                ),
              ),

              // TabBarView Content
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          PropertyCard(),
                          SizedBox(height: 20),
                          PropertyCard(), // Add more content as needed
                        ],
                      ),
                    ),
                    Center(child: Text("Apartment Content")),
                    Center(child: Text("Hotel Content")),
                    Center(child: Text("Villa Content")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
