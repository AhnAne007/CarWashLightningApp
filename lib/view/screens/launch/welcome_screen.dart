// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../widget/Custom_button_widget.dart';
import '../../widget/Custom_text_widget.dart';
import '../bottombar/bottombar.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSecondaryColor,
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage(Assets.imagesWelcomebg),
          fit: BoxFit.contain,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 45,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              text: "The Car Wash Lighting Experts",
              size: 34,
              weight: FontWeight.w700,
              textAlign: TextAlign.center,
            ),
            CustomText(
              text:
                  "All products are designed in the USA by car wash operators for car washes. If you need lights for your wash, trust the company serving the car wash industry for decades.",
              size: 13,
              color: kDarkGreyColor,
              paddingTop: 10,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 37,
            ),
            CustomButton3(
              text: 'Get Started',
              onTap: () {
                Get.offAll(() => Bottombar());
              },
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
