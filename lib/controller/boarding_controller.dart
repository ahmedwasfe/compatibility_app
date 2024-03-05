import 'package:compatibility_app/model/boardings.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:compatibility_app/utils/preferences_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class BoardingController extends GetxController {
  PageController pageController = PageController();
  final liquidController = LiquidController();
  int currentPage = 0;

  List<Boardings> listBoarding = [
    Boardings(
      title: 'boarding_title2',
      subtitle: 'subtitle2',
      details: 'details2',
      image: 'borading2.png',
      bgColor: Colors.white,
    ),
    Boardings(
      title: 'boarding_title3',
      subtitle: 'subtitle3',
      details: 'details3',
      image: 'borading3.png',
      bgColor: Colors.white,
    ),
    Boardings(
      title: 'boarding_title1',
      subtitle: 'subtitle1',
      details: 'details1',
      image: 'borading1.png',
      bgColor: Colors.white,
    ),
  ];

  RxBool isLast = false.obs;

  void onPageChangeCallback(int activePageIndex) {
    currentPage = activePageIndex;
    if (activePageIndex == listBoarding.length - 1) {
      isLast.value = true;
    } else {
      isLast.value = false;
    }
    update();
  }

  void goToLogin() {
    PreferencesManager.saveAppData(key: Const.KEY_BOARDING, value: true)
        .then((value) => {if (value) Get.offAndToNamed(Routes.welcom)});
  }
}
