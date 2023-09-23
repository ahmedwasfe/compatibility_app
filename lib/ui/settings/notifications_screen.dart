


import 'package:compatibility_app/controller/notifications_controller.dart';
import 'package:compatibility_app/model/notifications/notifications_type.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
//اجهة الاشعارات
class NotificationsScreen extends StatelessWidget {
NotificationsController controller=Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.medium(
            text: 'notfiactions',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          GetBuilder<NotificationsController>(
              builder: (controller) => Container(
                width: 200,
                height: 58.h,
                padding: EdgeInsetsDirectional.only(start: 14,end: 14,top: 8.r),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: Obx(() => AppText.medium(
                      text: controller.selectedNotificationsType.value.isNotEmpty
                          ? controller.selectedNotificationsType.value.tr
                          : 'all'.tr,
                      fontSize: 12.h,
                      fontWeight: FontWeight.w400,
                      color: AppColors.lightGray18,
                    )),
                    items: controller.listNotificationsType
                        .map((item) =>
                        DropdownMenuItem<NotificationsType>(
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
                      controller.selectedNotificationsType.value = value!.title;
                      controller.selectedNotificationsType = value.isSelected as RxString;
                      print('TYPE: ${controller.selectedNotificationsType}');
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsetsDirectional.only(top: 14.r, start: 16.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText.medium(
                        text: 'latest_notifications'.tr,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.h),
                    SizedBox(
                      width: 3.w,
                    ),
                    AppText.medium(
                        text: '(12)'.tr,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.h),
                  ],
                )),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return  ListINotifications();
                },
                itemCount: 20)
          ],
        ),
      ),

    );
  }

  Widget ListINotifications() {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 15.r, end: 15.r, top: 14.r),
      width: double.infinity,
      height: 130.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.lightGray21,
      ),
      child: Row(
        children: [
          Container(
            margin:
            EdgeInsetsDirectional.only(end: 2.r, top: 10.r, start: 2.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35.r,
                  backgroundImage: AssetImage('${Const.images}profial.jpg'),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText.medium(
                        text: 'member_rose',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    SizedBox(
                      width: 4.w,
                    ),
                    AppText.medium(
                        text: 'خليل عماد هتهت',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.colorpurple),
                    SizedBox(width: 4.w,),
                    AppText.medium(
                        text: 'visiting',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    SizedBox(width: 4.w,),
                    IconButton(onPressed: (){
                      // AppHelper.showDeleteNotifiactions(context);
                    }, icon: Icon(Icons.delete,color: AppColors.grayColorBg,))
                  ],
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 0.r),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText.medium(
                          text: 'personal_file',
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){}, icon:SvgPicture.asset('${Const.icons}clock.svg')),
                    AppText.medium(
                        text: 'days_ago',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),

                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
