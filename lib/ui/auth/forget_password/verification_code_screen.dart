import 'dart:math';

import 'package:compatibility_app/api/api_requestes.dart';
import 'package:compatibility_app/api/firebase_api.dart';
import 'package:compatibility_app/controller/forget_password_controller.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:compatibility_app/utils/preferences_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerificationCodeScreen extends StatefulWidget {
  String? token;
  String? email;


  VerificationCodeScreen({this.token, this.email});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen>
    with TickerProviderStateMixin {
  final _controller = Get.put(ForgetPasswordController());
  late AnimationController _animationController;
  late TextEditingController pinController;
  final focusNode = FocusNode();
  String pinCode = '';

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 120));
    pinController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    pinController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  String get timeRemaing {
    Duration count =
        _animationController.duration! * _animationController.value;
    return '${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  void checkCode() {
    _controller.isLoading(true);
    ApiRequestes.checkCode(code: pinCode, token: widget.token!).then((value) async {
      if (value != null) {
        _controller.isLoading(false);
        PreferencesManager.clearData(key: Const.KEY_FCM_TOKEN);
        PreferencesManager.saveUserToken(
            key: Const.KEY_USER_TOKEN, token: value.result!.token!);
        PreferencesManager.saveUserData(
            key: Const.KEY_USER_DATA, user: value.result!.user!);
        if (await FirebaseAPIs.userExist()) {
          Get.toNamed(Routes.home);
        } else {
          await FirebaseAPIs.createConversation()
              .then((value) => Get.toNamed(Routes.home));
        }
      }else {
        _controller.isLoading(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.medium(
            text: 'code',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin:
                  EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 30.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText.medium(
                      text: 'check_messag_email',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      maxline: 2),
                  SizedBox(height: 5.h),
                  AppText.medium(
                      text: widget.email != null ? widget.email! : '',
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightgray87),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 30.r),
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (_, child) => AppText.medium(
                    text: timeRemaing,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 40.r),
              child: Pinput(
                controller: _controller.pinController,
                focusNode: focusNode,
                length: 4,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: _controller.defaultPinTheme.copyWith(
                    decoration: BoxDecoration(
                        color: _controller.focusedBorderColor,
                        borderRadius: BorderRadiusDirectional.circular(50.r))),
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  print('onCompleted: $pin');
                  // Get.toNamed(Routes.login);
                  pinCode = pin;
                },
                onChanged: (value) {
                  print('onChanged: $value');
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22.sp,
                      height: 1,
                      color: AppColors.colorpurple,
                    ),
                  ],
                ),
                disabledPinTheme: PinTheme(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(50.r))),
                focusedPinTheme: _controller.defaultPinTheme.copyWith(
                  decoration: _controller.defaultPinTheme.decoration!.copyWith(
                    color: _controller.focusedBorderColor,
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: AppColors.colorgreenl),
                  ),
                ),
                submittedPinTheme: _controller.defaultPinTheme.copyWith(
                  decoration: _controller.defaultPinTheme.decoration!.copyWith(
                    color: _controller.fillColor,
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: AppColors.colorpurple),
                  ),
                ),
                errorPinTheme: _controller.defaultPinTheme.copyWith(
                  decoration: _controller.defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(color: Colors.red),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 40.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 0.r),
                    child: InkWell(
                      child: AppText.medium(
                          text: 'send_again',
                          fontWeight: FontWeight.w400,
                          color: AppColors.colorpurple,
                          textDecoration: TextDecoration.underline,
                          fontSize: 16.sp),
                      onTap: () {
                        if (_animationController.isAnimating) {
                          _animationController.stop();
                        } else {
                          _animationController.reverse(
                              from: _animationController.value == 0
                                  ? 1.0
                                  : _animationController.value);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  AppText.medium(text: '60ث', color: AppColors.lightGray6)
                ],
              ),
            ),
            Obx(() => _controller.isLoading.isTrue ? AppWidgets.CustomAnimationProgress() : Container()),
            Container(
                padding: EdgeInsetsDirectional.only(top: 40.r, bottom: 0.r),
                alignment: Alignment.center,
                child: AppWidgets.CustomButton(
                  text: 'verification'.tr,
                  click: () => checkCode(),
                  height: 47.h,
                  width: 220.w,
                  radius: 6.r,
                )),
          ],
        ),
      ),
    );
  }
}
