import 'dart:convert';
import 'dart:developer';

import 'package:compatibility_app/api/api_requestes.dart';
import 'package:compatibility_app/ui/auth/register/register_debt_screen.dart';
import 'package:compatibility_app/ui/chat/chat_screen.dart';
import 'package:compatibility_app/ui/home/pages/excellence_package_screen.dart';
import 'package:compatibility_app/ui/home/pages/home_page.dart';
import 'package:compatibility_app/ui/home/pages/members_screen.dart';
import 'package:compatibility_app/ui/home/pages/messages_page.dart';
import 'package:compatibility_app/ui/members/profile_members_screen.dart';
import 'package:compatibility_app/ui/home/pages/settings_page.dart';
import 'package:compatibility_app/ui/settings/tawafuq_blog_screen.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Widget> listScreens = [
    HomePage(),
    PackagesScreen(),
    MembersScreen(),
    MessagesPage(),
    SettingsPage(),
  ];

  var navIndex = 0;

  void getCurrenNavIndex({required int navIndex}) async {
    this.navIndex = navIndex;
    update();
  }

}
