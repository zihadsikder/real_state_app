import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:real_state_app/app/core/config/app_colors.dart';
import 'package:real_state_app/app/core/constants/app_images.dart';

import '../../../../core/constants/app_icons.dart';
import '../../../../core/widgets/custom_text.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              SizedBox(
                height: 304,
                width: double.infinity,
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(right: 20), // Space between cards
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("assets/images/house22.jpeg"),
                      // Replace with your image asset
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Top-right location icon and distance
                      Positioned(
                        top: 20,
                        left: 16,
                        child: Container(
                            width: 36,
                            height: 36,
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                            ),
                            // Inner padding
                            decoration: BoxDecoration(
                                color: Color(0xff000000).withOpacity(0.24),
                                shape: BoxShape.circle),
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: AppColors.bgColor,
                                    size: 16,
                                  )),
                            )),
                      ),
                      Positioned(
                        top: 20,
                        right: 16,
                        child: Container(
                            width: 36,
                            height: 36,
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            // Inner padding
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff000000).withOpacity(0.24),
                            ),
                            child: Image.asset(AppIcons.bookmark)),
                      ),

                      // Bottom-left house name and subtitle
                      Positioned(
                        bottom: 16,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Dreamsville House',
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 4),
                            CustomText(
                              text: 'Jl. Sultan Iskandar Muda, Jakarta Selatan',
                              fontSize: 12,
                              color: Color(0xffD7D7D7),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Image.asset(AppIcons.bedroom,
                                    width: 28, height: 28),
                                SizedBox(width: 4),
                                CustomText(
                                  text: "6 Bedroom",
                                  fontSize: 12,
                                  color: AppColors.bgColor,
                                ),
                                SizedBox(width: 32),
                                Image.asset(AppIcons.bathroom,
                                    width: 28, height: 28),
                                SizedBox(width: 4),
                                CustomText(
                                  text: "4 Bathroom",
                                  fontSize: 12,
                                  color: AppColors.bgColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Description
              CustomText(
                  text: 'Description',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'The 3-level house that has a modern design, has a large pool and a garage that fits up to four cars... ',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.hintTextColor,
                      ),
                    ),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          // Add your onTap functionality here
                        },
                        child: Text(
                          'Show More',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Owner Details
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xffb1bfcb),
                      shape: BoxShape.circle, // Keep this for circular shape
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        AppImage.user,
                        height: 12,
                        width: 12,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: "Garry Allen",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      CustomText(
                          text: "Owner",
                          fontSize: 12,
                          color: AppColors.hintTextColor),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                      onTap: () {}, child: Image.asset(AppIcons.phone)),
                  SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                      onTap: () {}, child: Image.asset(AppIcons.message)),
                ],
              ),
              SizedBox(height: 32),

              CustomText(
                text: "Gallery",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 88,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage("assets/images/room.png"),
                              // Replace with actual image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        if (index == 4) // For the "+5" overlay on the last item
                          Container(
                            width: 72,
                            height: 72,
                            margin: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black.withOpacity(0.5),
                            ),
                            child: Center(
                              child: Text(
                                "+5",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),

              SizedBox(height: 16),

              // Map and Price
              Stack(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        AppImage.map, // Replace with the actual map
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0.01,
                    // Add this to make space for the button
                    child: SizedBox(
                      width: 360,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Price",
                                fontSize: 12,
                                color: AppColors.hintTextColor,
                              ),
                              CustomText(
                                text: "Rp. 2.500.000.000/ Year",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {},
                            child: CustomText(
                              text: "Rent Now",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
