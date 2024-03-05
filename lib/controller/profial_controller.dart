import 'package:compatibility_app/api/api_requestes.dart';
import 'package:compatibility_app/model/user.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:compatibility_app/utils/preferences_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileController extends GetxController {
  RxBool isLoading = false.obs;
  bool isCheck = false;

  bool isVisiblePass = true;
  IconData visiblePassIcon = Icons.visibility;

  bool isVisibleConfirmPass = true;
  IconData visibleConfirmPassIcon = Icons.visibility;

  XFile? profileImage;

  late TextEditingController fullNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  User user = User();

  @override
  void onInit() {
    fullNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    super.onInit();

    user = AppHelper.getCurrentUser()!;
    if (user.fullName != null) fullNameController.text = user.fullName ?? '';

    if (user.mobile != null) phoneController.text = user.mobile ?? '';

    if (user.email != null) emailController.text = user.email ?? '';
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon = isVisiblePass ? Icons.visibility : Icons.visibility_off;
    update();
  }

  void visibleConfirmPassword() {
    isVisibleConfirmPass = !isVisibleConfirmPass;
    visibleConfirmPassIcon =
        isVisibleConfirmPass ? Icons.visibility : Icons.visibility_off;
    update();
  }

  void pickImageGallary() async {
    final ImagePicker picker = ImagePicker();
    profileImage = await picker.pickImage(source: ImageSource.gallery);
    update();
  }

  void requestStoragePermission() async {
    if (await Permission.storage.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
      print("storage permission: ${statuses[Permission.storage]}");
      pickImageGallary();
    } else
      pickImageGallary();
  }

  bool isValidation(BuildContext context) {
    if (profileImage == null) {
      AppWidgets.showSnackBar(
          context: context,
          message: 'please_choose_profile_image',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    } else if (fullNameController.text.isEmpty) {
      AppWidgets.showSnackBar(
          context: context,
          message: 'enter_full_name',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    } else if (phoneController.text.isEmpty) {
      AppWidgets.showSnackBar(
          context: context,
          message: 'enter_mobile',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    } else if (emailController.text.isEmpty) {
      AppWidgets.showSnackBar(
          context: context,
          message: 'enter_email',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }
    if (passwordController.text.isEmpty) {
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
    } else if (confirmPasswordController.text.isEmpty) {
      AppWidgets.showSnackBar(
          context: context,
          message: 'please_confirm_your_password_here',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    } else if (confirmPasswordController.text.length < 6) {
      AppWidgets.showSnackBar(
          context: context,
          message: 'password_must_be_more_than_6',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    } else if (confirmPasswordController.text != passwordController.text) {
      AppWidgets.showSnackBar(
          context: context,
          message: 'tow_password_not_match',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    } else {
      return true;
    }
  }

  void updateProfile(BuildContext context) {
    isLoading(true);
    if (isValidation(context)) {
      ApiRequestes.updateProfile(
              fullName: fullNameController.text,
              email: emailController.text,
              mobile: phoneController.text,
              image: profileImage!.path,
              password: passwordController.text,
              confirmPassword: confirmPasswordController.text)
          .then((value) {
        if (value != null) {
          update();
          PreferencesManager.clearData(key: Const.KEY_USER_DATA);
          PreferencesManager.saveUserData(key: Const.KEY_USER_DATA, user: value.result!.customer!);
          isLoading(false);
          Navigator.pop(context);
          update();
        } else {
          isLoading(false);
        }
      });
    }
    update();
  }
}
