// ignore_for_file: prefer_const_constructors

import 'package:car_wash_light/controllers/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../widget/Custom_Textfield_widget.dart';
import '../../widget/Custom_button_widget.dart';
import '../../widget/Custom_text_widget.dart';
import 'signUp.dart';
import 'welcome_screen.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key});
  AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: kTertiaryColor,
          image: DecorationImage(
            image: AssetImage(Assets.imagesSigninbg),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 408,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  color: kSecondaryColor,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.imagesLogo,
                        height: 139,
                      ),
                      CustomText(
                        text: "CAR WASH",
                        size: 24,
                        color: Color(0xff115E35),
                      ),
                      CustomText(
                        text: "LIGHTS",
                        size: 24,
                        color: Color(0xff115E35),
                      ),
                      CustomText(
                        text: "FORMERLY “MILE HIGH LED SYSTEMS”",
                        size: 12,
                        weight: FontWeight.w700,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 34,
                ),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: authController.emailLogInTextController,
                      hintText: "Username",
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      controller: authController.passwordLogInTextController,
                      hintText: "Password",
                      isPassword: true,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: (){
                          showRequestSendDialog(context);
                        },
                        child: CustomText(
                          text: "Forgot Password?",
                          size: 14,
                          color: kSecondaryColor,
                          textAlign: TextAlign.right,
                          paddingTop: 69,
                          paddingBottom: 15,
                        ),
                      ),
                    ),
                    CustomButton(
                      buttonText: "Sign In",
                      onTap: () async {
                        await authController.login();

                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Don’t have an account? ",
                          size: 14,
                          color: kSecondaryColor,
                          textAlign: TextAlign.center,
                          paddingTop: 10,
                          paddingBottom: 15,
                        ),
                        CustomText(
                          text: " Sign Up",
                          size: 14,
                          color: Color(0xff8CD918),
                          textAlign: TextAlign.center,
                          paddingTop: 10,
                          paddingBottom: 15,
                          onTap: () {
                            Get.to(() => SignUp());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),],
          //child:
        ),
      ),
    );
  }


  void showRequestSendDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Forgot Password"),
          content: Text(
              "Your Request is send to admin for change of password. You will receive an email confirmation"),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Get.close(1);
                // Add your on tap logic here
              },
              borderRadius: BorderRadius.circular(5),
              splashColor: Colors.black.withAlpha(30),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withAlpha(50),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text('OK'),
              ),
            )
          ],
        );
      },
    );
  }


}
