import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AppHelper.statusBarColor(isHome: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsetsDirectional.only(top: 250.r),
              alignment: AlignmentDirectional.center,
              child: SvgPicture.asset(
                '${Const.images}logo_com.svg',
                fit: BoxFit.cover,
                height: 100,
                width: double.infinity,
              )),
          Container(
            padding: EdgeInsetsDirectional.only(top: 56.r),
            alignment: Alignment.center,
            child: AppText.larg(text: 'hey_you', color: Colors.black),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsetsDirectional.only(top: 30.r),
            child: AppText.medium(
                text: 'create_an_account_and_access',
                color: AppColors.lightGray2,
                height: 2),
          ),
          InkWell(
            child: Container(
                padding: EdgeInsetsDirectional.only(top: 18.r),
                alignment: Alignment.center,
                child: AppWidgets.CustomButton(
                  text: 'sing_up'.tr,
                  click: () {
                    Get.toNamed(Routes.user_type);
                  },
                  height: 47.h,
                  width: 220.w,
                  radius: 6.r,
                )),
          ),
          InkWell(
            child: Container(
                padding: EdgeInsetsDirectional.only(top: 18.r),
                alignment: Alignment.center,
                child: AppWidgets.CustomButton(
                  text: 'login'.tr,
                  click: () {
                    Get.toNamed(Routes.login);
                  },
                  height: 47.h,
                  width: 220.w,
                  radius: 6.r,
                )),
          ),
        ],
      ),
    );
  }
}
