import 'dart:convert';
import 'dart:developer';

import 'package:compatibility_app/api/api_requestes.dart';
import 'package:compatibility_app/api/firebase_api.dart';
import 'package:compatibility_app/controller/home_controller.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';



class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    // TODO for updating user active status according to lifecycle events
    // resume ==> active or online
    // pause ==> inactive or offline
    log('initState: ');
    SystemChannels.lifecycle.setMessageHandler((message) {
      log('initState: $message');
      // AppHelper.showToast(message: message!);
      if (message.toString().contains('resume')) {
        ApiRequestes.updateActiveStatus(
            userId: AppHelper.getCurrentUser()!.id!, status: 'online');
        FirebaseAPIs.updateActiveStatus(true);
      }

      if (message.toString().contains('pause')) {
        ApiRequestes.updateActiveStatus(
            userId: AppHelper.getCurrentUser()!.id!, status: 'offline');
        FirebaseAPIs.updateActiveStatus(false);
      }
      return Future.value(message);
    });

  }

  @override
  Widget build(BuildContext context) {

    // log('TOKEN: ${jsonEncode(AppHelper.getCurrentUserToken())}');
    // log('USER: ${jsonEncode(AppHelper.getCurrentUser())}');

    AppHelper.statusBarColor(isHome: true);
    return GetBuilder<HomeController>(builder: (controller) => Scaffold(
      backgroundColor:AppColors.colorpurple,
      body: controller.listScreens[controller.navIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r, top: 20.r, bottom: 20.r),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
         color: AppColors.colorpurple,
            borderRadius: BorderRadius.circular(14.r)),
        child: BottomNavigationBar(
          elevation: 20,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
           selectedItemColor:Colors.black,
          currentIndex: controller.navIndex,
          items: _bottomNavigationBarItems(),
          onTap: (navIndex) => controller.getCurrenNavIndex(navIndex: navIndex),
        ),
      ),
    ));
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItems() => [
    BottomNavigationBarItem(
        activeIcon: SvgPicture.asset('${Const.icons}home.svg',),
        icon: SvgPicture.asset('${Const.icons}home_d.svg'), label: 'home'.tr),
    BottomNavigationBarItem(
        activeIcon: SvgPicture.asset('${Const.icons}bolg.svg', ),
        icon: SvgPicture.asset('${Const.icons}blog_out.svg'), label: 'pakege'.tr),
    BottomNavigationBarItem(
        activeIcon: SvgPicture.asset('${Const.icons}members_out.svg', ),
        icon: SvgPicture.asset('${Const.icons}members.svg'), label: 'members'.tr),
    BottomNavigationBarItem(
        activeIcon: SvgPicture.asset('${Const.icons}chat_ou.svg', ),
        icon: SvgPicture.asset('${Const.icons}caht.svg'), label: 'chats'.tr),
    BottomNavigationBarItem(
        activeIcon:Icon(Icons.settings,color:AppColors.colorpurple),
        icon: Icon(Icons.settings,color:AppColors.lightgray87), label: 'settings'.tr),
  ];
}
