// ignore_for_file: use_key_in_widget_constructors

import 'package:car_wash_light/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import '../../../constants/app_colors.dart';
import '../../widget/Custom_text_widget.dart';
import 'Custom_Color_Selection_Widget.dart';

class LightSceneSelection extends StatelessWidget {
  LightSceneSelection({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    //Having a home controller
    HomeController homeController = Get.find();

    List<Map<String, String>> scenes = [
      {"scenes": "Device 1", "description": "Motion Sensor"},
      {"scenes": "Device 2", "description": "24V Trigger"},
      {"scenes": "Device 3", "description": "24V Trigger"},
      {"scenes": "Device 4", "description": "24V Trigger"},
      {"scenes": "Device 5", "description": "24V Trigger"},
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: CustomText(
          text: "Light Scene Selection",
          size: screenWidth * 0.05,
          weight: FontWeight.w700,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kTertiaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text:
                "Here is a list of light scenes that have been created on your account.  Select a scene you want for this light, or create a new one!",
            size: screenWidth * 0.033,
            paddingLeft: screenWidth * 0.045,
            paddingRight: screenWidth * 0.045,
            paddingTop: screenHeight * 0.02,
            color: kDarkGreyColor,
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.040,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomText(
                    text: "Available Scenes",
                    size: screenWidth * 0.035,
                    color: kDarkGreyColor,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.06,
                ),
                CustomText(
                  text: "Description",
                  size: screenWidth * 0.035,
                  color: kDarkGreyColor,
                ),
                SizedBox(
                  width: screenWidth * 0.1,
                ),
                CustomText(
                  text: "Name",
                  size: screenWidth * 0.035,
                  color: kDarkGreyColor,
                ),
                SizedBox(
                  width: screenWidth * 0.12,
                ),
                CustomText(
                  text: "Edit",
                  size: screenWidth * 0.035,
                  color: kDarkGreyColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              ()=> ListView.builder(
                itemCount: homeController.selectedConditionModel.value.hexColorCodes?.length, //scenes.length,
                itemBuilder: (context, index) {
                  String hexColorCode = homeController.selectedConditionModel.value.hexColorCodes![index];
                  Color color = Color(int.parse(hexColorCode.substring(1, 7), radix: 16) + 0xFF000000);
                  // print("inside list");
                  // print(homeController.selectedConditionModel.value.hexColorCodes![index]);
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomColorSelection(
                          color: color,
                          scenes: scenes[index]["scenes"]!,
                          description: scenes[index]["description"]!,
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
              child: Text("REFRESH")),
        ],
      ),
    );
  }
}
