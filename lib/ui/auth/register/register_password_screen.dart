import 'package:compatibility_app/controller/register_controller.dart';
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
class RegisterPasswordScreen extends GetView<RegisterController>  {
  
 RegisterController controller=Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back,color: AppColors.colorgreenl,),),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(top: 0.r),
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
                height: 265.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r).r,
                  color: AppColors.lightGray6,
                ),
                child: SingleChildScrollView(
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
                        child: GetBuilder<RegisterController>(builder: (controller) => TextFormField(
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
                        )),

                      ),


                      Container(
                        margin: EdgeInsetsDirectional.only(
                            top: 8.r, start: 14.r, end: 14.r),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.topStart,
                                  child: AppText.medium(
                                      text: 'please_click_the_password', fontWeight: FontWeight.w500),
                                ),
                                Container(
                                    padding: EdgeInsetsDirectional.only(start: 4.r),
                                    child: AppText.medium(
                                        text: '*', color: Colors.red, fontSize: 18)),
                              ],
                            ),
                            SizedBox(height: 8.h,),
                            GetBuilder<RegisterController>(builder: (controller) => TextFormField(
                              textInputAction: TextInputAction.go,
                              controller: controller.confirmPasswordController,
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
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.w),
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
                          ],
                        ),

                      ),

                      Container(
                        margin: EdgeInsetsDirectional.only(
                            top: 10.r, start: 0.r, end: 0.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.medium(text: '*'),
                            AppText.medium(
                                text: 'figures_special_characters',
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                    margin: const EdgeInsets.only(bottom: 0),
                    child: Obx(() => controller.isLoading.isTrue ? AppWidgets.CustomAnimationProgress() : Container())),
              ),
              Container(
                  padding: EdgeInsetsDirectional.only(top:30.r),
                  alignment: Alignment.center,
                  child: AppWidgets.CustomButton(
                    text: 'next'.tr,
                    click: () {
                      if(controller.isValidationPassword(context)){
                        Get.toNamed(Routes.register_nationality);
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
