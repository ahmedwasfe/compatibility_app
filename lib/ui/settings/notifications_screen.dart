import 'dart:developer';

import 'package:compatibility_app/controller/notifications_controller.dart';
import 'package:compatibility_app/model/notifications/notifications.dart';
import 'package:compatibility_app/model/filter_type.dart';
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
import 'package:get/get_utils/get_utils.dart';

//اجهة الاشعارات
class NotificationsScreen extends StatelessWidget {
  NotificationsController controller = Get.put(NotificationsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: AppText.medium(
            text: 'notfiactions',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          GetBuilder<NotificationsController>(
              builder: (controller) => Container(
                    width: 180,
                    height: 58.h,
                    padding: EdgeInsetsDirectional.only(
                        start: 14, end: 14, top: 8.r),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Obx(() => AppText.medium(
                              text: controller.selectedNotificationsType.value
                                      .isNotEmpty
                                  ? controller
                                      .selectedNotificationsType.value.tr
                                  : 'all'.tr,
                              fontSize: 12.h,
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightGray18,
                            )),
                        items: controller.listNotificationsType
                            .map((item) => DropdownMenuItem<FilterType>(
                                  value: item,
                                  child: Row(
                                    children: [
                                      AppText.medium(
                                          text: item.title.tr, fontSize: 12.h),
                                    ],
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          controller.selectedNotificationsType.value = value!.title;
                          controller.selectedNotificationsValue = value.value;
                          print(
                              'TYPE: ${controller.selectedNotificationsType}');

                          controller.getNotifications(type: controller.selectedNotificationsValue);

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
                        buttonHeight: 100.h,
                        buttonWidth: 180.w,
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
                  )),
        ],
      ),
      body: FutureBuilder(
        future: controller.getNotifications(type: Const.KEY_NOTIF_ALL),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: GetBuilder<NotificationsController>(
                  builder: (controller) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsetsDirectional.only(
                                  top: 14.r, start: 16.r),
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
                                      text:
                                          '(${controller.listNotificaions.length})'
                                              .tr,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.h),
                                ],
                              )),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.listNotificaions.length,
                              itemBuilder: (context, index) => notificationItem(
                                  controller.listNotificaions[index]))
                        ],
                      )),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return AppWidgets.CustomAnimationProgress();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget notificationItem(NotificationData notificaion) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 15.r, end: 15.r, top: 14.r),
      // width: double.infinity,
      height: 110.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.lightGray21,
      ),
      child: Container(
        margin: EdgeInsetsDirectional.only(start: 14.r, top: 14.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
                  EdgeInsetsDirectional.only(end: 2.r, top: 10.r, start: 2.r),
              child: CircleCachedImage(
                  imageUrl: notificaion.notificationImageUrl!, radius: 32),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsetsDirectional.only(start: 15.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(
                        text: notificaion.notificationText!,
                        fontSize: 14,
                        maxline: 2,
                        fontWeight: FontWeight.w400,
                        color: AppColors.colorpurple),
                    Row(
                      children: [
                        SvgPicture.asset('${Const.icons}clock.svg'),
                        SizedBox(width: 4.w),
                        AppText.medium(
                            text: notificaion.time!,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  log('IconButton: ${notificaion.id}');
                  controller.deleteNotifications(
                      notificationId: notificaion.id!);
                },
                icon: const Icon(Icons.delete_outline_rounded))
          ],
        ),
      ),
    );
  }
}
