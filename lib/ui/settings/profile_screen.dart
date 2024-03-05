import 'dart:io';

import 'package:compatibility_app/controller/login_controller.dart';
import 'package:compatibility_app/controller/profial_controller.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {

  ProfileController _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.medium(
            text: 'personal_information_file',
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(top: 20.r),
              alignment: AlignmentDirectional.center,
              child: GetBuilder<ProfileController>(builder: (controller) => Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  _controller.profileImage == null
                      ? CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    backgroundImage: NetworkImage(
                      _controller.user.customerAllowPhoto!.isNotEmpty
                          ? _controller.user.customerAllowPhoto![0].imageUrl!
                          : Const.defaultUserImage
                    ),
                  )
                      : CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(File(_controller.profileImage!.path)),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 75, end: 60),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColors.colorpurple,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white, width: 3)),
                    child: InkWell(
                        onTap: () {
                          _controller.requestStoragePermission();
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        )),
                  ),
                ],
              )),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 16.r, top: 33.r),
              alignment: AlignmentDirectional.topStart,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.medium(
                      text: 'personal_information'.tr,
                      fontSize: 15.h,
                      fontWeight: FontWeight.w600),
                  SizedBox(
                    height: 2.h,
                  ),
                  AppText.medium(
                      text: 'update_personal'.tr,
                      fontSize: 12.h,
                      fontWeight: FontWeight.w600,
                      color: AppColors.colorTextSubb),
                ],
              ),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              padding: EdgeInsetsDirectional.only(top: 30.r, start: 16.r),
              child: Row(
                children: [
                  AppText.medium(
                      text: 'full_name',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  Container(
                      padding: EdgeInsetsDirectional.only(start: 4.r),
                      child: AppText.medium(
                          text: '*', color: Colors.red, fontSize: 18)),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsetsDirectional.only(top: 8.r, start: 14.r, end: 14.r),
              child: TextFormField(
                textInputAction: TextInputAction.go,
                controller: _controller.fullNameController,
                keyboardType: TextInputType.name,
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
                    hintText: 'enter_full_name'.tr,
                    hintStyle: TextStyle(
                        color: AppColors.grayColor,
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400),
                    // fillColor:  AppColors.colorGray,
                    fillColor: Colors.white,
                    filled: true,
                    helperMaxLines: 2,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.lightGray8, width: 0.3.w),
                      borderRadius: BorderRadius.circular(8).r,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.w),
                      borderRadius: BorderRadius.circular(8).r,
                    ),
                    constraints: BoxConstraints(
                      maxHeight: 50.h,
                      minWidth: 48.w,
                    )),
                validator: (name) => AppHelper.validateUserName(name: name!),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              padding: EdgeInsetsDirectional.only(top: 16.r, start: 16.r),
              child: Row(
                children: [
                  AppText.medium(
                      text: 'phone', fontSize: 16, fontWeight: FontWeight.w500),
                  Container(
                      padding: EdgeInsetsDirectional.only(start: 4.r),
                      child: AppText.medium(
                          text: '*', color: Colors.red, fontSize: 18)),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsetsDirectional.only(top: 8.r, start: 14.r, end: 14.r),
              child: TextFormField(
                textInputAction: TextInputAction.go,
                controller: _controller.phoneController,
                keyboardType: TextInputType.phone,
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
                    hintText: '+966 555 555 555'.tr,
                    hintStyle: TextStyle(
                        color: AppColors.grayColor,
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400),
                    // fillColor:  AppColors.colorGray,
                    fillColor: Colors.white,
                    filled: true,
                    helperMaxLines: 2,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.lightGray8, width: 0.3.w),
                      borderRadius: BorderRadius.circular(8).r,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.w),
                      borderRadius: BorderRadius.circular(8).r,
                    ),
                    constraints: BoxConstraints(
                      maxHeight: 50.h,
                      minWidth: 48.w,
                    )),
                validator: (phone) => AppHelper.validatePhone(phone: phone!),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              padding: EdgeInsetsDirectional.only(top: 16.r, start: 16.r),
              child: Row(
                children: [
                  AppText.medium(
                      text: 'email', fontSize: 16, fontWeight: FontWeight.w500),
                  Container(
                      padding: EdgeInsetsDirectional.only(start: 4.r),
                      child: AppText.medium(
                          text: '*', color: Colors.red, fontSize: 18)),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsetsDirectional.only(top: 8.r, start: 14.r, end: 14.r),
              child: TextFormField(
                textInputAction: TextInputAction.go,
                controller: _controller.emailController,
                keyboardType: TextInputType.emailAddress,
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
                    hintText: 'example@gmail.com'.tr,
                    hintStyle: TextStyle(
                        color: AppColors.grayColor,
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400),
                    // fillColor:  AppColors.colorGray,
                    fillColor: Colors.white,
                    filled: true,
                    helperMaxLines: 2,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.lightGray8, width: 0.3.w),
                      borderRadius: BorderRadius.circular(8).r,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.w),
                      borderRadius: BorderRadius.circular(8).r,
                    ),
                    constraints: BoxConstraints(
                      maxHeight: 50.h,
                      minWidth: 48.w,
                    )),
                validator: (email) => AppHelper.validateEmail(email: email!),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: 20.r, start: 16.r),
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
                  child: GetBuilder<ProfileController>(builder: (controller) => TextFormField(
                    textInputAction: TextInputAction.go,
                    controller: _controller.passwordController,
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
                      hintText: 'please_click_password'.tr,
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
                        borderSide: BorderSide(color: Colors.black, width: 1.w),
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
                  )),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: 20.r, start: 16.r),
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
                  child: GetBuilder<ProfileController>(builder: (controller) => TextFormField(
                    textInputAction: TextInputAction.go,
                    controller: _controller.confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: controller.isVisibleConfirmPass,
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
                        borderSide: BorderSide(color: Colors.black, width: 1.w),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      suffixIcon: InkWell(
                        child: Icon(controller.visibleConfirmPassIcon,
                            color: Colors.black),
                        onTap: () => controller.visibleConfirmPassword(),
                      ),
                      constraints: BoxConstraints(
                        maxHeight: 50.h,
                        minWidth: 48.w,
                      ),
                    ),
                  )),
                ),
              ],
            ),
            Center(
              child: Obx(() => _controller.isLoading.isTrue ? AppWidgets.CustomAnimationProgress() : Container()),
            ),
            Container(
                padding: EdgeInsetsDirectional.only(top: 40.r, bottom: 20.r),
                alignment: Alignment.center,
                child: AppWidgets.CustomButton(
                  text: 'save'.tr,
                  click: () => _controller.updateProfile(context),
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
