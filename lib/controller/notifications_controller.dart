

import 'dart:ffi';
import 'dart:io';

import 'package:compatibility_app/api/api_requestes.dart';
import 'package:compatibility_app/model/home/members.dart';
import 'package:compatibility_app/model/notifications/notifications.dart';
import 'package:compatibility_app/model/filter_type.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../model/home/members_filtered.dart';

class NotificationsController extends GetxController{

//فلترت الاعضاء
  RxString selectedNotificationsType = ''.obs;
  String selectedNotificationsValue = '';

  bool isChecked = false;

  List<NotificationData> listNotificaions = [];


//فلترت الاعضاء
  /*
  * نوع الاشعارات [all,hide_image,general_notification,add_to_ignore,delete_to_ignore,interest,show_profile]
  * */
  List<FilterType> listNotificationsType = [
    FilterType(title: 'all', value: Const.KEY_NOTIF_ALL),
    FilterType(title: 'management', value: Const.KEY_NOTIF_General_Notification),
    FilterType(title: 'cares_about', value: Const.KEY_NOTIF_Interest),
    FilterType(title: 'ignore', value: Const.KEY_NOTIF_Add_To_Ignore),
    FilterType(title: 'deleted_ignore_list', value: Const.KEY_NOTIF_Delete_To_Ignore),
    FilterType(title: 'deleted_ignore_list', value: Const.KEY_NOTIF_Delete_To_Ignore),
    FilterType(title: 'who_gave_permission_view_photo', value: Const.KEY_NOTIF_Show_Profile),
  ];

  Future<void> getNotifications({required String type}) async {
    await ApiRequestes.getNotifications(type: type)
        .then((value) {
          if(value != null){
            listNotificaions.clear();
            listNotificaions.addAll(value.result!.notification!);
            update();
          }
    });

    update();
  }


  Future<void> deleteNotifications({required String notificationId})async {
    await ApiRequestes.deleteNotifications(notificationId: notificationId)
        .then((value) {
      if (value != null) {
        if(value != null){
          getNotifications(type: Const.KEY_NOTIF_ALL);
          AppHelper.showToast(message: 'active_notifications_been_deleted_dear'.tr, color:AppColors.colorpurple);
          update();
        }
      }
    }).catchError((error) => print('catchError: $error'));
    update();
  }


  static void showDeleteNotifiactions(BuildContext context){
    showDialog(context: context, builder: (con) => AlertDialog(
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: InkWell(
        onTap: ()=> Get.toNamed(Routes.notifications),
        child: Container(
          width: 350.w,
          height: 270.h,
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsetsDirectional.only(top: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
          ),
          child: Column(
            children: [
              InkWell(
                onTap: ()=> Get.toNamed(Routes.home),
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 20.h),
                  alignment: AlignmentDirectional.center,
                  child: SvgPicture.asset('${Const.images}delete_notifictions.svg',height: 100.h,width: 100.w
                    ,),
                ),
              ),

              Container(
                alignment: AlignmentDirectional.center,
                margin: EdgeInsetsDirectional.only(start: 0.r, end: 0.r),
                child: AppText.medium(text:
                'delete_not'.tr,
                  color: AppColors.lightgray,
                  fontSize: Platform.isAndroid ? 16.sp : 14.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(

                alignment: AlignmentDirectional.center,
                margin: EdgeInsetsDirectional.only(start: 0.r, top: 10.r),
                child: AppText.medium(text:
                'delete_all_notifications'.tr,
                  color: AppColors.lightgray,
                  fontSize: Platform.isAndroid ? 12.sp : 12.sp,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    AppWidgets.CustomButton(text: 'no'.tr, background: Colors.white,
                        width:100.w ,
                        height: 40.h,
                        radius: 8.r,
                        textColor: AppColors.colorpurple,
                        fontSize: 16.h,
                        fontWeight: FontWeight.w400,
                        click: (){

                          Get.toNamed(Routes.login);

                        }),
                    AppWidgets.CustomButton(text: 'yes'.tr, background: Colors.white,
                        width:100.w ,
                        height: 40.h,
                        radius: 8.r,
                        textColor: AppColors.colorpurple,
                        fontSize: 16.h,
                        fontWeight: FontWeight.w400,
                        click: (){

                          // Navigator.pop(context);
                          Get.toNamed(Routes.login);
                        }),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    ));
  }

}

