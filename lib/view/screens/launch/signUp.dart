// ignore_for_file: prefer_const_constructors

import 'package:car_wash_light/controllers/auth/auth_controller.dart';
import 'package:car_wash_light/view/widget/custom_circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../widget/Custom_Textfield_widget.dart';
import '../../widget/Custom_app_bar_widget.dart';
import '../../widget/Custom_button_widget.dart';
import 'signIn.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Register",
        textColor: kGreenColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 35,
        ),
        child: Column(
          children: [
            CustomTextField(
              controller: authController.usernameSignUpTextController,
              hintText: "Username",
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: authController.emailSignUpTextController,
              hintText: "Email",
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextField(
              controller: authController.languageSignUpTextController,
              hintText: "Language",
            ),
            SizedBox(
              height: 77,
            ),
            Obx(
              () => authController.isLoading.value
                  ? CustomCircularIndicator(
                      indicatorColor: kTertiaryColor,
                      containerColor: Colors.transparent,
                    )
                  : CustomButton(
                      buttonText: "Verify E-mail",
                      textColor: kSecondaryColor,
                      backgroundColor: kTertiaryColor,
                      onTap: () async {
                        await authController.signUp();
                        Get.offAll(() => SignIn());
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
