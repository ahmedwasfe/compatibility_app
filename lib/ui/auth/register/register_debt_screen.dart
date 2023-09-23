//شاشة الدين
import 'package:compatibility_app/controller/register_controller.dart';
import 'package:compatibility_app/model/auth/register/beard_type.dart';
import 'package:compatibility_app/model/auth/register/commitment_type.dart';
import 'package:compatibility_app/model/auth/register/prayer_type.dart';
import 'package:compatibility_app/model/auth/register/smoking_type.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
class RegisterDebtScreen extends StatelessWidget {
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
        },icon: Icon(Icons.arrow_back,color: AppColors.colorgreenl,),),
      ),

      body: Form(
        child: SingleChildScrollView(
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
                width: double.infinity,
                height: 410.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r).r,
                  color: AppColors.lightGray6,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //////
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
                                  text: 'religious_commitment', fontWeight: FontWeight.w500),
                            ),
                            Container(
                                padding: EdgeInsetsDirectional.only(start: 4.r),
                                child: AppText.medium(
                                    text: '*', color: Colors.red, fontSize: 18)),
                          ],
                        ),
                      ),
                      GetBuilder<RegisterController>(
                          builder: (controller) => Container(
                            width: double.infinity,
                            height: 58.h,
                            padding: EdgeInsetsDirectional.only(start: 14,end: 14,top: 8.r),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Obx(() => AppText.medium(
                                  text: controller.selectedCommitmentType_.value.isNotEmpty
                                      ? controller.selectedCommitmentType_.value.tr
                                      : 'choose_religious_commitment'.tr,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightGray3,
                                )),
                                items: controller.listCommitmentType
                                    .map((item) =>
                                    DropdownMenuItem<CommitmentType>(
                                      value: item,
                                      child: AppText.medium(text: item.name),
                                    ))
                                    .toList(),
                                onChanged: (value) {
                                  controller.selectedCommitmentType_.value = value!.name;
                                  controller.selectedCommitmentType_ = value.value as RxString;
                                  print('TYPE: ${controller.selectedCommitmentType_}');
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
                          )),







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
                                  text: 'prayer', fontWeight: FontWeight.w500),
                            ),
                            Container(
                                padding: EdgeInsetsDirectional.only(start: 4.r),
                                child: AppText.medium(
                                    text: '*', color: Colors.red, fontSize: 18)),
                          ],
                        ),
                      ),
                      GetBuilder<RegisterController>(
                          builder: (controller) => Container(
                            width: double.infinity,
                            height: 58.h,
                            padding: EdgeInsetsDirectional.only(start: 14,end: 14,top: 8.r),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Obx(() => AppText.medium(
                                  text: controller.selectedPrayerType_.value.isNotEmpty
                                      ? controller.selectedPrayerType_.value.tr
                                      : 'choose_prayer_range'.tr,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightGray3,
                                )),
                                items: controller.listPrayerType
                                    .map((item) =>
                                    DropdownMenuItem<PrayerType>(
                                      value: item,
                                      child: AppText.medium(text: item.name),
                                    ))
                                    .toList(),
                                onChanged: (value) {
                                  controller.selectedPrayerType_.value = value!.name;
                                  controller.selectedPrayerType_ = value.value as RxString;
                                  print('TYPE: ${controller.selectedPrayerType_}');
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
                          )),








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
                                  text: 'smoking', fontWeight: FontWeight.w500),
                            ),
                            Container(
                                padding: EdgeInsetsDirectional.only(start: 4.r),
                                child: AppText.medium(
                                    text: '*', color: Colors.red, fontSize: 18)),
                          ],
                        ),
                      ),
                      GetBuilder<RegisterController>(
                          builder: (controller) => Container(
                            width: double.infinity,
                            height: 58.h,
                            padding: EdgeInsetsDirectional.only(start: 14,end: 14,top: 8.r),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Obx(() => AppText.medium(
                                  text: controller.selectedSmokingType_.value.isNotEmpty
                                      ? controller.selectedSmokingType_.value.tr
                                      : 'choose_whether_smoke_not'.tr,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightGray3,
                                )),
                                items: controller.listSmokingType
                                    .map((item) =>
                                    DropdownMenuItem<SmokingType>(
                                      value: item,
                                      child: AppText.medium(text: item.name),
                                    ))
                                    .toList(),
                                onChanged: (value) {
                                  controller.selectedSmokingType_.value = value!.name;
                                  controller.selectedSmokingType_ = value.value as RxString;
                                  print('TYPE: ${controller.selectedSmokingType_}');
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
                          )),






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
                                  text: 'beard', fontWeight: FontWeight.w500),
                            ),
                            Container(
                                padding: EdgeInsetsDirectional.only(start: 4.r),
                                child: AppText.medium(
                                    text: '*', color: Colors.red, fontSize: 18)),
                          ],
                        ),
                      ),
                      GetBuilder<RegisterController>(
                          builder: (controller) => Container(
                            width: double.infinity,
                            height: 58.h,
                            padding: EdgeInsetsDirectional.only(start: 14,end: 14,top: 8.r),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                isExpanded: true,
                                hint: Obx(() => AppText.medium(
                                  text: controller.selectedbeardType_.value.isNotEmpty
                                      ? controller.selectedbeardType_.value.tr
                                      : 'choose_whether_bearded_not'.tr,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightGray3,
                                )),
                                items: controller.listbeardType
                                    .map((item) =>
                                    DropdownMenuItem<BeardType>(
                                      value: item,
                                      child: AppText.medium(text: item.name),
                                    ))
                                    .toList(),
                                onChanged: (value) {
                                  controller.selectedbeardType_.value = value!.name;
                                  controller.selectedbeardType_ = value.value as RxString;
                                  print('TYPE: ${controller.selectedbeardType_}');
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
                          )),




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
                  padding: EdgeInsetsDirectional.only(top: 14.r,bottom: 10),
                  alignment: Alignment.center,
                  child: AppWidgets.CustomButton(
                    text: 'next'.tr,
                    click: () {
                      Get.toNamed(Routes.register_Study);
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



