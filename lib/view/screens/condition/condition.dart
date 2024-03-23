// ignore_for_file: prefer_const_constructors

import 'package:car_wash_light/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../widget/Custom_text_widget.dart';
import 'Custom_Condition_Widget.dart';
import 'light_Scene_Selection.dart';

class ConditionPage extends StatelessWidget {
  ConditionPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    HomeController homeController = Get.find();
    List<Map<String, String>> conditions = [
      {"condition": "Device 1", "description": "Motion Sensor"},
      {"condition": "Device 2", "description": "24V Trigger"},
      {"condition": "Device 3", "description": "24V Trigger"},
      {"condition": "Device 4", "description": "24V Trigger"},
      {"condition": "Device 5", "description": "24V Trigger"},
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: CustomText(
          text: "Condition",
          size: screenWidth * 0.05,
          weight: FontWeight.w700,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.055,
          vertical: screenHeight * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text:
                  "These are available triggers that can be used to have your lights change scenes.  Once a trigger is activated, then next light show will play.",
              size: screenWidth * 0.033,
              color: kDarkGreyColor,
            ),
            CustomText(
              text: "Existing Trigger Devices",
              size: screenWidth * 0.033,
              paddingTop: screenHeight * 0.016,
              paddingBottom: screenHeight * 0.02,
              color: kTertiaryColor,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Condition",
                        size: screenWidth * 0.035,
                        color: kDarkGreyColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.015,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Description",
                        size: screenWidth * 0.035,
                        color: kDarkGreyColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.02,
                ),
                Expanded(
                  child: Column(
                    children: [
                      CustomText(
                        text: "Name",
                        size: screenWidth * 0.035,
                        color: kDarkGreyColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.05,
                ),
                Column(
                  children: [
                    CustomText(
                      text: "Edit",
                      size: screenWidth * 0.035,
                      color: kDarkGreyColor,
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: homeController.conditions.length,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomCondition(
                            condition: conditions[index]["condition"]!,
                            description: conditions[index]["description"]!,
                            onEditTap: () {
                              homeController.selectedConditionModel.value =
                                  homeController.conditions.value[index];
                              print( homeController.selectedConditionModel.value.id);
                              print(homeController.selectedConditionModel.value.hexColorCodes);
                             // await homeController.getlightsColors();
                              Get.to(() => LightSceneSelection());
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  await homeController.getConditions(
                      "3vsoeFQiZfNnkzoo1w4N", "PI03xbM2cypMcnuSHgZO");
                },
                child: Text("REFRESH"))
          ],
        ),
      ),
    );
  }
}
