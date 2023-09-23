import 'package:compatibility_app/ui/auth/register/register_debt_screen.dart';
import 'package:compatibility_app/ui/home/pages/excellence_package_screen.dart';
import 'package:compatibility_app/ui/home/pages/home_page.dart';
import 'package:compatibility_app/ui/home/pages/members_screen.dart';
import 'package:compatibility_app/ui/settings/tawafuq_blog_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController{

  List<Widget> listScreens = [
    HomePage(),
    ExcellencePackageScreen(),
    MembersScreen(),
    TawafuqBlogScreen(),
  ];

  var navIndex = 0;

  void getCurrenNavIndex({required int navIndex}) async {
    this.navIndex = navIndex;
    update();
  }

}