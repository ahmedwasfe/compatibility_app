
import 'dart:io';

import 'package:compatibility_app/model/language.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:compatibility_app/utils/preferences_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController{

  RxString langSelected = ''.obs;

  List<Language> listLanguages = [
    Language(languageName: 'arabic'.tr, languageCode: Const.KEY_LANGUAGE_AR, isSelected: false),
    Language(languageName: 'english'.tr, languageCode: Const.KEY_LANGUAGE_EN, isSelected: false),
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

  void showLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (con) => AlertDialog(
          content: Container(
              width: 400,
              height: 210,
              clipBehavior: Clip.antiAlias,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(36)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 11.h,
                  ),
                  AppText.medium(
                    text: 'choose_language',
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: Platform.isAndroid ? 16.sp : 13.sp,
                  ),
                  Divider(height: 4.h, color: Colors.black),
                  SizedBox(
                    height: 8.h,
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listLanguages.length,
                      itemBuilder: (context, index) =>
                          GetBuilder<LanguageController>(
                              builder: (controller) {
                                return Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    width: 120.w,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5).r,
                                      border: Border.all(
                                          color: controller.listLanguages[index].isSelected
                                              ? AppColors.colorAppMain
                                              : Colors.grey),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Radio<String>(
                                          value: controller
                                              .listLanguages[index].languageCode,
                                          groupValue: controller.langSelected.value,
                                          activeColor:
                                          AppColors.colorAppMain,
                                          onChanged: (value) {
                                            for (Language language in controller.listLanguages) {
                                              language.isSelected = false;
                                            }
                                            controller.listLanguages[index]
                                                .isSelected = true;
                                            controller.langSelected.value =
                                                value.toString();
                                            controller.saveLanguage(
                                                controller.langSelected.value);
                                            controller.update();
                                            Navigator.pop(context);
                                          },
                                        ),
                                        AppText.medium(
                                            text: controller
                                                .listLanguages[index].languageName,
                                            color: Colors.black,
                                            fontSize: Platform.isAndroid ? 12.sp : 10.sp ,
                                            fontWeight: FontWeight.w500),
                                      ],
                                    ));
                              }),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              )),
        ));
  }

}