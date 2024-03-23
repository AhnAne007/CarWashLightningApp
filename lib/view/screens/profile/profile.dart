// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:car_wash_light/controllers/auth/auth_controller.dart';
import 'package:car_wash_light/view/screens/profile/about_page.dart';
import 'package:car_wash_light/view/widget/Custom_button_widget.dart';
import 'package:car_wash_light/view/widget/Custom_divider_widget.dart';
import 'package:car_wash_light/view/widget/common_image_view_widget.dart';
import 'package:car_wash_light/view/widget/custom_circular_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../../../constants/app_sizes.dart';
import '../../../core/globals/global_variables.dart';
import '../../widget/Custom_text_widget.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  AuthController authController = Get.find();

  RxString selectedLanguage = "Language".obs;
  Rx<String> countryCode = 'Location'.obs;

  User? user = FirebaseAuth.instance.currentUser;


  Future<void> pickImage() async {
    // Check if permission to access the device's gallery is granted
    // var galleryPermissionStatus = await Permission.photos.status;
    // if (!galleryPermissionStatus.isGranted) {
    //   // Request permission to access the device's gallery
    //   galleryPermissionStatus = await Permission.photos.request();
    //   if (!galleryPermissionStatus.isGranted) {
    //     // Permission not granted, handle it accordingly
    //     print('Gallery permission not granted');
    //     return;
    //   }
    // }

    // Permission granted, proceed to pick an image from the gallery
    XFile? pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      imageSubject.value = File(pickedImage.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: CustomText(
          text: "My Profile",
          size: screenWidth * 0.05,
          weight: FontWeight.w700,
        ),
      ),
      body: Padding(
        padding: AppSizes.DEFAULT_PADDING,
        child: Column(
          children: [
            Row(
              children: [
                Obx(() => imageSubject.value == null
                    ? GestureDetector(
                        onTap: () async {
                          await pickImage();
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage(Assets.imagesProfile),
                          backgroundColor: kSecondaryColor,
                          radius: 50,
                        ),
                      )
                    : CircleAvatar(
                        backgroundImage:
                            FileImage(imageSubject.value ?? File('')),
                        backgroundColor: Colors.transparent,
                        radius: 50,
                      )),
                // CircleAvatar(
                //   backgroundImage: AssetImage(Assets.imagesProfile),
                //   backgroundColor: kSecondaryColor,
                //   radius: 50,
                // ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Admin',
                        size: 18,
                        weight: FontWeight.w700,
                      ),
                      CustomText(
                        text: user?.email ?? 'Johndoe@gmail.com',
                        size: 14,
                        paddingBottom: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 100,
                        ),
                        child: CustomButton3(
                          height: 35,
                          text: 'Get Started',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 0.30),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 25,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _showLanguageDropdown(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => CustomText(
                              text: selectedLanguage.value ?? 'Language',
                              size: 14,
                            ),
                          ),
                          CommonImageView(
                            imagePath: Assets.imagesLanguage,
                            height: 24,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomDivider(),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        _showCountryCodeDropdown(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => CustomText(
                                    text: countryCode.value ?? 'Location',
                                    size: 14,
                                  ) // Default flag icon
                              ),
                          CommonImageView(
                            imagePath: Assets.imagesLocation,
                            height: 24,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomDivider(),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showFeatureComingSoonDialog(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'User Management',
                            size: 14,
                          ),
                          CommonImageView(
                            imagePath: Assets.imagesUser,
                            height: 24,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomDivider(),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        showFeatureComingSoonDialog(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Password',
                            size: 14,
                          ),
                          CommonImageView(
                            imagePath: Assets.imagesPassword,
                            height: 24,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomDivider(),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(AboutPage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'About',
                            size: 14,
                          ),
                          CommonImageView(
                            imagePath: Assets.imagesAbout,
                            height: 24,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomDivider(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => authController.isSignOutLoading.value
                              ? CustomCircularIndicator(
                                  indicatorColor: Colors.red,
                                  containerColor: Colors.transparent,
                                )
                              : GestureDetector(
                                  onTap: () {
                                    authController.signOut();
                                  },
                                  child: CustomText(
                                    text: 'Signout',
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ),
                        ),
                        CommonImageView(
                          imagePath: Assets.imagesSignout,
                          height: 24,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showLanguageDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: DropdownButton<String>(
            items: <String>['English', 'Spanish', 'French', 'German']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              selectedLanguage.value = newValue ?? "";
              // Implement logic to change language here
              // For example, you can use a setState to update the selected language
            },
          ),
        );
      },
    );
  }

  void _showCountryCodeDropdown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Country'),
          content: DropdownButton<String>(
            items: <String>['US', 'GB', 'FR', 'DE'] // Example country codes
                .map((String countryCode) {
              return DropdownMenuItem<String>(
                value: countryCode,
                child: Text(countryCode),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Set the selected country code to the Rx variable
              countryCode.value = newValue ?? '';
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
        );
      },
    );
  }

  void showFeatureComingSoonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Feature Coming Soon"),
          content: Text(
              "This feature is currently under development and will be available soon."),
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
                      color: Colors.black.withAlpha(50),
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
