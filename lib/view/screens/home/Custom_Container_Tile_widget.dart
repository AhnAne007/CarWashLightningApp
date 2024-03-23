// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_constructors_in_immutables

import 'package:car_wash_light/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../widget/Custom_text_widget.dart';
import '../../widget/common_image_view_widget.dart';

class CustomContainearTile extends StatefulWidget {
  final String imagePath;
  final String portionID;
  final String text;
  final VoidCallback onTap;

  CustomContainearTile({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.onTap,
    required this.portionID,
  }) : super(key: key);

  @override
  _CustomContainearTileState createState() => _CustomContainearTileState();
}

class _CustomContainearTileState extends State<CustomContainearTile> {
  bool isToggleOn = false;

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: screenWidth * 0.4,
        height: screenWidth * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            width: 1,
            color: Color.fromRGBO(0, 0, 0, 0.25),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonImageView(
                    imagePath: widget.imagePath,
                    height: screenWidth * 0.1,
                    width: screenWidth * 0.15,
                    fit: BoxFit.contain,
                  ),
                  FlutterSwitch(
                    width: screenWidth * 0.1,
                    height: screenWidth * 0.06,
                    toggleSize: screenWidth * 0.04,
                    value: isToggleOn,
                    toggleColor: kSecondaryColor,
                    padding: screenWidth * 0.01,
                    activeColor: kTertiaryColor,
                    inactiveColor: klightGreyColor,
                    onToggle: (bool value) async {
                      print(widget.portionID);
                      await homeController.toggleFieldValue(widget.portionID);
                      setState(() {
                        isToggleOn = value;
                      });
                    },
                  ),
                ],
              ),
              CustomText(
                text: widget.text,
                size: screenWidth * 0.040,
                weight: FontWeight.w700,
                color: const Color(0xff8C8C8C),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
