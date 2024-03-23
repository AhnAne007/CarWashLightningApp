// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


void showSuccessSnackbar(
    {required String title, required String msg, int duration = 7}) {
  Get.snackbar(
    title,
    msg,
    duration: Duration(seconds: duration),
    backgroundColor: Colors.green,
    snackPosition: SnackPosition.BOTTOM,
    messageText: Text(
      msg,
      style: const TextStyle(color: Colors.white),
    ),
    titleText: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}

void showFailureSnackbar(
    {required String title, required String msg, int duration = 7}) {
  Get.snackbar(
    title,
    msg,
    duration: Duration(seconds: duration),
    backgroundColor: Colors.red,
    snackPosition: SnackPosition.BOTTOM,
    messageText: Text(
      msg,
      style: const TextStyle(color: Colors.white),
    ),
    titleText: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
  //fetch res data from firebase
}

//Function To fetch The userData
Future<void> getUserData({required String userId}) async {
  //getting user's data stream
  try {
    // Fetch user's data once
    var snapshot =
        await FirebaseFirestore.instance.collection("users").doc(userId).get();

    if (snapshot.exists) {
      // // Update your model class with the fetched data
      // userModelGlobal.value = UserModel.fromMap(snapshot);
      //
      // log("User name from model is: ${userModelGlobal.value.userFirstName}");
      log("Success For Now");
    } else {
      log("User with ID $userId does not exist");
    }
  } catch (e) {
    log("Error fetching user data: $e");
  }
}

// Color getBackgroundColor(int index) {
//   // Calculate the remainder when dividing the index by different numbers
//   int remainderMod4 = index % 4;
//   int remainderMod3 = index % 3;
//   int remainderMod2 = index % 2;
//
//   // Assign colors based on the remainders
//   if (remainderMod4 == 0) {
//     return colorEvent04; // Replace 'color1' with your desired color
//   } else if (remainderMod3 == 0) {
//     return colorEvent03; // Replace 'color2' with your desired color
//   } else if (remainderMod2 == 0) {
//     return colorEvent02; // Replace 'color3' with your desired color
//   } else {
//     return colorEventDef; // Replace 'defaultColor' with your desired default color
//   }
// }

