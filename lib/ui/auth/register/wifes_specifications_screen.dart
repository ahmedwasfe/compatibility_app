//شاشة مواصفات شريكة الحياه
import 'package:compatibility_app/controller/register_controller.dart';
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
import 'package:get/get_utils/get_utils.dart';

class WifesSpecificationScreen extends GetView<RegisterController> {
  RegisterController controller = Get.put(RegisterController());

  WifesSpecificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.colorgreenl,
          ),
        ),
      ),

      body: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(top: 10.r),
                alignment: AlignmentDirectional.center,
                child: AppText.larg(
                  text: 'register_new_pair',
                  color: Colors.black,
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 12.r),
                alignment: AlignmentDirectional.center,
                child: AppText.medium(
                    text: 'oh_grant_good_wife',
                    color: AppColors.darkSecondColor),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(top: 35.r),
                alignment: AlignmentDirectional.center,
                child: SvgPicture.asset(
                  '${Const.images}sing_up.svg',
                  fit: BoxFit.cover,
                  height: 186.h,
                  width: double.infinity,
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(
                    top: 36.r, start: 16.r, end: 16.r),
                padding: EdgeInsetsDirectional.only(bottom: 20.r),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r).r,
                  color: AppColors.colorLine,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: AlignmentDirectional.center,
                      padding: EdgeInsetsDirectional.only(top: 25.r),
                      child: AppText.medium(
                          text: 'characteristics_relationship_with',
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(
                          top: 10.r, start: 12, end: 12),
                      width: 320.r,
                      height: 150.r,
                      alignment: AlignmentDirectional.center,
                      decoration: BoxDecoration(
                          color: AppColors.lightBorder,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Container(
                          margin: EdgeInsetsDirectional.only(
                              top: 0.r, start: 0.r, end: 0.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.go,
                                controller: controller.descriptionController,
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.black,
                                cursorWidth: 1.3.w,
                                cursorRadius: const Radius.circular(10).r,
                                enabled: true,
                                textAlignVertical:
                                    AppHelper.getTextAlignVertical(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                    hintText: 'enter_description'.tr,
                                    hintStyle: TextStyle(
                                        color: AppColors.grayColor,
                                        fontSize: 14.h,
                                        fontWeight: FontWeight.w400),
                                    // fillColor:  AppColors.colorGray,
                                    fillColor: AppColors.lightBorder,
                                    filled: true,
                                    helperMaxLines: 2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.lightBorder,
                                          width: 0.w),
                                      borderRadius: BorderRadius.circular(0).r,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.lightBorder,
                                          width: 0.w),
                                      borderRadius: BorderRadius.circular(0).r,
                                    ),
                                    constraints: BoxConstraints(
                                      maxHeight: 300.h,
                                      minWidth: 48.w,
                                    )),
                                validator: (name) =>
                                    AppHelper.detialsName(name: name!),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(
                          top: 10.r, start: 0.r, end: 0.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.medium(text: '*'),
                          SizedBox(
                            width: 9.w,
                          ),
                          AppText.medium(
                              text: 'username_nickname_that',
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsetsDirectional.only(top: 40.r, bottom: 10),
                  alignment: Alignment.center,
                  child: AppWidgets.CustomButton(
                    text: 'next'.tr,
                    click: () {
                      if(controller.isValidationDescription(context)){
                        Get.toNamed(Routes.register_self);
                      }
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
