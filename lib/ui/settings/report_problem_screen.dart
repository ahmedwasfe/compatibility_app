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

class ReportProblemScreen extends StatelessWidget {
  SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.medium(
            text: 'report_problem',
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: AlignmentDirectional.topStart,
                margin: EdgeInsetsDirectional.only(top: 14.r, start: 16.r),
                child: AppText.medium(
                    text: 'problem',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.h,
                    color: AppColors.lightGray87),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(
                    start: 16.r, end: 16.r, top: 15.r, bottom: 20.r),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: AppColors.lightGray6,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsetsDirectional.only(top: 12.r, start: 14.r),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsetsDirectional.only(
                                top: 12.r, start: 14.r),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.topStart,
                                  child: AppText.medium(
                                      text: 'cause_problem'.tr,
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                    margin:
                                        EdgeInsetsDirectional.only(start: 4.r),
                                    child: AppText.medium(
                                        text: '*',
                                        color: Colors.red,
                                        fontSize: 18)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(
                          top: 8.r, start: 14.r, end: 14.r),
                      child: TextFormField(
                        textInputAction: TextInputAction.go,
                        controller: controller.subjectController,
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
                            hintText: 'cause_problem'.tr,
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
                                  BorderSide(color: Colors.white, width: 0.w),
                              borderRadius: BorderRadius.circular(8).r,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.w),
                              borderRadius: BorderRadius.circular(8).r,
                            ),
                            constraints: BoxConstraints(
                              maxHeight: 50.h,
                              minWidth: 48.w,
                            )),
                        onTap: () => controller.subjectController.clear(),
                        validator: (value) {
                          if (!AppHelper.validate(value: value!)) {
                            AppHelper.showToast(
                                message: 'cause_problem'.tr,
                                color: Colors.redAccent);
                            controller.isLoading(false);
                          }
                        },
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsetsDirectional.only(top: 12.r, start: 14.r),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: AlignmentDirectional.topStart,
                            child: AppText.medium(
                                text: 'message_content'.tr,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                              margin: EdgeInsetsDirectional.only(start: 4.r),
                              child: AppText.medium(
                                  text: '*', color: Colors.red, fontSize: 18)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(
                          top: 10.r, start: 12, end: 12, bottom: 20.r),
                      width: 320.r,
                      height: 150.r,
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
                                controller: controller.messageProblemController,
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
                                      borderRadius: BorderRadius.circular(0).r,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.lightBorder,
                                          width: 0.w),
                                      borderRadius: BorderRadius.circular(0).r,
                                    ),
                                    constraints: BoxConstraints(
                                      maxHeight: 300.h,
                                      minWidth: 48.w,
                                    )),
                                onTap: () =>
                                    controller.messageProblemController.clear(),
                                validator: (value) {
                                  if (!AppHelper.validate(value: value!)) {
                                    AppHelper.showToast(
                                        message: 'cause_problem'.tr,
                                        color: Colors.redAccent);
                                    controller.isLoading(false);

                                  }
                                  return '';
                                },
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsetsDirectional.only(top: 100.r, bottom: 10),
                  alignment: Alignment.center,
                  child: AppWidgets.CustomButton(
                    text: 'send_problem'.tr,
                    click: () {
                      controller.problem();
                    },
                    height: 47.h,
                    width: 220.w,
                    radius: 6.r,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
