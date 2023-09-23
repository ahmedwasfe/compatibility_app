

import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/ui/settings/about_us_Screen.dart';
import 'package:compatibility_app/ui/settings/call_screen.dart';
import 'package:compatibility_app/ui/welcome_screen.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:compatibility_app/utils/preferences_manager.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  bool? isBoarding = PreferencesManager.getAppData(key: Const.KEY_BOARDING);

  @override
  void onInit() {
    // PreferencesManager.clearData(key: Const.KEY_LANGUAGE);

    WelcomScreen();
    AboutUsScreen();
    CallScreen();

    // PreferencesManager.saveAppData(
    //     key: Const.KEY_CURRENT_LATITUDE, value: 31.515905560531966);
    // PreferencesManager.saveAppData(
    //     key: Const.KEY_CURRENT_LONGITUD, value: 34.45147501378814);

    super.onInit();
  }

  Future WelcomScreen() {
    // PreferencesManager.clearData(key: Const.KEY_LANGUAGE);
    // PreferencesManager.clearData(key: Const.KEY_BOARDING);
    if (isBoarding != null) {
      if (AppHelper.getCurrentUserToken() != null) {
        return Future.delayed(
            const Duration(seconds: 5), () => Get.offAndToNamed(Routes.profial_members));
      } else {
        return Future.delayed(
            const Duration(seconds: 5), () =>
            Get.offAndToNamed(Routes.profial_members));
      }
    } else {
      return Future.delayed(
          const Duration(seconds: 5), () => Get.toNamed(Routes.profial_members));
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