import 'package:compatibility_app/controller/register_controller.dart';
import 'package:compatibility_app/model/settings/education_field.dart';
import 'package:compatibility_app/model/settings/educational.dart';
import 'package:compatibility_app/model/settings/financial.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterEducationScreen extends StatelessWidget {
  RegisterController controller=Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: const Icon(Icons.arrow_back,color: AppColors.colorgreenl,),),
      ),

      body: Form(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(top: 10.r),
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
                padding: EdgeInsetsDirectional.only(bottom: 20.r),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r).r,
                  color: AppColors.lightGray6,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //////العلمي
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
                                text: 'educational_qualification', fontWeight: FontWeight.w500),
                          ),
                          Container(
                              padding: EdgeInsetsDirectional.only(start: 4.r),
                              child: AppText.medium(
                                  text: '*', color: Colors.red, fontSize: 18)),
                        ],
                      ),
                    ),
                    FutureBuilder(
                        future: controller.getEducational(),
                        builder: (_, snapshot) => GetBuilder<RegisterController>(
                            builder: (controller) => Container(
                              width: double.infinity,
                              height: 58.h,
                              padding: EdgeInsetsDirectional.only(start: 14,end: 14,top: 8.r),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Obx(() => AppText.medium(
                                    text: controller.selectedEducationalType_.value.isNotEmpty
                                        ? controller.selectedEducationalType_.value.tr
                                        : 'choose_your_educational'.tr,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightGray3,
                                  )),
                                  items: controller.listEducational
                                      .map((item) =>
                                      DropdownMenuItem<EducationalData>(
                                        value: item,
                                        child: AppText.medium(text: item.name!),
                                      ))
                                      .toList(),
                                  onChanged: (value) {
                                    controller.selectedEducationalType_.value = value!.name!;
                                    controller.selectedEducational = value.id!;
                                    print('TYPE: ${controller.selectedEducational}');
                                    controller.update();
                                  },
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    size: 26,
                                    color:AppColors.lightGray3,
                                  ),
                                  iconSize: 14.sp,
                                  iconEnabledColor: Colors.white,
                                  iconDisabledColor: Colors.white,
                                  buttonHeight: 50.h,
                                  buttonWidth: 40.w,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  buttonDecoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color:
                                          AppColors.lightGray8,
                                          width: 0.3.w
                                      ),
                                      color: Colors.white),
                                  itemHeight: 60,
                                  dropdownMaxHeight: 180,
                                  dropdownWidth: 210,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(10, 0),
                                ),
                              ),
                            ))),
                    ///////المادي
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
                                text: 'financial_status', fontWeight: FontWeight.w500),
                          ),
                          Container(
                              padding: EdgeInsetsDirectional.only(start: 4.r),
                              child: AppText.medium(
                                  text: '*', color: Colors.red, fontSize: 18)),
                        ],
                      ),
                    ),
                    FutureBuilder(
                        future: controller.getFinancial(),
                        builder: (_, snapshot) => GetBuilder<RegisterController>(
                            builder: (controller) => Container(
                              width: double.infinity,
                              height: 58.h,
                              padding: EdgeInsetsDirectional.only(start: 14,end: 14,top: 8.r),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Obx(() => AppText.medium(
                                    text: controller.selectedFinancialStatusType_.value.isNotEmpty
                                        ? controller.selectedFinancialStatusType_.value.tr
                                        : 'choose_physical_mode'.tr,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightGray3,
                                  )),
                                  items: controller.listFinancial
                                      .map((item) =>
                                      DropdownMenuItem<FinancialData>(
                                        value: item,
                                        child: AppText.medium(text: item.name!),
                                      ))
                                      .toList(),
                                  onChanged: (value) {
                                    controller.selectedFinancialStatusType_.value = value!.name!;
                                    controller.selectedFinancial = value.id!;
                                    print('TYPE: ${controller.selectedFinancial}');
                                    controller.update();
                                  },
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    size: 26,
                                    color:AppColors.lightGray3,
                                  ),
                                  iconSize: 14.sp,
                                  iconEnabledColor: Colors.white,
                                  iconDisabledColor: Colors.white,
                                  buttonHeight: 50.h,
                                  buttonWidth: 40.w,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  buttonDecoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color:
                                          AppColors.lightGray8,
                                          width: 0.3.w
                                      ),
                                      color: Colors.white),
                                  itemHeight: 60,
                                  dropdownMaxHeight: 180,
                                  dropdownWidth: 210,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(10, 0),
                                ),
                              ),
                            ))),
                    ////التعليم///
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
                                text: 'education_field', fontWeight: FontWeight.w500),
                          ),
                          Container(
                              padding: EdgeInsetsDirectional.only(start: 4.r),
                              child: AppText.medium(
                                  text: '*', color: Colors.red, fontSize: 18)),
                        ],
                      ),
                    ),
                    FutureBuilder(
                        future: controller.getEducationField(),
                        builder: (_, snapshot) => GetBuilder<RegisterController>(
                            builder: (controller) => Container(
                              width: double.infinity,
                              height: 58.h,
                              padding: EdgeInsetsDirectional.only(start: 14,end: 14,top: 8.r),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Obx(() => AppText.medium(
                                    text: controller.selectedEducationFieldType_.value.isNotEmpty
                                        ? controller.selectedEducationFieldType_.value.tr
                                        : 'choose_field_work'.tr,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lightGray3,
                                  )),
                                  items: controller.listEducationField
                                      .map((item) =>
                                      DropdownMenuItem<EducationFieldData>(
                                        value: item,
                                        child: AppText.medium(text: item.name!),
                                      ))
                                      .toList(),
                                  onChanged: (value) {
                                    controller.selectedEducationFieldType_.value = value!.name!;
                                    controller.selectedEducationField = value.id!;
                                    print('TYPE: ${controller.selectedEducationField}');
                                    controller.update();
                                  },
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    size: 26,
                                    color:AppColors.lightGray3,
                                  ),
                                  iconSize: 14.sp,
                                  iconEnabledColor: Colors.white,
                                  iconDisabledColor: Colors.white,
                                  buttonHeight: 50.h,
                                  buttonWidth: 40.w,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  buttonDecoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color:
                                          AppColors.lightGray8,
                                          width: 0.3.w
                                      ),
                                      color: Colors.white),
                                  itemHeight: 60,
                                  dropdownMaxHeight: 180,
                                  dropdownWidth: 210,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(10, 0),
                                ),
                              ),
                            ))),
                    ///////
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
                                text: 'function', fontWeight: FontWeight.w500),
                          ),
                          Container(
                              padding: EdgeInsetsDirectional.only(start: 4.r),
                              child: AppText.medium(
                                  text: '*', color: Colors.red, fontSize: 18)),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsetsDirectional.only(start: 14,end: 14,top: 8.r),
                      child: TextFormField(
                        textInputAction: TextInputAction.go,
                        controller: controller.jobController,
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
                            hintText: 'enter_job_here'.tr,
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
                                  color: AppColors.grayColorBg2, width: 0.w),
                              borderRadius: BorderRadius.circular(8).r,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.grayColorBg2, width: 0.w),
                              borderRadius: BorderRadius.circular(8).r,
                            ),
                            constraints: BoxConstraints(
                              maxHeight: 50.h,
                              minWidth: 48.w,
                            )),
                        // validator: (name) =>
                        //     AppHelper.validateUserName(name: name!),
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
                  padding: EdgeInsetsDirectional.only(top: 14.r,bottom: 10),
                  alignment: Alignment.center,
                  child: AppWidgets.CustomButton(
                    text: 'next'.tr,
                    click: () {
                     if(controller.isValidationEducation(context)){
                       Get.toNamed(Routes.register_Wifes);
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

