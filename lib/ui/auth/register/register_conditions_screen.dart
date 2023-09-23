//شروط التسجيل
import 'package:compatibility_app/controller/register_controller.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
class RegisterConditionsScreen extends StatelessWidget {
RegisterController controller=Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // extendBody: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back,color: AppColors.colorgreenl,),),
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
                alignment: AlignmentDirectional.topStart,
                margin: EdgeInsetsDirectional.only(
                    top: 36.r, start: 10.r, end: 10.r),
                width: double.infinity,
                height: 130.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r).r,
                  color:AppColors.lightGray6,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: AlignmentDirectional.center,
                      padding: EdgeInsetsDirectional.only(top: 10.r,start:10 .r),
                      child: Row(
                        children: [
                          AppText.medium(
                              text: 'conditions',
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
                      alignment: AlignmentDirectional.topStart,
                      margin: EdgeInsets.only(top: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          AppText.medium(text: 'clicking_create_account_agree',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.lightgray),
                          SizedBox(width: 2.w),
                          InkWell(
                            // onTap: =>,
                            child: AppText.medium(text: 'terms_and_conditions',
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500, color: Colors.red,),

                          ),
                        ],
                      ),
                    ),


                    Container(
                      padding: EdgeInsetsDirectional.only(top: 10.r,start:32 .r),
                      alignment: AlignmentDirectional.topStart,
                      child:InkWell(
                        // onTap: =>,
                        child: AppText.medium(text: 'terms_of_use',
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500, color: Colors.red,),

                      ),
                    ),

                  ],
                ),
              ),


              Center(
                child: Container(
                    margin: const EdgeInsets.only(bottom: 0),
                    child: Obx(() => controller.isLoading.isTrue ? AppWidgets.CustomAnimationProgress() : Container())),
              ),
              Container(
                  padding: EdgeInsetsDirectional.only(top: 180.r, bottom: 10),
                  alignment: Alignment.center,
                  child: AppWidgets.CustomButton(
                    text: 'create_account'.tr,
                    click: () {
                      Get.toNamed(Routes.home);
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
