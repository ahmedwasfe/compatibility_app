import 'package:compatibility_app/controller/register_controller.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_text.dart';

class RegisterScreen extends GetView<RegisterController> {

  RegisterController controller=Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(top: 105.r),
                alignment: AlignmentDirectional.center,
                child: AppText.larg(
                  text: 'register_new_pair',
                  color: Colors.black,
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 12.r),
                alignment: AlignmentDirectional.center,
                child: AppText.medium(
                    text: 'oh_grant_good_wife',
                    color: AppColors.darkSecondColor),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 35.r),
                alignment: AlignmentDirectional.center,
                child: SvgPicture.asset(
                  '${Const.images}sing_up.svg',
                  fit: BoxFit.cover,
                  height: 186.h,
                  width: double.infinity,
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(
                    top: 36.r, start: 16.r, end: 16.r),
                width: double.infinity,
                height: 202.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r).r,
                  color: AppColors.lightGray6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                    Container(
                      margin: EdgeInsetsDirectional.only(
                          top: 10.r, start: 14.r, end: 0.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.medium(text: '*'),
                          AppText.medium(
                              text: 'username_nickname_that',
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ],
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
                  padding: EdgeInsetsDirectional.only(top: 100.r),
                  alignment: Alignment.center,
                  child: AppWidgets.CustomButton(
                    text: 'next'.tr,
                    click: () {
                      if(controller.isValidationUsername(context)){
                        Get.toNamed(Routes.register_password);
                      }
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
