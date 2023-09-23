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

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
     leading:IconButton(onPressed: (){
Get.toNamed(Routes.boarding);
     }, icon:Icon(Icons.arrow_back,color: AppColors.colorgreenl,size: 22,)),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
              padding: EdgeInsetsDirectional.only(top: 250.r),
              alignment: AlignmentDirectional.center,
              child: SvgPicture.asset('${Const.images}logo_com.svg',fit: BoxFit.cover,height: 100,width: double.infinity,)),
          Container(
            padding: EdgeInsetsDirectional.only(top: 56.r),
            alignment: Alignment.center,
            child: AppText.larg(text: 'hey_you',color: Colors.black),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsetsDirectional.only(top: 30.r),
            child: AppText.medium(text: 'create_an_account_and_access',
            color:AppColors.lightGray2,
            height: 2),
          ),
          InkWell(
            child: Container(
                padding: EdgeInsetsDirectional.only(top: 18.r),
                alignment: Alignment.center,
                child: AppWidgets.CustomButton(text: 'start_now'.tr, click:(){
                  AppHelper.showLanguageDialog(context);
                },
                height: 47.h,width: 220.w,radius: 6.r,
                )),
          ),

          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 27.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                AppText.medium(text: 'dont_have_account',
                    fontSize: 16.sp,
                color: AppColors.lightgray),
                SizedBox(width: 2.w),
                InkWell(
                    child: AppText.medium(text: 'create_account',fontSize: 16.sp, color: Colors.black),
                    onTap: () => Get.toNamed(Routes.register),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
