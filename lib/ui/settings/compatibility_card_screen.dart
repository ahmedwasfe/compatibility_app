import 'package:compatibility_app/controller/settings_controller.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
//شاشة بطاقة توافق
class CompatibiltityCardScreen extends StatelessWidget {
  SettingsController controller=Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.medium(
            text: 'compatibility_card',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          Stack(
            children: [
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  '${Const.images}notfiactions.svg',
                  height: 25.h,
                  width: 25.w,
                ),
              ),
              Container(
                alignment: AlignmentDirectional.center,
                width: 14.w,
                height: 14.h,
                decoration: BoxDecoration(
                    color: AppColors.lightred2,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: AppColors.lightGray6)),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                      alignment: AlignmentDirectional.center,
                      child: AppText.medium(
                          text: '5', color: Colors.white, fontSize: 10)),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(top: 50.r),
                alignment: AlignmentDirectional.center,
                child: SvgPicture.asset('${Const.images}card.svg',
                fit: BoxFit.cover,
                height: 112.h,
                width:139.w ,),
              ),





              Container(
                margin: EdgeInsetsDirectional.only(top: 45.r,start: 16.r,end: 16.r
                ),
                width: double.infinity,
                height: 258.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: AppColors.colorLine
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsetsDirectional.only(top: 11.r,start: 12.r,end: 12.r
                        ),
                        child: AppText.medium(text: 'tawafuq_local',fontWeight: FontWeight.w500)),

                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin:
                            EdgeInsetsDirectional.only(top: 40.r, start: 16.r),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.topStart,
                                  child: AppText.medium(
                                      text: 'card_number', fontWeight: FontWeight.w500),
                                ),
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
                              controller: controller.cardController,
                              keyboardType: TextInputType.text,
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
                                  hintText: 'enter_card'.tr,
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
                                        color:Colors.white, width: 0.w),
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
                              // validator: (card) =>
                              //     AppHelper.validate(value: value!),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),


              Container(
                  padding: EdgeInsetsDirectional.only(top: 50.r,bottom: 20.r),
                  alignment: Alignment.center,
                  child: AppWidgets.CustomButton(text: 'activate_card'.tr, click:(){},
                    height: 47.h,width: 220.w,radius: 6.r,
                    fontSize: 14.r
                  ),),


              Container(
                  padding: EdgeInsetsDirectional.only(top: 14.r,bottom: 20.r),
                  alignment: Alignment.center,
                   child: AppWidgets.CustomButton(text: 'excellence_package'.tr,textColor: Colors.black, click:(){},
                    height: 47.h,width: 220.w,radius: 6.r,
                    borderColor: AppColors.colorpurple,
                    background: Colors.white,
                       fontSize: 14.r
                  ),),






            ],
          ),
        ),
      ),
    );
  }
}
