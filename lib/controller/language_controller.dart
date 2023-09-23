
import 'dart:io';

import 'package:compatibility_app/model/language.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:compatibility_app/utils/preferences_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController{

  RxString langSelected = ''.obs;

  List<Language> listLanguages = [
    Language(languageName: 'arabic'.tr, languageCode: Const.KEY_LANGUAGE_AR),
    Language(languageName: 'english'.tr, languageCode: Const.KEY_LANGUAGE_EN),
  ];

  Locale? getAppLocale() {
    print('DEVICE LANG: ${Get.deviceLocale!.languageCode}');
    String? language = PreferencesManager.getAppLanguage(key: Const.KEY_LANGUAGE);
    if (language == Const.KEY_LANGUAGE_AR) {
      return const Locale(Const.KEY_LANGUAGE_AR);
    } else if (language == Const.KEY_LANGUAGE_EN) {
      return const Locale(Const.KEY_LANGUAGE_EN);
    } else {
      return Locale(Get.deviceLocale!.languageCode);
    }
  }

  void saveLanguage(String langCode) {
    Locale locale = Locale(langCode);
    PreferencesManager.saveAppLanguage(key: Const.KEY_LANGUAGE, languageCode: langCode);
    Get.updateLocale(locale);
  }

}