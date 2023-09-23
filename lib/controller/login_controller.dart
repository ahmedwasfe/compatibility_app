
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginController extends GetxController{
  RxBool isLoading = false.obs;
  bool isVisiblePass = true;
  IconData visiblePassIcon = Icons.visibility;

  late GlobalKey<FormState> formKey;
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController confrimPassworedController;
  late TextEditingController checkEmailController;
  late TextEditingController phoneNumbersController;
  late TextEditingController fullnameController;
  late TextEditingController emailController;

  @override
  void onInit() {
    formKey = GlobalKey();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    checkEmailController = TextEditingController();
    phoneNumbersController = TextEditingController();
    fullnameController = TextEditingController();
    emailController = TextEditingController();
    confrimPassworedController = TextEditingController();
    super.onInit();
    // phoneController.text = '0598113864';
    // passwordController.text = '12345666';
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    usernameController.dispose();
    passwordController.dispose();
    checkEmailController.dispose();
    phoneNumbersController.dispose();
    fullnameController.dispose();
    emailController.dispose();
    confrimPassworedController.dispose();
    super.dispose();
  }

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon = isVisiblePass ? Icons.visibility : Icons.visibility_off;
    update();
  }


}