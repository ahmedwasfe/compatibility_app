
import 'package:compatibility_app/controller/settings_controller.dart';
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
import 'package:url_launcher/url_launcher.dart';

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
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          GestureDetector(
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              margin: EdgeInsetsDirectional.only(end: 20.r),
              child: Stack(
                // alignment: AlignmentDirectional.topEnd,
                children: [
                  SvgPicture.asset(
                      width: 28.w, height: 28.h, '${Const.images}notfiactions.svg'),
                  Container(
                    alignment: AlignmentDirectional.topCenter,
                    margin: EdgeInsetsDirectional.only(top: 0.r, start: 13.0.r),
                    width: 18.w,
                    height: 18.h,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadiusDirectional.circular(50.r)),
                    child: AppText.medium(
                        text: '8',
                        fontWeight: FontWeight.w300,
                        fontSize: 10.sp,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            onTap: () => Get.toNamed(Routes.notifications),
          ),
        ],
      ),
      body: Form(
        child: FutureBuilder(
          future: controller.getAppSettings(),
          builder: (_, snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              return SingleChildScrollView(
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
                      margin: EdgeInsetsDirectional.only(start:16.r ,end:16.r ,top: 15.r,bottom: 20
                      ),
                      width: double.infinity,
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
                                    controller: controller.nameController,
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
                                    onTap: () => controller.nameController.clear(),
                                    validator: (value){
                                      if (!AppHelper.validate(value: value!)) {
                                        AppHelper.showToast(
                                            message: 'enter_username'.tr,
                                            color: Colors.redAccent);
                                        controller.isLoading(false);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
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
                                  controller: controller.mobileController,
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
                                  onTap: () => controller.mobileController.clear(),

                                  validator: (value){
                                    if (!AppHelper.validate(value: value!)) {
                                      AppHelper.showToast(
                                          message: 'enter_phone_number'.tr,
                                          color: Colors.redAccent);
                                      controller.isLoading(false);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
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
                                    top: 0.r, start: 14.r, end: 14.r),
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
                                  onTap: () => controller.emailController.clear(),

                                  validator: (value){
                                    if (!AppHelper.validate(value: value!)) {
                                      AppHelper.showToast(
                                          message: 'enter_email'.tr,
                                          color: Colors.redAccent);
                                      controller.isLoading(false);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
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
                                          controller: controller.messageController,
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
                                          onTap: () => controller.messageController.clear(),
                                          validator: (value){
                                            if (!AppHelper.validate(value: value!)) {
                                              AppHelper.showToast(
                                                  message: 'enter_message'.tr,
                                                  color: Colors.redAccent);
                                              controller.isLoading(false);
                                            }
                                          },
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h,),

                        ],
                      ),
                    ),

                    //
                    // Center(
                    //   child: Container(
                    //       margin: const EdgeInsets.only(bottom: 0),
                    //       child: Obx(() => controller.isLoading.isTrue
                    //           ? AppWidgets.CustomAnimationProgress()
                    //           : Container())),
                    // ),
                    Container(
                        padding: EdgeInsetsDirectional.only(top: 20.r, bottom: 10),
                        alignment: Alignment.center,
                        child: AppWidgets.CustomButton(
                          text: 'next'.tr,
                          click: () {
                            controller.contactus();},
                          height: 47.h,
                          width: 220.w,
                          radius: 6.r,
                        )),
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 20.r,bottom: 50.r

                      ),
                      alignment: AlignmentDirectional.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () => launchUrl(
                                Uri.parse('${controller.setting.facebook}')),
                            child: Container(
                              child: SvgPicture.asset(
                                '${Const.images}fecebook.svg',
                                width: 35.w,
                                height: 35.h,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => launchUrl(
                                Uri.parse('${controller.setting.twitter}')),
                            child: Container(
                              child: SvgPicture.asset(
                                '${Const.images}twitter.svg',
                                width: 35.w,
                                height: 35.h,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => launchUrl(
                                Uri.parse('${controller.setting.instagram}')),
                            child: Container(
                              child: SvgPicture.asset(
                                '${Const.images}insta.svg',
                                width: 35.w,
                                height: 35.h,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => launchUrl(
                                Uri.parse('${controller.setting.linkedIn}')),
                            child: Container(
                              child: SvgPicture.asset(
                                '${Const.images}linkedin.svg',
                                width: 35.w,
                                height: 35.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }else if(snapshot.connectionState == ConnectionState.waiting){
              return AppWidgets.CustomAnimationProgress();
            }else {
              return Container(

              );
            }
          },
        ),
      ),
    );
  }
}