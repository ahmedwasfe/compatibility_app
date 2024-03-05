import 'dart:developer';
import 'dart:io';

import 'package:compatibility_app/api/api_requestes.dart';
import 'package:compatibility_app/controller/home_controller.dart';
import 'package:compatibility_app/model/language.dart';
import 'package:compatibility_app/model/settings/app_settings.dart';
import 'package:compatibility_app/model/settings/country.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:compatibility_app/utils/preferences_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:custom_check_box/custom_check_box.dart';

class SettingsController extends GetxController {
  RxString selectedlistCountryType = ''.obs;

  bool isChecked = false;

  AboutUs about = AboutUs();
  Policy policy = Policy();
  Setting setting = Setting();

  RxBool isLoading = false.obs;

//فلترت الاعضاء
  List<Country> listCountryType = [
    Country(isSelected: false, title: 'مصر'),
    Country(isSelected: false, title: 'مصر'),
    Country(isSelected: false, title: 'مصر'),
    Country(isSelected: false, title: 'مصر'),
    Country(isSelected: false, title: 'مصر'),
    Country(isSelected: false, title: 'مصر'),
  ];

  late GlobalKey<FormState> formKey;
  late TextEditingController cardController;
  late TextEditingController fullNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController textNameController;
  late TextEditingController problemController;
  late TextEditingController conectController;
  late TextEditingController cause_problemController;

  late TextEditingController subjectController;
  late TextEditingController messageProblemController;

  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController messageController;

  @override
  void onInit() {
    formKey = GlobalKey();
    cardController = TextEditingController();
    fullNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    textNameController = TextEditingController();
    problemController = TextEditingController();
    conectController = TextEditingController();
    cause_problemController = TextEditingController();

    subjectController = TextEditingController();
    messageProblemController = TextEditingController();

    nameController = TextEditingController();
    mobileController = TextEditingController();
    messageController = TextEditingController();


    super.onInit();
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    cardController.dispose();
    fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    textNameController.dispose();
    problemController.dispose();
    conectController.dispose();
    cause_problemController.dispose();

    subjectController.dispose();
    messageProblemController.dispose();

    nameController.dispose();
    mobileController.dispose();
    messageController.dispose();

    super.dispose();
  }

  Future<void> getAppSettings() async {
    print("App Settings");
    await ApiRequestes.getSettings(appLanguage: AppHelper.getAppLanguage())
        .then((value) {
      if (value != null) {
        about = value.result!.aboutUs!;
        policy = value.result!.policy!;
        setting = value.result!.setting!;
      }
    });
  }

  void showAccountBottomSheet(BuildContext context, {required String title, required String message, required String type}) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (_) => Container(
          height: 200.h,
          margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, bottom: 2.r),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(20.r)
          ),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsetsDirectional.only(top: 16.r),
                  child: AppText.medium(text: title, color: Colors.black)),
              Container(
                  margin: EdgeInsetsDirectional.only(top: 10.r),
                  child: AppText.medium(text: message,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color:Colors.black)),
              Container(
                margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 25.r),
                child: Row(
                  children: [
                    Expanded(
                      child: AppWidgets.CustomButton(
                          text: 'cancel'.tr,
                          width: 120.w,
                          height: 48.h,
                          isUpperCase: false,
                          background: AppColors.lightGray2,
                          borderColor: AppColors.lightGray2,
                          textColor: Colors.black,
                          fontWeight: FontWeight.w400,
                          radius: 40.r,
                          click: () => Navigator.pop(context)),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: AppWidgets.CustomButton(
                          text: type == Const.KEY_SHEET_LOGOUT ? 'logout' : 'delete',
                          width: 120.w,
                          height: 48.h,
                          isUpperCase: false,
                          background: AppColors.colorpurple,
                          borderColor: AppColors.colorpurple,
                          textColor: Colors.white,
                          fontWeight: FontWeight.w400,
                          radius: 40.r,
                          click: () {
                            if(type == Const.KEY_SHEET_LOGOUT) {
                              logout();
                            } else {
                              deleteAccount();
                            }
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  static void showShareDialog(BuildContext context) {
    SettingsController controller=Get.put(SettingsController());
    showDialog(
        context: context,
        builder: (con) => AlertDialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            width: double.infinity,
            height: 280.h,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
            ),
            child: FutureBuilder(
              future: controller.getAppSettings(),
              builder: (_, snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(start: 10.r,end: 10.r
                            ,top: 20.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText.medium(text: 'share_app'),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                child:SvgPicture.asset('${Const.icons}icon_delete.svg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(start: 30.r,end: 30.r,top: 20.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => launchUrl(
                                  Uri.parse('${controller.setting.email}')),
                              child: Column(
                                children: [
                                  SvgPicture.asset('${Const.icons}icon_email.svg'),
                                  Container(
                                      margin: EdgeInsetsDirectional.only(top: 5.r),
                                      child: AppText.medium(text: 'email',fontSize: 10)),
                                ],
                              ),
                            ),


                            InkWell(
                              onTap: () => launchUrl(
                                  Uri.parse('${controller.setting.whatsapp}')),
                              child: Column(
                                children: [
                                  SvgPicture.asset('${Const.icons}icon_whates.svg'),
                                  Container(
                                      margin: EdgeInsetsDirectional.only(top: 5.r),
                                      child: AppText.medium(text: 'whates',fontSize: 10)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),


                      Container(
                        margin: EdgeInsetsDirectional.only(start: 45.r,end: 45.r,top: 10.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => launchUrl(
                                  Uri.parse('${controller.setting.facebook}')),
                              child: Column(
                                children: [
                                  SvgPicture.asset('${Const.icons}icon_fecebook.svg'),
                                  Container(
                                      margin: EdgeInsetsDirectional.only(top: 5.r),
                                      child: AppText.medium(text: 'fecebook',fontSize: 10)),
                                ],
                              ),
                            ),
                            SizedBox(width: 50.w,),

                            InkWell(
                              onTap: () => launchUrl(
                                  Uri.parse('${controller.setting.email}')),
                              child: Column(
                                children: [
                                  SvgPicture.asset('${Const.icons}icon_repaild.svg'),
                                  Container(
                                      margin: EdgeInsetsDirectional.only(top: 5.r),
                                      child: AppText.medium(text: 'replied',fontSize: 10)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(start: 45.r,end: 45.r,top: 10.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => launchUrl(
                                  Uri.parse('${controller.setting.twitter}')),
                              child: Column(
                                children: [
                                  SvgPicture.asset('${Const.icons}icon_twiter.svg'),
                                  Container(
                                      margin: EdgeInsetsDirectional.only(top: 5.r),
                                      child: AppText.medium(text: 'twiter',fontSize: 10)),
                                ],
                              ),
                            ),
                            SizedBox(width: 50.w,),

                            InkWell(
                              onTap: () => launchUrl(
                                  Uri.parse('${controller.setting.email}')),
                              child: Column(
                                children: [
                                  SvgPicture.asset('${Const.icons}icon_away.svg'),
                                  Container(
                                      margin: EdgeInsetsDirectional.only(top: 5.r),
                                      child: AppText.medium(text: 'away',fontSize: 10)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }else if(snapshot.connectionState == ConnectionState.waiting){
                  return AppWidgets.CustomAnimationProgress();
                }else {
                  return Container();
                }
              },
            ),
          ),
        ));
  }

  void problem(){
    isLoading(true);
    ApiRequestes.saveProblem(subject: subjectController.text, message:messageProblemController.text)
        .then((value)  {
      if (value != null) {
        AppHelper.showToast(
            message: 'solved'.tr,
            color: Colors.green,
            gravity: ToastGravity.BOTTOM);
        isLoading(false);
        Get.toNamed(Routes.home);
      }
    }).catchError((error) {
      print('catchError: $error');
      isLoading(false);

    });
  }

  void contactus(){
    isLoading(true);
    ApiRequestes.contactUs(name: nameController.text, email: emailController.text, mobile: mobileController.text, message: messageController.text)
        .then((value)  {
      if (value != null) {
        AppHelper.showToast(
            message: 'thank_you_for_contacting_us'.tr,
            color: Colors.green,
            gravity: ToastGravity.BOTTOM);
        isLoading(false);
        Get.toNamed(Routes.home);
      }
    }).catchError((error) {
      print('catchError: $error');
      isLoading(false);

    });
  }

  void deleteAccount() {
    ApiRequestes.deleteAccount(userId: AppHelper.getCurrentUser()!.id!)
        .then((value) {
          if(value != null){

            PreferencesManager.clearData(
                key: Const.KEY_USER_DATA);
            PreferencesManager.clearData(
                key: Const.KEY_USER_TOKEN);
            PreferencesManager.clearData(
                key: Const.KEY_USER_TYPE);
            Get.toNamed(Routes.login);
          }
    });
    HomeController controller = Get.find();
    controller.getCurrenNavIndex(navIndex: 0);
  }

  void logout() {
    ApiRequestes.logout()
        .then((value) {
      if(value != null){

        PreferencesManager.clearData(
            key: Const.KEY_USER_DATA);
        PreferencesManager.clearData(
            key: Const.KEY_USER_TOKEN);
        PreferencesManager.clearData(
            key: Const.KEY_USER_TYPE);
        Get.toNamed(Routes.login);

      }
    });
    HomeController controller = Get.find();
    controller.getCurrenNavIndex(navIndex: 0);
  }

}
