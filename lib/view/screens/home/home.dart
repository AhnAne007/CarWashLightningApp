// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:car_wash_light/controllers/home/home_controller.dart';
import 'package:car_wash_light/view/widget/custom_circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../core/globals/global_variables.dart';
import '../../widget/Custom_text_widget.dart';
import '../../widget/common_image_view_widget.dart';
import 'Custom_Container_Tile_widget.dart';
import 'inbay.dart';
import 'selfbay.dart';
import 'tunnel.dart';
import 'vaccum.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenWidth * 0.25,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff033333),
        title: Row(
          children: [
            Obx(() => imageSubject.value == null
                ? CircleAvatar(
                  backgroundImage: AssetImage(Assets.imagesProfile),
                  backgroundColor: kSecondaryColor,
                  radius: 25,
                )
                : CircleAvatar(
              backgroundImage:
              FileImage(imageSubject.value ?? File('')),
              backgroundColor: Colors.transparent,
              radius: 25,
            )),


            // Image.asset(
            //   Assets.imagesProfile,
            //   height: screenWidth * 0.14,
            //   width: screenWidth * 0.14,
            // ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: "Hello Admin",
                      size: screenWidth * 0.06,
                      weight: FontWeight.w700,
                      color: kSecondaryColor,
                      paddingRight: screenWidth * 0.01,
                    ),
                    CommonImageView(
                      imagePath: Assets.imagesHand,
                      height: screenWidth * 0.05,
                      fit: BoxFit.contain,
                    )
                  ],
                ),
                CustomText(
                  text: "Welcome to Car Wash Lights",
                  size: screenWidth * 0.03,
                  weight: FontWeight.w400,
                  color: kGreyColor,
                  paddingRight: screenWidth * 0.01,
                ),
              ],
            ),
            Spacer(),
            Obx(
              () => homeController.deviceSearchLoading.value
                  ? CustomCircularIndicator(
                      indicatorColor: kSecondaryColor,
                      containerColor: Colors.transparent,
                    )
                  : IconButton(
                      onPressed: () {
                        homeController.showLoadingOfDevices();
                      },
                      icon: Image.asset(
                        Assets.imagesAdd,
                        height: screenWidth * 0.09,
                      ),
                    ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xff033333),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        width: screenWidth * 1.0,
        height: screenWidth * 1.65,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.07,
            vertical: screenWidth * 0.09,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomContainearTile(
                    portionID: "3vsoeFQiZfNnkzoo1w4N",
                    imagePath: Assets.imagesGard,
                    text: "Tunnels /Bay Lighting",
                    onTap: () {
                      Get.to(() => Tunnel());
                    },
                  ),
                  SizedBox(
                    width: screenWidth * 0.035,
                  ),
                  CustomContainearTile(
                    portionID: "3vsoeFQiZfNnkzoo1w4N",
                    imagePath: Assets.imagesVaccum,
                    text: "Vacuum Arches",
                    onTap: () {
                      Get.to(() => Vaccum());
                    },
                  ),
                ],
              ),
              SizedBox(
                height: screenWidth * 0.045,
              ),
              Row(
                children: [
                  CustomContainearTile(
                    portionID: "Y4w2Ug6oO3e9Gn5E947i",
                    imagePath: Assets.imagesBay,
                    text: "In-Bay Automatic",
                    onTap: () {
                      Get.to(() => Inbay());
                    },
                  ),
                  SizedBox(
                    width: screenWidth * 0.035,
                  ),
                  CustomContainearTile(
                    portionID: "3vsoeFQiZfNnkzoo1w4N",
                    imagePath: Assets.imagesServebay,
                    text: "Self Serve Bays",
                    onTap: () {
                      Get.to(() => Selfbay());
                    },
                  ),
                ],
              ),
              SizedBox(
                height: screenWidth * 0.08,
              ),
              CommonImageView(
                imagePath: Assets.imagesImage,
                height: screenWidth * 0.4,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
