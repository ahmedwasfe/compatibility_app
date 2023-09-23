import 'package:compatibility_app/controller/settings_controller.dart';
import 'package:compatibility_app/model/settings/country.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
//شاشة قصص نجاح
class SuccessStoriesScreen extends StatelessWidget {
  const SuccessStoriesScreen({Key? key}) : super(key: key);

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
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          GetBuilder<SettingsController>(
              builder: (controller) => Container(
                width: 200.w
                ,
                height: 58.h,
                padding: EdgeInsetsDirectional.only(start: 14,end: 14,top: 8.r),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Obx(() => AppText.medium(
                      text: controller.selectedlistCountryType.value.isNotEmpty
                          ? controller.selectedlistCountryType.value.tr
                          : 'select_country'.tr,
                      fontSize: 12.h,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGray18,
                    )),
                    items: controller.listCountryType
                        .map((item) =>
                        DropdownMenuItem<Country>(
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
                      controller.selectedlistCountryType.value = value!.title;
                      controller.selectedlistCountryType = value.isSelected as RxString;
                      print('TYPE: ${controller.selectedlistCountryType}');
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
                    dropdownWidth: 250,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


  Container(
    margin: EdgeInsetsDirectional.only(top: 50.r),
    alignment: AlignmentDirectional.center,
    child: SvgPicture.asset('${Const.images}sing_up.svg',fit: BoxFit.cover,
    width: double.infinity,
    height: 206.h
      ,),
  ),

  Container(
    margin: EdgeInsetsDirectional.only(top: 20.r),
    child:Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText.larg(text: 'success_story'.tr,fontSize: 17.h),
        SizedBox(width: 3.w,),
        AppText.larg(text: '325148',fontSize: 17.h),
      ],
    ),
  ),
  Container(
    margin: EdgeInsetsDirectional.only(top: 12.r,start: 15.r,end: 15.r),
    alignment: AlignmentDirectional.center,
    child: AppText.larg(text: 'god_together_goodness',color: Colors.black,fontSize: 17.h),
  ),
            Container(
    margin: EdgeInsetsDirectional.only(top: 12.r,bottom: 20.r),
    alignment: AlignmentDirectional.center,
    child: AppText.larg(text: 'congratu_finding_half',color: Colors.black,fontSize: 14.h),
  ),
            ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListSuccess();
                },
                itemCount: 20)
          ],
        ),
      ),
    );
  }
  Widget ListSuccess(){
    return Container(
      margin: EdgeInsetsDirectional.only(top: 5.r,end: 16.r,start: 16.r,bottom: 20.r),
      width:double.infinity,
      height: 170.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          color: AppColors.lightGray6
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(start: 5.r, top: 10.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius:35,
                      backgroundImage: AssetImage('${Const.images}profial.jpg',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 10.r, top: 10.r),
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
                              text: ' منذ 1500',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color:AppColors.lightGray15
                          ),
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
                            text: 'message'.tr
                            ,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(width: 4.w,),
                          AppText.medium(
                              text: 'شكرا توافق وجدت الشخص المناسب\n بحمد الله بعد تسجيلي ب 1254 يوم',
                              fontSize: 12.h,
                              fontWeight: FontWeight.w600,
                              color:AppColors.lightplue),
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
