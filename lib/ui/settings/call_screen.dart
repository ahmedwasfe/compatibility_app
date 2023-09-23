import 'package:compatibility_app/controller/settings_controller.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

//اتصل بنا
class CallScreen extends StatelessWidget {
  SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.medium(
            text: 'call_us',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Stack(
            children: [
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  '${Const.images}notfiactions.svg',
                  height: 25.h,
                  width: 25.w,
                ),
              ),
              Container(
                alignment: AlignmentDirectional.center,
                width: 15.w,
                height: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.lightred
                ),
                child: AppText.medium(text: '8',color: Colors.white,fontSize: 10),
              ),
            ],
          ),
        ],
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(top: 30.r, start: 16.r),
                child: AppText.medium(
                    text: 'do_any_questions',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.h,
                    color: AppColors.lightGray87),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start:16.r ,end:16.r ,top: 15.r
                ),
                width: double.infinity,
                height: 510.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: AppColors.lightGray6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsetsDirectional.only(
                                top: 20.r, start: 16.r),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.topStart,
                                  child: AppText.medium(
                                      text: 'full_name',
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 4.r),
                                    child: AppText.medium(
                                        text: '*',
                                        color: Colors.red,
                                        fontSize: 18)),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(
                                top: 8.r, start: 14.r, end: 14.r),
                            child: TextFormField(
                              textInputAction: TextInputAction.go,
                              controller: controller.fullNameController,
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.black,
                              cursorWidth: 1.3.w,
                              cursorRadius: const Radius.circular(10).r,
                              enabled: true,
                              textAlignVertical:
                                  AppHelper.getTextAlignVertical(),
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
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.w),
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
                                  AppHelper.validateFullName(name: name!),
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
                            margin: EdgeInsetsDirectional.only(
                                top: 20.r, start: 16.r),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.topStart,
                                  child: AppText.medium(
                                      text: 'phone',
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 4.r),
                                    child: AppText.medium(
                                        text: '*',
                                        color: Colors.red,
                                        fontSize: 18)),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(
                                top: 8.r, start: 14.r, end: 14.r),
                            child: TextFormField(
                              textInputAction: TextInputAction.go,
                              controller: controller.phoneController,
                              keyboardType: TextInputType.phone,
                              cursorColor: Colors.black,
                              cursorWidth: 1.3.w,
                              cursorRadius: const Radius.circular(10).r,
                              enabled: true,
                              textAlignVertical:
                                  AppHelper.getTextAlignVertical(),
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
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 0.w),
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
                              validator: (phone) =>
                                  AppHelper.validatePhone(phone: phone!),
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
                            margin: EdgeInsetsDirectional.only(
                                top: 20.r, start: 16.r),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.topStart,
                                  child: AppText.medium(
                                      text: 'email',
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 4.r),
                                    child: AppText.medium(
                                        text: '*',
                                        color: Colors.red,
                                        fontSize: 18)),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(
                                top: 8.r, start: 14.r, end: 14.r),
                            child: TextFormField(
                              textInputAction: TextInputAction.go,
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              cursorWidth: 1.3.w,
                              cursorRadius: const Radius.circular(10).r,
                              enabled: true,
                              textAlignVertical:
                                  AppHelper.getTextAlignVertical(),
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                  hintText: 'example@exmaple.com'.tr,
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
                                        color: Colors.white, width: 0.w),
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
                              validator: (email) =>
                                  AppHelper.validateEmail(email: email!),
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
                            margin: EdgeInsetsDirectional.only(
                                top: 20.r, start: 16.r),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.topStart,
                                  child: AppText.medium(
                                      text: 'message_text',
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  margin: EdgeInsetsDirectional.only(start: 5.r),
                                  alignment: AlignmentDirectional.topStart,
                                  child: AppText.medium(
                                      text: 'number_characters',
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grayColorB),
                                ),
                                Container(
                                    padding:
                                        EdgeInsetsDirectional.only(start: 4.r),
                                    child: AppText.medium(
                                        text: '*',
                                        color: Colors.red,
                                        fontSize: 18)),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(
                                top: 10.r, start: 12, end: 12),
                            width: 320.r,
                            height: 121.r,
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                                color: AppColors.lightBorder,
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Container(
                                margin: EdgeInsetsDirectional.only(
                                    top: 0.r, start: 0.r, end: 0.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      textInputAction: TextInputAction.go,
                                      controller: controller.textNameController,
                                      keyboardType: TextInputType.text,
                                      cursorColor: Colors.black,
                                      cursorWidth: 1.3.w,
                                      cursorRadius: const Radius.circular(10).r,
                                      enabled: true,
                                      textAlignVertical:
                                          AppHelper.getTextAlignVertical(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                          hintText: 'leave_message'.tr,
                                          hintStyle: TextStyle(
                                              color: AppColors.grayColor,
                                              fontSize: 14.h,
                                              fontWeight: FontWeight.w400),
                                          // fillColor:  AppColors.colorGray,
                                          fillColor: AppColors.lightBorder,
                                          filled: true,
                                          helperMaxLines: 2,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColors.lightBorder,
                                                width: 0.w),
                                            borderRadius:
                                                BorderRadius.circular(0).r,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColors.lightBorder,
                                                width: 0.w),
                                            borderRadius:
                                                BorderRadius.circular(0).r,
                                          ),
                                          constraints: BoxConstraints(
                                            maxHeight: 300.h,
                                            minWidth: 48.w,
                                          )),
                                      validator: (name) =>
                                          AppHelper.detialsName(name: name!),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),




              Container(
                  padding: EdgeInsetsDirectional.only(top: 20.r, bottom: 10),
                  alignment: Alignment.center,
                  child: AppWidgets.CustomButton(
                    text: 'next'.tr,
                    click: () {},
                    height: 47.h,
                    width: 220.w,
                    radius: 6.r,
                  )),
              Container(
                margin: EdgeInsetsDirectional.only(top: 20.r,bottom: 20.r

                ),
                alignment: AlignmentDirectional.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: SvgPicture.asset(
                        '${Const.images}fecebook.svg',
                        width: 35.w,
                        height: 35.h,
                      ),
                    ),
                    Container(
                      child: SvgPicture.asset(
                        '${Const.images}twitter.svg',
                        width: 35.w,
                        height: 35.h,
                      ),
                    ),
                    Container(
                      child: SvgPicture.asset(
                        '${Const.images}insta.svg',
                        width: 35.w,
                        height: 35.h,
                      ),
                    ),
                    Container(
                      child: SvgPicture.asset(
                        '${Const.images}linkedin.svg',
                        width: 35.w,
                        height: 35.h,
                      ),
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
