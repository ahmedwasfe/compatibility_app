import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:compatibility_app/controller/members_controller.dart';
import 'package:compatibility_app/model/filter_type.dart';
import 'package:compatibility_app/model/home/members.dart';
import 'package:compatibility_app/model/home/members_filtered.dart';
import 'package:compatibility_app/model/member/members.dart';
import 'package:compatibility_app/model/settings/countries.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/ui/members/profile_members_screen.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MembersScreen extends StatelessWidget {
  MembersController _controller = Get.put(MembersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        title: AppText.medium(text: 'members'),
        actions: [
          GetBuilder<MembersController>(builder: (controller) => Stack(
            children: [
              _controller.selectedMembersFiltered.value == Const.KEY_Memeber_ONLINE
                  ? FutureBuilder(
                  future: _controller.getCountries(),
                  builder: (_, snapshot) => GetBuilder<MembersController>(builder: (controller) => Container(
                    width: 180,
                    height: 58.h,
                    padding: EdgeInsetsDirectional.only(start: 14,end: 14,top: 8.r),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Obx(() => AppText.medium(
                          text: controller.selectedCountry_.value.isNotEmpty
                              ? controller.selectedCountry_.value.tr
                              : 'select_country'.tr,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightGray18,
                        )),
                        items: controller.listCountries
                            .map((item) =>
                            DropdownMenuItem<CountryData>(
                              value: item,
                              child:Row(
                                children: [
                                  AppText.medium(text: item.name!,fontSize: 12.h
                                  ),

                                ],
                              ),
                            ))
                            .toList(),
                        onChanged: (value) {
                          controller.selectedCountry_.value = value!.name!;
                          controller.selectedCountry = value.id!;
                          print('TYPE: ${controller.selectedMembersFiltered.value}');
                          _controller.getMemebers();
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
                  )))
                  : GetBuilder<MembersController>(
                  builder: (controller) => Container(
                    width: 180,
                    height: 58.h,
                    padding: EdgeInsetsDirectional.only(start: 14,end: 14,top: 8.r),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Obx(() => AppText.medium(
                          text: controller.selectedMembersFiltered.value.isNotEmpty
                              ? controller.selectedMembersFiltered.value.tr
                              : 'all'.tr,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightGray18,
                        )),
                        items: controller.listFilteredType
                            .map((item) =>
                            DropdownMenuItem<FilterType>(
                              value: item,
                              child:Row(
                                children: [
                                  AppText.medium(text: item.title,fontSize: 12.h
                                  ),

                                ],
                              ),
                            ))
                            .toList(),
                        onChanged: (value) {
                          controller.selectedMembersFiltered.value = value!.value;
                          print('TYPE: ${controller.selectedMembersFiltered}');
                          _controller.getMemebers();
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
          ))
        ],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _controller.getMemebers(),
        builder: (_, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  GetBuilder<MembersController>(builder: (controller) => controller.selectedMembersFiltered.value == Const.KEY_Memeber_ONLINE
                      ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: GetBuilder<MembersController>(
                          builder: (controller)=>
                              Container(
                                alignment: AlignmentDirectional.topEnd,
                                margin: EdgeInsetsDirectional.only(top: 30.r,end: 50.r),
                                child: Row(
                                  children: _controller.listGenderType.map((item) => AppWidgets.CustomButton(
                                      height: 40.h,
                                      width: 100.w,
                                      background: item.isSelected ?AppColors.colorpurple: Colors.white,
                                      text: item.title,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      textColor: item.isSelected ? Colors.white :AppColors.colorpurple,
                                      radius: 4,
                                      marginLeft: 10,
                                      borderWidth: 1,
                                      isUpperCase: false,
                                      borderColor: item.isSelected ?Colors.black87 :AppColors.colorpurple,
                                      click: (){
                                        for(Members memberas in _controller.listGenderType) {
                                          memberas.isSelected = false;
                                        }
                                        item.isSelected = true;
                                        controller.selectedGender = item.value;
                                        _controller.getMemebers();
                                        controller.update();
                                      })
                                  ).toList(),
                                ),
                              )
                      )
                  )
                      : Container()),
                 GetBuilder<MembersController>(builder: (controller) => Column(
                   children: [
                     Container(
                         margin: EdgeInsetsDirectional.only(top: 14.r, start: 16.r),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             AppText.medium(
                                 text: 'members_online_now'.tr,
                                 fontWeight: FontWeight.w600,
                                 fontSize: 16.h),
                             SizedBox(
                               width: 3.w,
                             ),
                             AppText.medium(
                                 text: '(${_controller.listMembers.length})'.tr,
                                 fontWeight: FontWeight.w600,
                                 fontSize: 16.h),
                           ],
                         )),
                     ListView.builder(
                         physics: const NeverScrollableScrollPhysics(),
                         shrinkWrap: true,
                         itemCount: _controller.listMembers.length,
                         itemBuilder: (_, index) => buildMemeberItem(_controller.listMembers[index]))
                   ],
                 ))
                ],
              ),
            );
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return AppWidgets.CustomAnimationProgress();
          }else {
            return Container();
          }
        },
      ),
    );
  }

  Widget buildMemeberItem(MemeberData memeber) => GestureDetector(
    child: Container(
      margin: EdgeInsetsDirectional.only(top: 16.r,end: 16.r,start: 16.r),
      width:double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.lightGray6
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(start: 15.r, top: 10.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleCachedImage(imageUrl: memeber.customerAllowPhoto!.isNotEmpty ? memeber.customerAllowPhoto![0].imageUrl! : Const.defaultUserImage),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 15.r, top: 10.r),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                            text: memeber.fullName!,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color:AppColors.lightGray15),
                      ],
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
                              text: memeber.age!,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color:AppColors.lightGray15),
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
                              text: 'residence',
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          SizedBox(
                            width: 4.w,
                          ),
                          AppText.medium(
                              text: memeber.country!.name!,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color:AppColors.lightGray15
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),



        ],
      ),
    ),
    onTap: () => Get.to(ProfileMemeberScreen(userId: memeber.id)),
  );
}
