
import 'package:compatibility_app/controller/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinging extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}