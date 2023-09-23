import 'package:compatibility_app/controller/register_controller.dart';
import 'package:compatibility_app/model/settings/cities.dart';
import 'package:compatibility_app/model/settings/countries.dart';
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
class RegisterNationalityScreen extends StatelessWidget {

  RegisterController controller=Get.put(RegisterController());

  RegisterNationalityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading:IconButton(onPressed: (){
            Navigator.pop(context);
          },icon: const Icon(Icons.arrow_back,color: AppColors.colorgreenl,),),
        ),
        backgroundColor: Colors.white,
        body: Form(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                  margin: EdgeInsetsDirectional.only(top: 36.r, start: 16.r, end: 16.r),
                  padding: EdgeInsetsDirectional.only(bottom: 16.r),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r).r,
                    color: AppColors.lightGray6,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder(
                          future: controller.getCountries(),
                          builder: (_, snapshot) => Column(
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
                                          text: 'nationality', fontWeight: FontWeight.w500),
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
                                          text: controller.selectedNationality_.value.isNotEmpty
                                              ? controller.selectedNationality_.value.tr
                                              : 'select_nationality'.tr,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.lightGray3,
                                        )),
                                        items: controller.listCountries
                                            .map((item) =>
                                            DropdownMenuItem<CountryData>(
                                              value: item,
                                              child: AppText.medium(text: item.nationality!),
                                            )).toList(),
                                        onChanged: (value) {
                                          controller.selectedNationality_.value = value!.nationality!;
                                          controller.selectedNationality = value.id!;
                                          print('TYPE: ${controller.selectedNationality_}');
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
                                          text: 'country', fontWeight: FontWeight.w500),
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
                                          text: controller.selectedCountry_.value.isNotEmpty
                                              ? controller.selectedCountry_.value.tr
                                              : 'select_country'.tr,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.lightGray3,
                                        )),
                                        items: controller.listCountries
                                            .map((item) =>
                                            DropdownMenuItem<CountryData>(
                                              value: item,
                                              child: AppText.medium(text: item.name!),
                                            ))
                                            .toList(),
                                        onChanged: (value) {
                                          controller.selectedCountry_.value = value!.name!;
                                          controller.selectedCountry_.value = value.name!;
                                          controller.selectedCountry = value.id!;
                                          print('TYPE: ${controller.selectedCountry_}');
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
                          )),

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
                                  text: 'city', fontWeight: FontWeight.w500),
                            ),
                            Container(
                                padding: EdgeInsetsDirectional.only(start: 4.r),
                                child: AppText.medium(
                                    text: '*', color: Colors.red, fontSize: 18)),
                          ],
                        ),
                      ),
                      FutureBuilder(
                          future: controller.getCities(controller.selectedCountry),
                          builder: (_, snapshot) => GetBuilder<RegisterController>(
                              builder: (controller) => Container(
                                width: double.infinity,
                                height: 58.h,
                                padding: EdgeInsetsDirectional.only(start: 14,end: 14,top: 8.r),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    hint: Obx(() => AppText.medium(
                                      text: controller.selectedCity_.value.isNotEmpty
                                          ? controller.selectedCity_.value.tr
                                          : 'select_city'.tr,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.lightGray3,
                                    )),
                                    items: controller.listCities
                                        .map((item) =>
                                        DropdownMenuItem<CityData>(
                                          value: item,
                                          child: AppText.medium(text: item.name!),
                                        ))
                                        .toList(),
                                    onChanged: (value) {
                                      controller.selectedCity_.value = value!.name!;
                                      controller.selectedCity = value.id!;
                                      print('TYPE: ${controller.selectedCity_}');
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
                    ],
                  ),
                ),

                Center(
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 0),
                      child: Obx(() => controller.isLoading.isTrue ? AppWidgets.CustomAnimationProgress() : Container())),
                ),
                Container(
                    padding: EdgeInsetsDirectional.only(top: 14.r,bottom: 44.r),
                    alignment: Alignment.center,
                    child: AppWidgets.CustomButton(
                      text: 'next'.tr,
                      click: () {
                        if(controller.isValidationNationality(context)){
                          Get.toNamed(Routes.register_status);
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
      ),
    );
  }
}
