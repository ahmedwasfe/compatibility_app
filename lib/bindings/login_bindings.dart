
import 'package:compatibility_app/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBinging extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}