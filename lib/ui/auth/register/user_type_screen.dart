import 'dart:developer';

import 'package:compatibility_app/controller/register_controller.dart';
import 'package:compatibility_app/controller/user_type_controller.dart';
import 'package:compatibility_app/model/user_type.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserTypeScreen extends StatelessWidget {
  final _controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsetsDirectional.only(top: 105.r),
              alignment: AlignmentDirectional.center,
              child: AppText.larg(
                text: 'welcome_to_application',
                color: Colors.black,
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.only(top: 6.r),
              alignment: AlignmentDirectional.center,
              child: AppText.medium(
                  text: 'welcome_to_tawafuq_application',
                  color: AppColors.darkSecondColor),
            ),
            Container(
              padding: EdgeInsetsDirectional.only(top: 36.r),
              alignment: AlignmentDirectional.center,
              child: SvgPicture.asset(
                '${Const.images}user_type.svg',
                fit: BoxFit.cover,
                height: 186.h,
                width: double.infinity,
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _controller.listUserType.length,
                itemBuilder: (_, index) => buildUserTypeItem(_controller.listUserType[index])),
            Container(
                padding: EdgeInsetsDirectional.only(top: 80.r),
                alignment: Alignment.center,
                child: AppWidgets.CustomButton(
                  text: 'next'.tr,
                  click: () {
                    if(_controller.isValidationUserType(context)){
                      Get.toNamed(Routes.register_Informations);
                    }
                  },
                  height: 47.h,
                  width: 220.w,
                  radius: 6.r,
                )),
          ],
        ),
      ),
    );
  }

  Widget buildUserTypeItem(UserType userType) => GestureDetector(
    child: GetBuilder<RegisterController>(builder: (controller) => Container(
      height: 50,
      margin: EdgeInsetsDirectional.only(start: 28.r, end: 28.r, top: 12.r, bottom: 12.r),
      decoration: BoxDecoration(
          color: userType.isSelected ? AppColors.colorAppMain : Colors.white,
          borderRadius: BorderRadiusDirectional.circular(8.r),
          border: Border.all(color: AppColors.colorAppMain, width: 1.5)
      ),
      child: Row(
        children: [
          Container(
            width: 24.w,
            height: 24.h,
            margin: EdgeInsetsDirectional.only(start: 20.r),
            padding: EdgeInsetsDirectional.all(userType.isSelected ? 4 : 0),
            decoration: BoxDecoration(
              color: AppColors.colorAppMain,
              borderRadius: BorderRadiusDirectional.circular(50.r),
              border: Border.all(color: userType.isSelected ? Colors.white : AppColors.colorAppMain)
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(50.r),

              ),
            ),
          ),
          Container(
              margin: EdgeInsetsDirectional.only(start: 30.r),
              child: AppText.medium(text: userType.name, color: userType.isSelected ? Colors.white : AppColors.colorAppMain))
        ],
      ),
    )),
    onTap: () {
      for(var user in _controller.listUserType){
        user.isSelected = false;
      }
      userType.isSelected = true;
      _controller.userSelected = userType.value;
      log('USER TYPE: ${_controller.userSelected}');
      _controller.update();
    },);
}
