import 'package:compatibility_app/controller/login_controller.dart';
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
class CheckEmailScreen extends StatelessWidget {
LoginController controller=Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back,color: AppColors.colorgreenl,),),
      ),
      backgroundColor: Colors.white,
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(top: 86.r),
                alignment: AlignmentDirectional.center,
                child: SvgPicture.asset(
                  '${Const.images}check_email.svg',
                  fit: BoxFit.cover,
                  height: 186.h,
                  width: double.infinity,
                ),
              ),


              Container(
                padding: EdgeInsetsDirectional.only(top: 22.r),
                alignment: AlignmentDirectional.center,
                child: AppText.larg(
                  text: 'check_your_email',
                  color: Colors.black,
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 20.r),
                alignment: AlignmentDirectional.center,
                child: AppText.medium(
                    text: 'verification_email',
                    color: AppColors.darkSecondColor),
              ),


              Container(
                alignment: AlignmentDirectional.center,
                padding: EdgeInsetsDirectional.only(top: 37.r,start:16 .r),
                child: Row(
                  children: [
                    AppText.medium(
                        text: 'email',
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    Container(
                        padding: EdgeInsetsDirectional.only(start: 4.r),
                        child: AppText.medium(
                            text: '*', color: Colors.red, fontSize: 18)),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsetsDirectional.only(
                    top: 8.r, start: 14.r, end: 14.r),
                child: TextFormField(
                  textInputAction: TextInputAction.go,
                  controller: controller.checkEmailController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  cursorWidth: 1.3.w,
                  cursorRadius: const Radius.circular(10).r,
                  enabled: true,
                  textAlignVertical: AppHelper.getTextAlignVertical(),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                      hintText: 'enter_email'.tr,
                      hintStyle: TextStyle(
                          color: AppColors.grayColor,
                          fontSize: 14.h,
                          fontWeight: FontWeight.w400),
                      // fillColor:  AppColors.colorGray,
                      fillColor: Colors.white,
                      filled: true,
                      helperMaxLines: 2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.lightGray8, width: 0.3.w),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black, width: 1.w),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      constraints: BoxConstraints(
                        maxHeight: 50.h,
                        minWidth: 48.w,
                      )),
                  validator: (email) =>
                      AppHelper.validateEmail(email: email!),
                ),
              ),

              Container(
                  padding: EdgeInsetsDirectional.only(top: 120.r, bottom: 10),
                  alignment: Alignment.center,
                  child: AppWidgets.CustomButton(
                    text: 'next'.tr,
                    click: () {
                      Get.toNamed(Routes.verificationCode);
                    },
                    height: 47.h,
                    width: 220.w,
                    radius: 6.r,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
