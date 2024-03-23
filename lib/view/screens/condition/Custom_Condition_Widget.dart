import 'package:flutter/material.dart';
import '../../../constants/app_images.dart';
import '../../widget/Custom_text_widget.dart';
import '../../widget/common_image_view_widget.dart';

class CustomCondition extends StatelessWidget {
  final String condition;
  final String description;
  final VoidCallback onEditTap;

  const CustomCondition({
    required this.condition,
    required this.description,
    required this.onEditTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.02,
              ),
              CustomText(
                text: condition,
                textAlign: TextAlign.center,
                size: screenWidth * 0.035,
              ),
            ],
          ),
        ),
        SizedBox(
          width: screenWidth * 0.015,
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.02,
              ),
              CustomText(
                text: description,
                size: screenWidth * 0.035,
                textAlign: TextAlign.center,
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
              SizedBox(
                height: screenHeight * 0.02,
              ),
              CustomText(
                text: "Edit Name",
                size: screenWidth * 0.035,
              ),
            ],
          ),
        ),
        SizedBox(
          width: screenWidth * 0.05,
        ),
        Column(
          children: [
            SizedBox(
              height: screenHeight * 0.02,
            ),
            GestureDetector(
              onTap: onEditTap,
              child: CommonImageView(
                imagePath: Assets.imagesEdit,
                height: screenHeight * 0.03,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
