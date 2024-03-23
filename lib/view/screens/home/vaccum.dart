// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../widget/Custom_button_widget.dart';
import '../../widget/Custom_text_widget.dart';
import '../../widget/common_image_view_widget.dart';
import 'Custom_Edit_Tile_widget.dart';
import 'edit.dart';

class Vaccum extends StatelessWidget {
  Vaccum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double expandedHeight = screenWidth * 0.95;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: expandedHeight,
              pinned: true,
              leading: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 20,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CommonImageView(
                        imagePath: Assets.imagesBack,
                        height: 20,
                      ),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              backgroundColor: kTertiaryColor,
              title: CustomText(text: ""),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    CommonImageView(
                      imagePath: Assets.imagesVaccumbg,
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.width * 0.84,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff033333),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 30,
                            horizontal: 21,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CustomText(
                                    text: "Vacuum Arches",
                                    size: 20,
                                    weight: FontWeight.w700,
                                    color: kSecondaryColor,
                                    paddingRight: 10,
                                  ),
                                  CommonImageView(
                                    imagePath: Assets.imagesVaccumwhite,
                                    height: 22,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 17,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      buttonText: "Create New Group",
                                      onTap: () {},
                                      radius: 5,
                                      height: 33,
                                      backgroundColor: kTertiaryColor,
                                      textColor: kSecondaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.035,
                                  ),
                                  Expanded(
                                    child: CustomButton(
                                      buttonText: "Remove New Group",
                                      onTap: () {},
                                      radius: 5,
                                      height: 33,
                                      backgroundColor: kSecondaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.035,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: screenWidth * 0.04,
          ),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomEditTile(
                      text: "Driverless White",
                      onTap: () {
                        Get.to(() => Edit());
                      },
                      valueText: 'Direct wires to 120v AC',
                    ),
                    SizedBox(
                      width: screenWidth * 0.035,
                    ),
                    CustomEditTile(
                      text: "Super Bright External",
                      onTap: () {
                        Get.to(() => Edit());
                      },
                      valueText: 'Driver (1100lm per ft)',
                    ),
                  ],
                ),
                SizedBox(
                  height: screenWidth * 0.045,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
