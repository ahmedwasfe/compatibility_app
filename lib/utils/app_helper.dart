import 'dart:io';
import 'dart:math';
import 'package:compatibility_app/controller/language_controller.dart';
import 'package:compatibility_app/model/user.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'preferences_manager.dart';

class AppHelper {

  static String? getCurrentUserToken() {
    if (PreferencesManager.getUserToken(key: Const.KEY_USER_TOKEN) != null) {
      return 'Bearer ${PreferencesManager.getUserToken(key: Const.KEY_USER_TOKEN)}';
    } else {
      return null;
    }
  }

  static User? getCurrentUser() {
    if (PreferencesManager.getUserData(key: Const.KEY_USER_DATA) != null) {
      return PreferencesManager.getUserData(key: Const.KEY_USER_DATA);
    } else {
      return null;
    }
  }

  static String getAppLanguage() {
    if (PreferencesManager.getAppData(key: Const.KEY_LANGUAGE) != null &&
        PreferencesManager.getAppData(key: Const.KEY_LANGUAGE) != "") {
      String language = PreferencesManager.getAppData(key: Const.KEY_LANGUAGE);
      if (language == Const.KEY_LANGUAGE_AR) {
        return Const.KEY_LANGUAGE_AR;
      }else if(language == Const.KEY_LANGUAGE_EN){
        return Const.KEY_LANGUAGE_EN;
      }
    }

    return Get.deviceLocale!.languageCode;
  }

  static String getLangName() {
    if(getAppLanguage() == Const.KEY_LANGUAGE_AR){
      return 'arabic'.tr;
    }else if(getAppLanguage() == Const.KEY_LANGUAGE_EN){
      return 'english'.tr;
    }
      return 'arabic'.tr;
    }


  static Locale? getAppLocale() {
    // print('DEVICE LANG: ${Get.deviceLocale!.languageCode}');
    print('DEVICE LANG: ${PreferencesManager.getAppLanguage(key: Const.KEY_LANGUAGE)}');
    String? language = PreferencesManager.getAppLanguage(key: Const.KEY_LANGUAGE);
    if (language == Const.KEY_LANGUAGE_AR) {
      return const Locale(Const.KEY_LANGUAGE_AR);
    } else if (language == Const.KEY_LANGUAGE_EN) {
      return const Locale(Const.KEY_LANGUAGE_EN);
    }
      return Locale(Get.deviceLocale!.languageCode);

  }

  static double getDialogLanguageSize() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 550 ? /* TODO PHONE */ 210 : /* TODO TABLET */ 280;
  }

  static String getDateTody(){
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateToday = '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
    return dateToday;
    // 2022-11-13
  }

  static Future saveDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      PreferencesManager.saveAppData(
          key: Const.KEY_DEVICE_NAME, value: androidInfo.model);
      print('Running on Android ${androidInfo.model}'); // e.g. "Moto G (4)"
      print('Running on Android ${androidInfo.device}'); // e.g. "Moto G (4)"
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      PreferencesManager.saveAppData(
          key: Const.KEY_DEVICE_NAME, value: iosInfo.utsname.machine);
      print('Running on IOS ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
      print('Running on IOS ${iosInfo.utsname.sysname}'); // e.g. "iPod7,1"
    }
  }

  static String getDeviceName() {
    if (PreferencesManager.getAppData(key: Const.KEY_DEVICE_NAME) != null) {
      return PreferencesManager.getAppData(key: Const.KEY_DEVICE_NAME);
    } else {
      return '';
    }
  }
  static TextAlignVertical getTextAlignVertical(){
    return getAppLanguage() == 'en' ? TextAlignVertical.bottom : TextAlignVertical.bottom;
  }

  static void showToast({required String message, Color color = Colors.black, ToastGravity gravity = ToastGravity.BOTTOM}){
    Fluttertoast.showToast(
        msg: message.tr,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static RegExp emailValidate() {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  }


  static String? validateFullName({required String name}){
    if (name.isEmpty) {
      return 'enter_full_name'.tr;
    } else {
      return null;
    }
  }


  static bool validate({required String value}) {
    if (GetUtils.isBlank(value)!) {
      return false;
    } else {
      return true;
    }
  }

  static String? validateUserName({required String name}) {
    if (name.isEmpty) {
      return 'enter_username'.tr;
    } else {
      return null;
    }
  }


  static String? validateIdCard({required String idCard}) {
    if (idCard.isEmpty) {
      return 'enter_id_card'.tr;
    } else if(idCard.length != 9) {
      return 'id_card_must_be_9_number'.tr;
    }else {
      return null;
    }
  }

  static String? validatePhone({required String phone}) {
    if (phone.isEmpty) {
      return 'enter_phone'.tr;
    } else {
      return null;
    }
  }

  static String? validateAddress({required String address}) {
    if (address.isEmpty) {
      return 'enter_address'.tr;
    } else {
      return null;
    }
  }

  static String? validatePassword({required String password}) {
    if (GetUtils.isBlank(password)!) {
      return 'enter_password'.tr;
    } else if (password.length < 6) {
      return 'validate_password'.tr;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(
      {required String password, required String conformPassword}) {
    if (GetUtils.isBlank(conformPassword)!) {
      return 'enter_confirm_password'.tr;
    } else if (conformPassword.length < 6) {
      return 'validate_password'.tr;
    } else if (password != conformPassword) {
      return 'passwords_not_match'.tr;
    }
    return null;
  }

  static String? validateEmail({required email}) {
    if (GetUtils.isBlank(email)!) {
      return 'enter_email'.tr;
    } else if (!AppHelper.emailValidate().hasMatch(email)) {
      return 'enter_valid_email'.tr;
    } else {
      return null;
    }
  }

  static String formatImage(String pathImage) {
    if(pathImage.contains('\\')) {
      return pathImage.replaceAll('\\', '/');
    } else {
      return pathImage;
    }
  }

  static String? detialsName({required String name}) {
    if (name.isEmpty) {
      return 'enter_username'.tr;
    } else {
      return null;
    }
  }


  static String? Self({required String self}) {
    if (self.isEmpty) {
      return 'enter_self'.tr;
    } else {
      return null;
    }
  }


  static String? UserName({required String name}) {
    if (name.isEmpty) {
      return 'enter_self'.tr;
    } else {
      return null;
    }
  }



  static String? Phone({required String phone}) {
    if (phone.isEmpty) {
      return 'enter_self'.tr;
    } else {
      return null;
    }
  }




  static String? Email({required String email}) {
    if (email.isEmpty) {
      return 'enter_self'.tr;
    } else {
      return null;
    }
  }

//سجيل الدخول بنجاح
  static void showLoginSuccess(BuildContext context){
    showDialog(context: context, builder: (con) => AlertDialog(
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: InkWell(
        onTap: ()=> Get.toNamed(Routes.home),
        child: Container(
          width: 309.w,
          height: 100.h,
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
        alignment: AlignmentDirectional.center,
        child: SvgPicture.asset('${Const.icons}icons_check.svg',height: 50,width: 50,),
    ),
  ),

  InkWell(
    onTap: ()=> Get.toNamed(Routes.home),
    child: Container(
        margin: EdgeInsetsDirectional.only(top: 10.r),
        alignment: AlignmentDirectional.center,
        child: AppText.medium(text: 'successfully',color: AppColors.colorgreenl,fontWeight: FontWeight.w500,
        fontSize: 12.h),
    ),
  ),
],
          ),
        ),
      ),
    ));
  }

  //حذف الاشعار
  static void showDeleteNotifiactions(BuildContext context){
    showDialog(context: context, builder: (con) => AlertDialog(
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: InkWell(
        onTap: ()=> Get.toNamed(Routes.home),
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

  //كود الخصم
  static void showDiscountCode(BuildContext context){
    showDialog(context: context, builder: (con) => AlertDialog(
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: InkWell(
        onTap: ()=> Get.toNamed(Routes.home),
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
                  child: SvgPicture.asset('${Const.images}discount_code.svg',height: 100.h,width: 100.w
                    ,),
                ),
              ),

              Container(
                alignment: AlignmentDirectional.center,
                margin: EdgeInsetsDirectional.only(start: 0.r, end: 0.r),
                child: AppText.medium(text:
                'receive'.tr,
                  color: AppColors.lightgray,
                  fontSize: Platform.isAndroid ? 16.sp : 14.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    AppWidgets.CustomButton(text: 'sing_up'.tr, background: Colors.white,
                        width:100.w ,
                        height: 40.h,
                        radius: 8.r,
                        textColor: AppColors.colorpurple,
                        fontSize: 16.h,
                        fontWeight: FontWeight.w400,
                        click: (){

                          Get.toNamed(Routes.login);

                        }),
                    AppWidgets.CustomButton(text: 'colse'.tr, background: Colors.white,
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

  //تم تفعيل معلومات الملف الشخصي بنجاح
  static void showProfialSuccess(BuildContext context){
    showDialog(context: context, builder: (con) => AlertDialog(
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: InkWell(
        onTap: ()=> Get.toNamed(Routes.home),
        child: Container(
          width: 309.w,
          height: 100.h,
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
                  alignment: AlignmentDirectional.center,
                  child: SvgPicture.asset('${Const.icons}icons_check.svg',height: 50,width: 50,),
                ),
              ),

              InkWell(
                onTap: ()=> Get.toNamed(Routes.home),
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 10.r),
                  alignment: AlignmentDirectional.center,
                  child: AppText.medium(text: 'profile_information_update',color: AppColors.colorgreenl,fontWeight: FontWeight.w500,
                  fontSize: 12.h),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  //تم حذف جميع الاشعارات بنجاح
  static void showDeleteNotifiactionsSuccess(BuildContext context){
    showDialog(context: context, builder: (con) => AlertDialog(
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: InkWell(
        onTap: ()=> Get.toNamed(Routes.home),
        child: Container(
          width: 309.w,
          height: 100.h,
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
                  alignment: AlignmentDirectional.center,
                  child: SvgPicture.asset('${Const.icons}icons_check.svg',height: 50,width: 50,),
                ),
              ),

              InkWell(
                onTap: ()=> Get.toNamed(Routes.home),
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 10.r),
                  alignment: AlignmentDirectional.center,
                  child: AppText.medium(text: 'profile_information_update',color: AppColors.colorgreenl,fontWeight: FontWeight.w500,
                      fontSize: 12.h),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

//اللغه
  static void showLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (con) => AlertDialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            width: 314.w,
            height: 320.h,
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsetsDirectional.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(

                    margin: EdgeInsetsDirectional.only(end: 10.r,top: 10.r),
                    alignment: AlignmentDirectional.topEnd,
                    child: const Icon(Icons.delete_forever,color: AppColors.lightgray16,),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 0.r, bottom: 0),
                    height: 150.h,
                    width: 230.w,
                    child: SvgPicture.asset('${Const.images}image_di.svg', fit: BoxFit.scaleDown)),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
                  child: AppText.medium(text:
                  'le'.tr,
                    color: AppColors.lightgray,
                    fontSize: Platform.isAndroid ? 16.sp : 14.sp,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    AppWidgets.CustomButton(text: 'arabic'.tr, background: Colors.white,
                        width:100.w ,
                        height: 48.h,
                        radius: 8.r,
                        textColor: AppColors.colorpurple,
                        fontSize: 16.h,
                        fontWeight: FontWeight.w400,
                        click: (){

                          Get.toNamed(Routes.login);

                        }),
                    AppWidgets.CustomButton(text: 'english'.tr, background: Colors.white,
                        width:100.w ,
                        height: 48.h,
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
                SizedBox(height: 15.h,)
              ],
            ),
          ),
        ));
  }
  // static Future<String> showDateDialog(BuildContext context, DateTime date, GetxController controller, Function function) async {
  //   DateTime? newDate = await showDatePicker(
  //       context: context,
  //       initialDate: date,
  //       firstDate: DateTime(1900),
  //       lastDate: DateTime(2100));
  //   if (newDate == null) return '';
  //
  //   date = newDate;
  //   int year = date.year;
  //   int month = date.month;
  //   int day = date.day;
  //   String formattedDate = DateFormat('yyyy-MM-dd').format(date);
  //   // dateSelected = formattedDate;
  //   print('DATE: $formattedDate');
  //   // getSchedule(dateSelected);
  //   controller.update();
  //   return formattedDate;
  // }

  static String getDateToday(){
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateToday = '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
    return dateToday;
  }

  static String iconBack(){
    return getAppLanguage() == 'ar' ? '${Const.icons}icon_back_ar.svg' : '${Const.icons}icon_back.svg';
  }

  static String iconNext(){
    return getAppLanguage() == 'ar' ? '${Const.icons}icon_previous.svg' : '${Const.icons}icon_next.svg';
  }

  static String iconPrevious(){
    return getAppLanguage() == 'ar' ? '${Const.icons}icon_next.svg' : '${Const.icons}icon_previous.svg';
  }


  static String iconArrow() {
    return getAppLanguage() == 'ar'
        ? '${Const.icons}icon_back_en.svg'
        : '${Const.icons}icon_back_ar.svg';
  }
  static String iconLogout() {
    return getAppLanguage() == 'ar'
        ? '${Const.icons}icon_logout_en.svg'
        : '${Const.icons}icon_logout_ar.svg';
  }




  static void showLoginBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 400.h,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 4,
                  width: 50,
                  margin: const EdgeInsetsDirectional.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: AppColors.colorgreenl,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                    margin: EdgeInsetsDirectional.only(top: 12.r, bottom: 12, end: 20),
                    height: 180.h,
                    width: 280.w,
                    child: SvgPicture.asset('${Const.images}login_image.svg', fit: BoxFit.scaleDown)),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
                  child: AppText.medium(text:
                  'please_login'.tr,
                    color: AppColors.grayColor,
                    fontSize: Platform.isAndroid ? 16.sp : 14.sp,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                    margin: const EdgeInsetsDirectional.only(top: 10, start: 10, end: 10),
                    width: double.infinity,
                    child: AppWidgets.CustomButton(
                        radius: 8,
                        background: AppColors.grayColor,
                        borderColor: AppColors.grayColor,
                        text: 'login'.tr,
                        isUpperCase: false,
                        click: () {
                          AppHelper.goToLogin();
                        })),
              ],
            ),
          );
        });
  }




  static void goToLogin() {
    // HomeController controller = Get.find();
    // PreferencesManager.clearData(key: Const.KEY_LATITUDE);
    // PreferencesManager.clearData(key: Const.KEY_LONGITUD);
    PreferencesManager.clearData(key: Const.KEY_USER_TOKEN);
    PreferencesManager.clearData(key: Const.KEY_USER_DATA);
    // controller.getCurrenNavIndex(navIndex: 0);
    // Get.offAndToNamed(Routes.login);
  }

  static void statusBarColor({required bool isHome}){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
        statusBarColor: isHome ? AppColors.colorpurple : Colors.white,
        statusBarIconBrightness: isHome ? Brightness.light : Brightness.dark,
        statusBarBrightness: isHome ? Brightness.light : Brightness.dark));
  }

}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
