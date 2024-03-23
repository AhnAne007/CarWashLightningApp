import 'dart:developer';

import 'package:car_wash_light/core/globals/global_functions.dart';
import 'package:car_wash_light/core/utils/firebase_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/condition_model.dart';

class HomeController extends GetxController {
// Initialize the RxList
  RxList<ConditionModel> conditions = <ConditionModel>[].obs;

  Rx<ConditionModel> selectedConditionModel = ConditionModel().obs;

  RxBool deviceSearchLoading = false.obs;

  Future<void> toggleFieldValue(String documentId) async {
    try {
      // Get reference to the document
      DocumentReference docRef = portionsCollection.doc(documentId);

      // Get the current value of the field
      DocumentSnapshot snapshot = await docRef.get();
      dynamic currentValue = snapshot.get("power");

      // Determine the new value based on the current value
      dynamic newValue = (currentValue == 0) ? 1 : 0;

      // Update the field with the new value
      await docRef.update({"power": newValue});
      log("Success");
    } catch (e) {
      print('Error toggling field value: $e');
      // Handle error
    }
  }

  void showLoadingOfDevices() {
    deviceSearchLoading.value = true;
    showFailureSnackbar(title: "Add Device", msg: "No Device Found");

    // Introduce a delay of 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      deviceSearchLoading.value =  false;
    });
  }

  Future<void> getConditions(String portionId, String subPortionId) async {
    conditions.clear();
    try {
      // Reference to the conditions collection
      CollectionReference conditionsRef = FirebaseFirestore.instance
          .collection('Portions')
          .doc(portionId)
          .collection('subPortion')
          .doc(subPortionId)
          .collection('conditions');

      // Query the conditions collection and get documents
      QuerySnapshot querySnapshot = await conditionsRef.get();

      // Process documents and convert them to ConditionModel objects
      conditions.value = querySnapshot.docs.map((doc) {
        return ConditionModel.fromMap({
          'id': doc.id,
          'hexColorCodes': doc['hexColorCodes'],
        });
      }).toList();
    } catch (e) {
      // Handle errors
      print('Error getting conditions: $e');
    }
  }

  Future<void> updateHexColorCodeAt(String portionId, String subPortionId,
      String docId, int index, Color color) async {
    try {
      // Convert color to hexadecimal string
      String hexColor = colorToHex(color);

      // Reference to the conditions collection
      CollectionReference conditionsRef = portionsCollection
          .doc(portionId)
          .collection('subPortion')
          .doc(subPortionId)
          .collection('conditions');

      // Get the document snapshot
      DocumentSnapshot docSnapshot = await conditionsRef.doc(docId).get();

      // Cast the result of data() to Map<String, dynamic>
      Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;

      // Check if data is null or not
      if (data != null) {
        // Get the current array from the document
        List<dynamic> currentArray = data['hexColorCodes'];

        // Ensure the index is within bounds
        if (index >= 0 && index < currentArray.length) {
          // Update the array in memory by replacing the element at the specified index
          currentArray[index] = hexColor;

          // Update the entire array back to Firestore
          await conditionsRef.doc(docId).update({
            'hexColorCodes': currentArray,
          });
        } else {
          // Index out of bounds, handle error or ignore
          print('Index out of bounds');
        }
      } else {
        print('Document data is null');
      }
    } catch (e) {
      // Handle errors
      print('Error updating hexColorCode: $e');
    }
  }

  // Function to convert Color to hexadecimal string
  String colorToHex(Color color) {
    String hex = '#${color.value.toRadixString(16).substring(2)}';
    return hex;
  }
}
