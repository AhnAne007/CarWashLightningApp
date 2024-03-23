// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:car_wash_light/view/screens/condition/condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_sizes.dart';
import '../../widget/Custom_text_widget.dart';

class Edit extends StatefulWidget {
  Edit({Key? key}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  List<bool> isSelected = [false, false, false, false, false];

  void toggleSelection(int index) {
    setState(() {
      isSelected[index] = !isSelected[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kTertiaryColor,
        titleSpacing: 0,
        title: CustomText(
          text: "Edit",
          size: 20,
          weight: FontWeight.w700,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kSecondaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: AppSizes.DEFAULT_PADDING,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Available Lights",
                        size: screenWidth * 0.035,
                        weight: FontWeight.w400,
                        color: Color(0xff8E8E8E),
                      ),
                      SizedBox(
                        height: screenWidth * 0.05,
                      ),
                      CustomText(
                        text: "Add to Group",
                        size: screenWidth * 0.035,
                        paddingRight: screenWidth * 0.015,
                        weight: FontWeight.w400,
                        color: Color(0xff8E8E8E),
                      ),
                      SizedBox(
                        height: screenWidth * 0.05,
                      ),
                      CustomText(
                        text: "Remove from Group",
                        size: screenWidth * 0.035,
                        weight: FontWeight.w400,
                        color: Color(0xff8E8E8E),
                      ),
                      SizedBox(
                        height: screenWidth * 0.09,
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(()=> ConditionPage());
                        },
                        child: CustomText(
                          text: "Condition",
                          size: screenWidth * 0.035,
                          weight: FontWeight.w400,
                          color: Color(0xff8E8E8E),
                        ),
                      ),
                      SizedBox(
                        height: screenWidth * 0.09,
                      ),
                      CustomText(
                        text: "Light Scene",
                        size: screenWidth * 0.035,
                        weight: FontWeight.w400,
                        color: Color(0xff8E8E8E),
                      ),
                    ],
                  ),
                ),
                for (int i = 0; i < 5; i++)
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.02,
                    ),
                    child: LightItem(
                      lightText: "Light ${i + 1}",
                      isSelected: isSelected[i],
                      onAddTap: () => toggleSelection(i),
                      onRemoveTap: () => toggleSelection(i),
                      screenWidth: screenWidth,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LightItem extends StatefulWidget {
  final String lightText;
  final bool isSelected;
  final VoidCallback onAddTap;
  final VoidCallback onRemoveTap;
  final double screenWidth;

  const LightItem({
    Key? key,
    required this.lightText,
    required this.isSelected,
    required this.onAddTap,
    required this.onRemoveTap,
    required this.screenWidth,
  }) : super(key: key);

  @override
  State<LightItem> createState() => _LightItemState();
}

class _LightItemState extends State<LightItem> {
  bool isConToggleOn = false;
  bool islightToggleOn = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        CustomText(
          text: widget.lightText,
          size: screenWidth * 0.032,
          weight: FontWeight.w400,
        ),
        SizedBox(
          height: widget.screenWidth * 0.12,
        ),
        GestureDetector(
          onTap: widget.onAddTap,
          child: Container(
            width: widget.screenWidth * 0.04,
            height: widget.screenWidth * 0.04,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff878787)),
            ),
            child: widget.isSelected
                ? Center(
                    child: Icon(
                      Icons.check,
                      size: widget.screenWidth * 0.035,
                      color: kTertiaryColor,
                    ),
                  )
                : null,
          ),
        ),
        SizedBox(
          height: widget.screenWidth * 0.09,
        ),
        GestureDetector(
          onTap: widget.onRemoveTap,
          child: Container(
            width: widget.screenWidth * 0.04,
            height: widget.screenWidth * 0.04,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff878787)),
            ),
            child: widget.isSelected
                ? Center(
                    child: Icon(
                      Icons.check,
                      size: widget.screenWidth * 0.035,
                      color: kTertiaryColor,
                    ),
                  )
                : null,
          ),
        ),
        SizedBox(
          height: widget.screenWidth * 0.07,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: isConToggleOn ? "Active" : "InAct",
              size: widget.screenWidth * 0.030,
              weight: FontWeight.w400,
              color: const Color(0xff8C8C8C),
              paddingBottom: 5,
            ),
            FlutterSwitch(
              width: widget.screenWidth * 0.1,
              height: widget.screenWidth * 0.049,
              toggleSize: widget.screenWidth * 0.04,
              value: isConToggleOn,
              toggleColor: kSecondaryColor,
              padding: widget.screenWidth * 0.01,
              activeColor: kTertiaryColor,
              inactiveColor: klightGreyColor,
              onToggle: (bool value) {
                setState(() {
                  isConToggleOn = value;
                });
              },
            ),
          ],
        ),
        SizedBox(
          height: widget.screenWidth * 0.04,
        ),
        Column(
          children: [
            CustomText(
              text: islightToggleOn ? "Active" : "InAct",
              size: widget.screenWidth * 0.030,
              weight: FontWeight.w400,
              color: const Color(0xff8C8C8C),
              paddingBottom: 5,
            ),
            FlutterSwitch(
              width: widget.screenWidth * 0.1,
              height: widget.screenWidth * 0.049,
              toggleSize: widget.screenWidth * 0.04,
              value: islightToggleOn,
              toggleColor: kSecondaryColor,
              padding: widget.screenWidth * 0.01,
              activeColor: kTertiaryColor,
              inactiveColor: klightGreyColor,
              onToggle: (bool value) {
                setState(() {
                  islightToggleOn = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
