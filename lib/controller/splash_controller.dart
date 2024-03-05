

import 'dart:developer';

import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:compatibility_app/utils/preferences_manager.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class SplashController extends GetxController {

  bool? isBoarding = PreferencesManager.getAppData(key: Const.KEY_BOARDING);

  @override
  void onInit() {
    // PreferencesManager.saveAppData(key: Const.KEY_UUID, value: const Uuid().v4());
    WelcomScreen();
    AboutUsScreen();
    CallScreen();
    super.onInit();
  }

  Future WelcomScreen() {
    // PreferencesManager.clearData(key: Const.KEY_BOARDING);
    log('isBoarding: ${isBoarding}');
    if (isBoarding != null) {
      if (AppHelper.getCurrentUserToken() != null) {
        return Future.delayed(
            const Duration(seconds: 5), () => Get.offAndToNamed(Routes.home));
      } else {
        return Future.delayed(
            // login
            const Duration(seconds: 5), () => Get.offAndToNamed(Routes.login));
      }
    } else {
      return Future.delayed(
          // boarding
          const Duration(seconds: 5), () => Get.toNamed(Routes.boarding));
    }
  }

  Future<void> AboutUsScreen() async {
    print("object");
    // await ApiRequestes.getTerms(language: AppHelper.getAppLanguage())
    //     .then((value) {
    //   if(value != null){
    //     PreferencesManager.saveAppData(key: Const.KEY_TERMS, value: value.data!.content);
    //     // print('TERMS: ${PreferencesManager.getAppData(key: Const.KEY_TERMS)}');
    //   }
    // });
  }

  Future<void> CallScreen() async {
    //   await ApiRequestes.getPrivacy(language: AppHelper.getAppLanguage())
    //       .then((value) {
    //     if(value != null){
    //       PreferencesManager.saveAppData(key: Const.KEY_PRIVACY, value: value.data!.content);
    //       // print('TERMS: ${PreferencesManager.getAppData(key: Const.KEY_TERMS)}');
    //     }
    //   });
    // }


  }
}