// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tuya/tuya.dart';
// import 'package:tuya/tuya_exceptions.dart';
//
// class TuyaDeviceHandler {
//   static FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   static Future<void> handleDeviceUpdate(String devId, String dpStr) async {
//     // Store the device data in Firebase
//     await storeDeviceData(devId, dpStr);
//
//     // Remove the last device
//     await removeLastDevice();
//   }
//
//   static Future<void> storeDeviceData(String devId, String dpStr) async {
//     try {
//       await firestore.collection('devices').doc(devId).set({
//         'dpStr': dpStr,
//         'updatedAt': FieldValue.serverTimestamp(),
//       });
//       print('Device data stored successfully.');
//     } catch (e) {
//       print('Error storing device data: $e');
//     }
//   }
//
//   static Future<void> removeLastDevice() async {
//     try {
//       QuerySnapshot querySnapshot = await firestore.collection('devices').get();
//       if (querySnapshot.docs.isNotEmpty) {
//         String lastDeviceId = querySnapshot.docs.last.id;
//         await firestore.collection('devices').doc(lastDeviceId).delete();
//         print('Last device removed successfully.');
//       } else {
//         print('No devices found to remove.');
//       }
//     } catch (e) {
//       print('Error removing last device: $e');
//     }
//   }
//
//   static void handleDeviceRemoval(String devId) {
//     // Handle device removal
//     print('Device removed: $devId');
//
//     // Remove the device from Firebase
//     removeDeviceFromFirebase(devId);
//   }
//
//   static Future<void> removeDeviceFromFirebase(String devId) async {
//     try {
//       await firestore.collection('devices').doc(devId).delete();
//       print('Device removed from Firebase: $devId');
//     } catch (e) {
//       print('Error removing device from Firebase: $e');
//     }
//   }
//
//   static void handleDeviceStatusChange(String devId, bool online) {
//     // Handle device status change
//   }
//
//   static void handleNetworkStatusChange(String devId, bool status) {
//     // Handle network status change
//   }
//
//   static void handleDeviceInfoUpdate(String devId) {
//     // Handle device info update
//   }
//
//   static void registerCallbacks() {
//     TuyaSdk.registerDeviceCallbacks(
//       handleDeviceUpdate,
//       handleDeviceRemoval,
//       handleDeviceStatusChange,
//       handleNetworkStatusChange,
//       handleDeviceInfoUpdate,
//     );
//   }
// }
//
//
// class DeviceStatusHandler {
//   static Future<void> handleDeviceStatusChange(
//       String devId, bool online) async {
//     try {
//       // Handle device status change
//       print('Device status change: $devId - Online: $online');
//
//       // Update device status in Firebase
//       await updateDeviceStatusInFirebase(devId, online);
//
//       // Call Tuya SDK function to handle device status change
//       await TuyaSdk.publishDps(devId, online ? 'online' : 'offline');
//     } catch (e) {
//       print('Error handling device status change: $e');
//     }
//   }
//
//   static Future<void> updateDeviceStatusInFirebase(
//       String devId, bool online) async {
//     try {
//       // Get Firestore reference to the device document
//       DocumentReference deviceRef =
//           FirebaseFirestore.instance.collection('devices').doc(devId);
//
//       // Update the online status field in Firestore
//       await deviceRef.update({'online': online});
//       print('Device status updated in Firestore: $devId - Online: $online');
//     } catch (e) {
//       print('Error updating device status in Firestore: $e');
//     }
//   }
// }
//
//
// class AuthenticationHandler {
//   static Future<void> handleAuthentication(String email, String password,
//       String countryCode, String verificationCode) async {
//     try {
//       // Send verification code
//       bool sent = await TuyaSdk.sendVerificationCode(email, countryCode);
//
//       // Register with email and password
//       Map<String, dynamic>? registrationResult =
//           await TuyaSdk.registerWithEmail(
//               email, password, countryCode, verificationCode);
//
//       // Login with email and password
//       Map<String, dynamic>? loginResult =
//           await TuyaSdk.loginWithEmail(email, password, countryCode);
//
//       // Handle successful registration and login
//       handleSuccessfulAuthentication();
//     } on TuyaUserAlreadyExistsException catch (e) {
//       // Handle user already exists exception
//       handleUserAlreadyExistsException(e);
//     } on TuyaCreateAccountException catch (e) {
//       // Handle create account exception
//       handleCreateAccountException(e);
//     } on TuyaLoginException catch (e) {
//       // Handle login exception
//       handleLoginException(e);
//     }
//   }
//
//   static void handleSuccessfulAuthentication() {
//     // Handle successful authentication
//     print('Authentication successful');
//   }
//
//   static void handleUserAlreadyExistsException(
//       TuyaUserAlreadyExistsException e) {
//     // Handle user already exists exception
//     print('User already exists: ${e.message}');
//   }
//
//   static void handleCreateAccountException(TuyaCreateAccountException e) {
//     // Handle create account exception
//     print('Error creating account: ${e.message}');
//   }
//
//   static void handleLoginException(TuyaLoginException e) {
//     // Handle login exception
//     print('Error logging in: ${e.message}');
//   }
// }
