import 'package:get/get.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../controllers/home/home_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController());
    Get.put(HomeController());
    // Get.put(EventController());
    //
    // // Get.put(ChatController());
    // Get.put(ProfileController());
  }
}
