
import 'package:compatibility_app/controller/boarding_controller.dart';
import 'package:compatibility_app/controller/home_controller.dart';
import 'package:compatibility_app/controller/splash_controller.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.put(BoardingController());
    Get.lazyPut(() => HomeController());
  }
}
