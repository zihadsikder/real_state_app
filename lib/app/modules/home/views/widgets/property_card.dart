import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:real_state_app/app/core/config/app_colors.dart';
import 'package:real_state_app/app/core/constants/app_icons.dart';
import 'package:real_state_app/app/core/constants/app_images.dart';
import 'package:real_state_app/app/core/widgets/custom_text.dart';
import 'package:real_state_app/app/modules/home/views/screens/property_details_screens.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 27),
        // Near from you section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Near from you",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "See more",
                style: TextStyle(fontSize: 12, color: Color(0xff858585)),
              ),
            ],
          ),
        ),
        SizedBox(height: 27),
        GestureDetector(
          onTap: (){
            Get.to(PropertyDetailsScreen());
          },
          child: SizedBox(
            height: 272, // Adjusted height
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 222, // Adjusted width
                    margin: EdgeInsets.only(right: 20), // Space between cards
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/images/house22.jpeg"), // Replace with your image asset
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Top-right location icon and distance
                        Positioned(
                          top: 20,
                          right: 16,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Inner padding
                            decoration: BoxDecoration(
                              color: Color(0xff000000).withOpacity(0.24),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppIcons.location,
                                  width: 10,
                                  height: 12,
                                ),
                                SizedBox(width: 4),
                                CustomText(
                                  text: '1.8 Km',
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
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
                                text: 'Jl. Sultan Iskandar Muda',
                                fontSize: 12,
                                color: Color(0xffD7D7D7),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 24),

        // Best for you section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Best for you",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "See more",
                style: TextStyle(fontSize: 12, color: Color(0xff858585)),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 16), // Space between items
                child: Row(
                  children: [
                    // Image with rounded corners
                    Container(
                      width: 74,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(AppImage.room),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 12), // Space between image and text
                    // Text content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Orchard House",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          SizedBox(height: 4),
                          CustomText(
                            text: "Rp 2,500,000 / Year",
                            fontSize: 12,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Image.asset(AppIcons.bed, width: 16, height: 16),
                              SizedBox(width: 4),
                              CustomText(
                                text: "8 Bedroom",
                                fontSize: 12,
                                color: AppColors.hintTextColor,
                              ),
                              SizedBox(width: 16),
                              Image.asset(AppIcons.bath, width: 16, height: 16),
                              SizedBox(width: 4),
                              CustomText(
                                text: "4 Bathroom",
                                fontSize: 12,
                                color: AppColors.hintTextColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
