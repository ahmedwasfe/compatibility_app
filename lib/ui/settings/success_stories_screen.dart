import 'package:compatibility_app/controller/settings_controller.dart';
import 'package:compatibility_app/controller/success_stories_controller.dart';
import 'package:compatibility_app/model/settings/countries.dart';
import 'package:compatibility_app/model/settings/country.dart';
import 'package:compatibility_app/model/success_stories.dart';
import 'package:compatibility_app/model/user.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

//شاشة قصص نجاح
class SuccessStoriesScreen extends StatelessWidget {
  final _controller = Get.put(SuccessStoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.medium(
            text: 'success_stories',
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
          FutureBuilder(
              future: _controller.getCountries(),
              builder: (_, snap) => GetBuilder<SuccessStoriesController>(
                  builder: (controller) => Container(
                        width: 200.w,
                        height: 58.h,
                        padding: EdgeInsetsDirectional.only(
                            start: 14, end: 14, top: 8.r),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Obx(() => AppText.medium(
                                  text: controller
                                          .selectedCountry_.value.isNotEmpty
                                      ? controller.selectedCountry_.value.tr
                                      : 'select_country'.tr,
                                  fontSize: 12.h,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lightGray18,
                                )),
                            items: controller.listCountries
                                .map((item) => DropdownMenuItem<CountryData>(
                                      value: item,
                                      child: Row(
                                        children: [
                                          Checkbox(
                                              // checkColor: AppColors.colorpurple,
                                              splashRadius: 18,
                                              value: false,
                                              onChanged: (bool? value) {}
                                              //   // controller.isChecked = value!;
                                              //
                                              //   for(MembersFiltered memberas in controller.listFilteredType) {
                                              //     controller.selectedMembersFiltered.value.isNotEmpty!;
                                              //   }
                                              //
                                              //   controller.selectedMembersFiltered.value.isNotEmpty!;
                                              //   controller.update();
                                              // },

                                              ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          AppText.medium(
                                              text: item.name!, fontSize: 12.h),
                                        ],
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              controller.selectedCountry_.value = value!.name!;
                              controller.selectedCountry = value.id!;
                              _controller.getSuccessStories(countryId: controller.selectedCountry);
                              print('TYPE: ${controller.selectedCountry_}');
                              controller.update();
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              size: 26,
                              color: AppColors.lightGray3,
                            ),
                            iconSize: 14.sp,
                            iconEnabledColor: Colors.white,
                            iconDisabledColor: Colors.white,
                            buttonHeight: 50.h,
                            buttonWidth: 40.w,
                            buttonPadding:
                                const EdgeInsets.only(left: 14, right: 14),
                            buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                    color: AppColors.lightGray8, width: 0.3.w),
                                color: Colors.white),
                            itemHeight: 60,
                            dropdownMaxHeight: 180,
                            dropdownWidth: 250,
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
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
      body: FutureBuilder(
        future: _controller.getSuccessStories(),
        builder: (_, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 50.r),
                    alignment: AlignmentDirectional.center,
                    child: SvgPicture.asset(
                      '${Const.images}sing_up.svg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 206.h,
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 20.r),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.larg(text: 'success_story'.tr, fontSize: 17.h),
                        SizedBox(
                          width: 3.w,
                        ),
                        GetBuilder<SuccessStoriesController>(builder: (controller) => AppText.larg(text: _controller.listUsers.length.toString(), fontSize: 17.h)),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                    EdgeInsetsDirectional.only(top: 12.r, start: 15.r, end: 15.r),
                    alignment: AlignmentDirectional.center,
                    child: AppText.larg(
                        text: 'god_together_goodness',
                        color: Colors.black,
                        fontSize: 17.h),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 12.r, bottom: 20.r),
                    alignment: AlignmentDirectional.center,
                    child: AppText.larg(
                        text: 'congratu_finding_half',
                        color: Colors.black,
                        fontSize: 14.h),
                  ),
                  GetBuilder<SuccessStoriesController>(builder: (controller) => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _controller.listUsers.length,
                      itemBuilder: (context, index) => buildSuccessStoriesItem(_controller.listUsers[index])))
                ],
              ),
            );
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return AppWidgets.CustomAnimationProgress();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget buildSuccessStoriesItem(SuccessStoriesUsers user) {
    return Container(
      margin: EdgeInsetsDirectional.only(
          top: 5.r, end: 16.r, start: 16.r, bottom: 20.r),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.lightGray6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(start: 5.r, top: 10.r),
                child: CircleCachedImage(
                    radius: 24,
                    imageUrl: user.maleImageUrl!.isNotEmpty ? user.maleImageUrl! : Const.defaultUserImage),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 10.r, top: 10.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText.medium(
                              text: 'name',
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          SizedBox(
                            width: 4.w,
                          ),
                          AppText.medium(
                              text: user.manName!,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.lightGray15),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 11.r),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText.medium(
                              text: 'age',
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          SizedBox(
                            width: 4.w,
                          ),
                          AppText.medium(
                              text: user.manAge!,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.lightGray15),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(start: 5.r, top: 10.r),
                child: CircleCachedImage(
                    radius: 24,
                    imageUrl: user.femaleImageUrl!.isNotEmpty ? user.femaleImageUrl! : Const.defaultUserImage),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 10.r, top: 10.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText.medium(
                              text: 'name',
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          SizedBox(
                            width: 4.w,
                          ),
                          AppText.medium(
                              text: user.femaleName!,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.lightGray15),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 11.r),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText.medium(
                              text: 'age',
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          SizedBox(
                            width: 4.w,
                          ),
                          AppText.medium(
                              text: user.femaleAge!,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.lightGray15),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsetsDirectional.only(start: 45.r, top: 10.r),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: 12.r, start: 20.r),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText.medium(
                          text: 'registration_period',
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        width: 4.w,
                      ),
                      AppText.medium(
                          text: ' منذ 1500',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.lightGray15),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 12.r, start: 20.r, bottom: 12.r),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText.medium(
                        text: 'message'.tr,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Expanded(
                        child: AppText.medium(
                            text: user.manText!,
                            fontSize: 12.h,
                            maxline: 2,
                            fontWeight: FontWeight.w600,
                            color: AppColors.lightplue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
