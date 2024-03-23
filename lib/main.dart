import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'config/routes/routes.dart';
import 'config/theme/light_theme.dart';
import 'core/bindings/bindings.dart';
import 'core/utils/tuya_sdk_functions.dart';
import 'firebase_options.dart';
// import 'package:tuya/tuya_exceptions.dart';
// import 'package:tuya/tuya.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await TuyaSdk.initialize();
  //TuyaDeviceHandler.registerCallbacks();
  runApp(MyApp());
}

//DO NOT REMOVE Unless you find their usage.
String dummyImg =
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Car Wash Light',
      theme: LightTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppLinks.splash_screen,
      getPages: AppRoutes.pages,
      defaultTransition: Transition.fadeIn,
      initialBinding: InitialBindings(),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'config/routes/routes.dart';
// import 'config/theme/dark_theme.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(360, 778),
//       builder: (context, child) => GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Popdarts',
//         theme: DartTheme,
//         themeMode: ThemeMode.light,
//         initialRoute: AppLinks.splash_screen,
//         getPages: AppRoutes.pages,
//         defaultTransition: Transition.fadeIn,
//       ),
//     );
//   }
// }
