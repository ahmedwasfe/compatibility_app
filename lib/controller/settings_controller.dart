
import 'dart:io';

import 'package:compatibility_app/model/language.dart';
import 'package:compatibility_app/model/settings/country.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController{


  RxString selectedlistCountryType = ''.obs;

  bool isChecked = false;


//فلترت الاعضاء

  List<Country> listCountryType = [
    Country(isSelected: false ,title: 'مصر'),
    Country(isSelected: false , title: 'مصر'),
    Country(isSelected: false , title: 'مصر'),
    Country(isSelected: false , title: 'مصر'),
    Country(isSelected: false , title: 'مصر'),
    Country(isSelected: false , title: 'مصر'),
  ];





  late GlobalKey<FormState> formKey;
  late TextEditingController cardController;
  late TextEditingController fullNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController textNameController;
  late TextEditingController problemController;
  late TextEditingController conectController;

  @override
  void onInit() {
    formKey = GlobalKey();
    cardController = TextEditingController();
    fullNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    textNameController = TextEditingController();
    problemController = TextEditingController();
    conectController = TextEditingController();

    super.onInit();
    // phoneController.text = '0598113864';
    // passwordController.text = '12345666';
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    cardController.dispose();
    fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    textNameController.dispose();
    problemController.dispose();
    conectController.dispose();

    super.dispose();
  }



}