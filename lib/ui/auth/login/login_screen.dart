import 'package:compatibility_app/controller/login_controller.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AppHelper.statusBarColor(isHome: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(top: 105.r),
                alignment: AlignmentDirectional.center,
                child: AppText.larg(
                  text: 'welcome_to_the_application',
                  color: Colors.black,
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 12.r),
                alignment: AlignmentDirectional.center,
                child: AppText.medium(
                    text: 'to_continue_not_log',
                    color: AppColors.darkSecondColor),
              ),
              Image.asset('${Const.images}we.gif',width: double.infinity),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                      EdgeInsetsDirectional.only(top: 40.r, start: 16.r),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: AlignmentDirectional.topStart,
                            child: AppText.medium(
                                text: 'user_name', fontWeight: FontWeight.w500),
                          ),
                          Container(
                              padding: EdgeInsetsDirectional.only(start: 4.r),
                              child: AppText.medium(
                                  text: '*', color: Colors.red, fontSize: 18)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(
                          top: 8.r, start: 14.r, end: 14.r),
                      child: TextFormField(
                        textInputAction: TextInputAction.go,
                        controller: controller.usernameController,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        cursorWidth: 1.3.w,
                        cursorRadius: const Radius.circular(10).r,
                        enabled: true,
                        textAlignVertical: AppHelper.getTextAlignVertical(),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            hintText: 'enter_username'.tr,
                            hintStyle: TextStyle(
                                color: AppColors.grayColor,
                                fontSize: 14.h,
                                fontWeight: FontWeight.w400),
                            // fillColor:  AppColors.colorGray,
                            fillColor: Colors.white,
                            filled: true,
                            helperMaxLines: 2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.lightGray8, width: 0.3.w),
                              borderRadius: BorderRadius.circular(8).r,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black, width: 1.w),
                              borderRadius: BorderRadius.circular(8).r,
                            ),
                            constraints: BoxConstraints(
                              maxHeight: 50.h,
                              minWidth: 48.w,
                            )),
                        validator: (name) =>
                            AppHelper.validateUserName(name: name!),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                      EdgeInsetsDirectional.only(top: 20.r, start: 16.r),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: AlignmentDirectional.topStart,
                            child: AppText.medium(
                                text: 'password', fontWeight: FontWeight.w500),
                          ),
                          Container(
                              padding: EdgeInsetsDirectional.only(start: 4.r),
                              child: AppText.medium(
                                  text: '*', color: Colors.red, fontSize: 18)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(
                          top: 8.r, start: 14.r, end: 14.r),
                      child: GetBuilder<LoginController>(
                        builder: (controller) => TextFormField(
                          textInputAction: TextInputAction.go,
                          controller: controller.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.isVisiblePass,
                          obscuringCharacter: '•',
                          cursorColor: Colors.black,
                          cursorWidth: 1.3.w,
                          cursorRadius: const Radius.circular(10).r,
                          enabled: true,
                          textAlignVertical: AppHelper.getTextAlignVertical(),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'please_confirm_your_password_here'.tr,
                            hintStyle: TextStyle(
                                color: AppColors.grayColor,
                                fontSize: 14.h,
                                fontWeight: FontWeight.w400),
                            // fillColor:  AppColors.colorGray,
                            fillColor: Colors.white,
                            filled: true,
                            helperMaxLines: 2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.lightGray8, width: 0.3.w),
                              borderRadius: BorderRadius.circular(8).r,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black, width: 1.w),
                              borderRadius: BorderRadius.circular(8).r,
                            ),
                            suffixIcon: InkWell(
                              child: Icon(controller.visiblePassIcon,
                                  color: Colors.black),
                              onTap: () => controller.visiblePassword(),
                            ),
                            constraints: BoxConstraints(
                              maxHeight: 50.h,
                              minWidth: 48.w,
                            ),
                          ),
                          validator: (password) =>
                              AppHelper.validatePassword(password: password!),
                        ),
                      ),

                      ),

                  ],
                ),
              ),


              Center(
                child: Container(
                    margin: const EdgeInsets.only(bottom: 0),
                    child: Obx(() => controller.isLoading.isTrue ? AppWidgets.CustomAnimationProgress() : Container())),
              ),
              Container(
                  padding: EdgeInsetsDirectional.only(top: 20.r),
                  alignment: Alignment.center,
                  child: AppWidgets.CustomButton(text: 'sing_in'.tr,
                    click:(){
                      // Get.toNamed(Routes.verificationCode);
                    controller.login(context);
                  },
                    height: 47.h,width: 220.w,radius: 6.r,
                  )),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.medium(text: 'don_have_account',
                        fontSize: 16.sp,
                        color: AppColors.lightgray),
                    SizedBox(width: 2.w),
                    InkWell(
                      child: AppText.medium(text: 'create_account',fontSize: 16.sp, color: Colors.black,textDecoration: TextDecoration.underline),
                      onTap: () => Get.toNamed(Routes.user_type),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
