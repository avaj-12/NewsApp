import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    // Get.put(LoginController());
    // Get.put(DeviceInfo());
    // Get.put(FirebaseController());
  }
}
