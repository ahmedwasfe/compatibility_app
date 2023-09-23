import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:compatibility_app/controller/members_controller.dart';
import 'package:compatibility_app/model/home/members.dart';
import 'package:compatibility_app/model/home/members_filtered.dart';
import 'package:compatibility_app/routes/routes.dart';
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
          GetBuilder<MembersController>(
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
                        DropdownMenuItem<MembersFiltered>(
                          value: item,
                          child:Row(
                            children: [
                              Checkbox(
                                // checkColor: AppColors.colorpurple,
                                  splashRadius: 18,
                                  value: controller.isChecked, onChanged: (bool? value) {}
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
                              SizedBox(width: 5.w
                                ,),
                              AppText.medium(text: item.title,fontSize: 12.h
                              ),

                            ],
                          ),
                        ))
                        .toList(),
                    onChanged: (value) {
                      controller.selectedMembersFiltered.value = value!.title;
                      controller.selectedMembersFiltered = value.isSelected as RxString;
                      print('TYPE: ${controller.selectedMembersFiltered}');
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
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 3,
        initialIndex: _controller.tabIndex,
        child: SingleChildScrollView(
          child: Column(
            children: [








              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: GetBuilder<MembersController>(
                  builder: (controller)=>
                      Container(
                        alignment: AlignmentDirectional.topEnd,
                        margin: EdgeInsetsDirectional.only(top: 30.r,end: 50.r),
                        child: Row(
                          children: _controller.listmembers.map((item) => AppWidgets.CustomButton(
                              height: 50,
                              width: 100,
                              background: item.isSelected ?AppColors.colorpurple: Colors.white,
                              text: item.title,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              textColor: item.isSelected ?Colors.white :AppColors.colorpurple,
                              radius: 4,
                              marginLeft: 10,
                              borderWidth: 1,
                              borderColor: item.isSelected ?Colors.black87 :AppColors.colorpurple,
                              click: (){
                                for(Members memberas in _controller.listmembers) {
                                  memberas.isSelected = false;
                                }

                                item.isSelected = true;
                                controller.update();
                              })
                          ).toList(),
                        ),
                      )
                )
              ),

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
                          text: '(231)'.tr,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.h),
                    ],
                  )),

              // Expanded(
              //   child: ListView.separated(
              //       physics: BouncingScrollPhysics(),
              //       shrinkWrap: true,
              //       itemBuilder: (context, index) {
              //         return ListMembers();
              //       },
              //       separatorBuilder: (context, index) {
              //         return SizedBox(
              //           height: 1.h,
              //         );
              //       },
              //       itemCount: 20),
              // )
          Container(
            margin: EdgeInsetsDirectional.only(top: 30.r,end: 16.r,start: 16.r,bottom: 20.r),
            width:double.infinity,
            height: 130.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
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
                          CircleAvatar(
                            radius:45,
                            backgroundImage: AssetImage('${Const.images}profial.jpg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(start: 15.r, top: 10.r),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                  text: 'خليل عماد هتهت',
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
                                    text: '12',
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
                                    text: 'الامارات العربيه',
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
            ],
          ),
        ),
      ),
    );
  }
  Widget ListMembers(){
    return    Container(
      margin: EdgeInsetsDirectional.only(top: 16.r,end: 16.r,start: 16.r,bottom: 20.r),
      width:double.infinity,
      height: 130.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
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
                    CircleAvatar(
                      radius:45,
                      backgroundImage: AssetImage('${Const.images}profial.jpg',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 15.r, top: 10.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                            text: 'خليل عماد هتهت',
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
                              text: '12',
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
                              text: 'registration_period',
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          SizedBox(
                            width: 4.w,
                          ),
                          AppText.medium(
                              text: 'منذ 1254يوم ',
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
    );
  }
}
