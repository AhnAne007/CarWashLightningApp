// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:car_wash_light/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/instance_manager.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_sizes.dart';
import '../../widget/Custom_button_widget.dart';
import '../../widget/Custom_text_widget.dart';
import '../../widget/common_image_view_widget.dart';

class CustomColorSelection extends StatefulWidget {
  final String scenes;
  final String description;
  Color? color; // Make color parameter optional by adding '?'
  int? indexOfColorArray;

  CustomColorSelection({
    required this.scenes,
    required this.description,
    this.color = const Color(0x00000000),
    this.indexOfColorArray = 0, // Define color as an optional named parameter
    Key? key,
  }) : super(key: key);

  @override
  State<CustomColorSelection> createState() => _CustomColorSelectionState();
}

class _CustomColorSelectionState extends State<CustomColorSelection> {
  late Color currentColor;
  late Color containerBackgroundColor;
  late String selectedColorName;

  bool colorChanged = false;

  HomeController homeController = Get.find();

  @override
  void initState() {
    super.initState();
    currentColor = kTertiaryColor;
    containerBackgroundColor = widget.color ?? kSecondaryColor;
    selectedColorName = "Edit Name";
  }

  void changeColor(Color color) {
    setState(() {
      currentColor = color;
      colorChanged = true;
      setContainerColor();
    });
  }

  void setContainerColor() {
    setState(() {
      containerBackgroundColor = currentColor.withOpacity(0.7);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: containerBackgroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: screenWidth * 0.043,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomText(
                text: widget.scenes,
                textAlign: TextAlign.center,
                size: screenWidth * 0.035,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.03,
            ),
            Expanded(
              child: CustomText(
                text: widget.description,
                size: screenWidth * 0.035,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.06,
            ),
            Expanded(
              child: CustomText(
                text: selectedColorName,
                size: screenWidth * 0.035,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.01,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: kSecondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: const BorderSide(
                          color: kTertiaryColor,
                          width: 3,
                        ),
                      ),
                      title: const Text(
                        'Choose Color',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            ColorPicker(
                              pickerColor: kTertiaryColor,
                              onColorChanged: changeColor,
                              showLabel: false,
                              paletteType: PaletteType.hueWheel,
                              pickerAreaHeightPercent: 0.6,
                            ),
                            Padding(
                              padding: AppSizes.DEFAULT_HORIZONTAL,
                              child: CustomButton(
                                buttonText: "CONTINUE",
                                textColor: kSecondaryColor,
                                backgroundColor: kTertiaryColor,
                                onTap: () async {
                                  setState(() {});
                                  await homeController.updateHexColorCodeAt(
                                      "3vsoeFQiZfNnkzoo1w4N",
                                      "PI03xbM2cypMcnuSHgZO",
                                      homeController.selectedConditionModel
                                              .value.id ??
                                          "",
                                      widget.indexOfColorArray ?? 0,
                                      containerBackgroundColor);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: CommonImageView(
                imagePath: Assets.imagesEdit,
                height: screenHeight * 0.03,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.01,
            ),
          ],
        ),
      ),
    );
  }
}
