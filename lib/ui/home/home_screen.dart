import 'dart:convert';

import 'package:compatibility_app/controller/home_controller.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/home_page_controller.dart';


class HomeScreen extends StatelessWidget {

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    //
    // print('TYPE: ${AppHelper.getUserType()}');
    // print('TOKEN: ${AppHelper.getCurrentUserToken()}');
    // if(AppHelper.getUserType() == Const.KEY_FAMILY) {
    //   print('USER ${AppHelper.getUserType()}: ${jsonEncode(AppHelper.getCurrentParentUser())}');
    // } else if(AppHelper.getUserType() == Const.KEY_HELPER) {
    //   print('USER ${AppHelper.getUserType()}: ${jsonEncode(AppHelper.getCurrentOtherUser())}');
    // } else if(AppHelper.getUserType() == Const.KEY_CHILD) {
    //   print('USER ${AppHelper.getUserType()}: ${jsonEncode(AppHelper.getCurrentOtherUser())}');
    // }

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
          onTap: (navIndex) => controller?.getCurrenNavIndex(navIndex: navIndex),
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
  ];
}
// home_d.svg
// home.svg


// bolg.svg
// blog_out.svg


// members.svg
// members_out.svg

// caht.svg
// chat_ou.svg