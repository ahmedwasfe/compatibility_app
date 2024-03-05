import 'package:compatibility_app/model/auth/select_email_phone.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class ForgetPasswordController extends GetxController {

  RxBool isLoading = false.obs;

  RxBool isEnable = false.obs;
  String type = '';
  List<SelectEmailPhone> selectEmailPhone = [
    SelectEmailPhone('via_email'.tr, 'example@example.com', Const.KEY_FORGET_EMAIL, 'icon_forget_pass_email.svg', false),
    SelectEmailPhone('via_phone'.tr, '+123 123 123 123', Const.KEY_FORGET_PHONE, 'icon_forget_pass_phone.svg', false),
  ];

  late TextEditingController emailPhoneController;
  late TextEditingController pinController;


  var focusedBorderColor =AppColors.grayColor;
  var fillColor = const Color.fromRGBO(73, 29, 77, 0.4);
  var borderColor = AppColors.primaryColor;

  var defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: AppColors.grayColor,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50.r),
      border: Border.all(color: AppColors.colorgreenl),
    ),
  );

  bool isVisiblePass = true;
  String visiblePassIcon = 'icon_password_hide.svg';

  bool isVisibleConfirmPass = true;
  String visibleConfirmPassIcon = 'icon_password_hide.svg';

  @override
  void onInit() {
    emailPhoneController = TextEditingController();
    pinController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailPhoneController.dispose();
    pinController.dispose();
    super.dispose();
  }

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon = isVisiblePass ? 'icon_password_hide.svg' : 'icon_password_show.svg';
    update();
  }

  void visibleConfirmPassword() {
    isVisibleConfirmPass = !isVisibleConfirmPass;
    visibleConfirmPassIcon = isVisibleConfirmPass ? 'icon_password_hide.svg' : 'icon_password_show.svg';
    update();
  }

  bool isValidationEmailPhone(BuildContext context, String type) {
    if(type == Const.KEY_FORGET_EMAIL){
      if(emailPhoneController.text.isEmpty){
        AppWidgets.showSnackBar(context: context,
            message: 'please_enter_email',
            textColor: AppColors.colorErrorText,
            backgroundColor: AppColors.colorErrorBG,
            iconColor: AppColors.colorErrorText);
        return false;
      }else if(!AppHelper.emailValidate().hasMatch(emailPhoneController.text)){
        AppWidgets.showSnackBar(context: context,
            message: 'please_enter_email_valid',
            textColor: AppColors.colorErrorText,
            backgroundColor: AppColors.colorErrorBG,
            iconColor: AppColors.colorErrorText);
        return false;
      }else {
        return true;
      }
    }else {
      if(emailPhoneController.text.isEmpty){
        AppWidgets.showSnackBar(context: context,
            message: 'please_enter_phone_number',
            textColor: AppColors.colorErrorText,
            backgroundColor: AppColors.colorErrorBG,
            iconColor: AppColors.colorErrorText);
        return false;
      }else {
        return true;
      }
    }
  }

  // bool isValidationPassword(BuildContext context) {
  //   if(passwordController.text.isEmpty){
  //     AppWidgets.showSnackBar(context: context,
  //         message: 'please_enter_password',
  //         textColor: AppColors.colorErrorText,
  //         backgroundColor: AppColors.colorErrorBG,
  //         iconColor: AppColors.colorErrorText);
  //     return false;
  //   }else if(passwordController.text.length < 6 ) {
  //     AppWidgets.showSnackBar(context: context,
  //         message: 'password_must_be_more_than_6',
  //         textColor: AppColors.colorErrorText,
  //         backgroundColor: AppColors.colorErrorBG,
  //         iconColor: AppColors.colorErrorText);
  //     return false;
  //   }else if(confirmPasswordController.text.isEmpty){
  //     AppWidgets.showSnackBar(context: context,
  //         message: 'please_enter_confirm_password',
  //         textColor: AppColors.colorErrorText,
  //         backgroundColor: AppColors.colorErrorBG,
  //         iconColor: AppColors.colorErrorText);
  //     return false;
  //   }else if(confirmPasswordController.text.length < 6 ) {
  //     AppWidgets.showSnackBar(context: context,
  //         message: 'password_must_be_more_than_6',
  //         textColor: AppColors.colorErrorText,
  //         backgroundColor: AppColors.colorErrorBG,
  //         iconColor: AppColors.colorErrorText);
  //     return false;
  //   }else if(confirmPasswordController.text != passwordController.text) {
  //     AppWidgets.showSnackBar(context: context,
  //         message: 'tow_password_not_match',
  //         textColor: AppColors.colorErrorText,
  //         backgroundColor: AppColors.colorErrorBG,
  //         iconColor: AppColors.colorErrorText);
  //     return false;
  //   }else {
  //     return true;
  //   }
  // }
}