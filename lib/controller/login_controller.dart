import 'dart:convert';
import 'dart:developer';

import 'package:compatibility_app/api/api_requestes.dart';
import 'package:compatibility_app/api/firebase_api.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:compatibility_app/utils/preferences_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  bool isVisiblePass = true;
  IconData visiblePassIcon = Icons.visibility;

  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController confrimPassworedController;
  late TextEditingController checkEmailController;
  late TextEditingController phoneNumbersController;
  late TextEditingController fullnameController;
  late TextEditingController emailController;

  @override
  void onInit() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    checkEmailController = TextEditingController();
    phoneNumbersController = TextEditingController();
    fullnameController = TextEditingController();
    emailController = TextEditingController();
    confrimPassworedController = TextEditingController();
    super.onInit();
    usernameController.text = 'ahmed.was';
    passwordController.text = '12345678';
  }

  @override
  void dispose() {
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

  bool isValidate(BuildContext context) {
    if (usernameController.text.isEmpty) {
      AppWidgets.showSnackBar(
          context: context,
          message: 'enter_username',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    } else if (passwordController.text.isEmpty) {
      AppWidgets.showSnackBar(
          context: context,
          message: 'please_click_password',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    } else if (passwordController.text.length < 6) {
      AppWidgets.showSnackBar(
          context: context,
          message: 'password_must_be_more_than_6',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    } else {
      return true;
    }
  }

  void login(BuildContext context) async {
    isLoading(true);
    if (isValidate(context)) {
      isLoading(true);
      await ApiRequestes.login(
              username: usernameController.text,
              password: passwordController.text)
          .then((value) async {
        if (value != null) {
          isLoading(false);
          usernameController.clear();
          passwordController.clear();
          PreferencesManager.saveUserData(
              key: Const.KEY_USER_DATA, user: value.result!.user!);
          PreferencesManager.saveUserToken(
              key: Const.KEY_USER_TOKEN, token: '${value.result!.token}');
          PreferencesManager.saveAppData(
              key: Const.KEY_USER_TYPE, value: value.result!.guard!);

          if (await FirebaseAPIs.userExist()) {
            Get.toNamed(Routes.home);
          } else {
            await FirebaseAPIs.createConversation()
                .then((value) => Get.toNamed(Routes.home));
          }
        } else {
          isLoading(false);
        }
      }).catchError((error) {
        isLoading(false);
        print('catchError: $error');
      });
    } else {
      isLoading(false);
    }
  }
}
