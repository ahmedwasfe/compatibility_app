import 'package:compatibility_app/controller/home_page_controller.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: SvgPicture.asset(
          '${Const.images}home_page.svg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.menu,
            color: AppColors.colorgreenl,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsetsDirectional.only(end: 8.r, top: 12.r),
            child: Stack(
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
                  width: 15.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.lightred
                  ),
                  child: AppText.medium(text: '8',color: Colors.white,fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
                  EdgeInsetsDirectional.only(top: 8.r, start: 14.r, end: 14.r),
              child: TextFormField(
                textInputAction: TextInputAction.go,
                controller: controller.serachController,
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
                    hintText: 'search'.tr,
                    hintStyle: TextStyle(
                        color: AppColors.grayColor,
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400),
                    fillColor: AppColors.lightBorder2,
                    filled: true,
                    // suffixIcon: SvgPicture.asset('${Const.icons}fliter.svg',
                    // width: 20.w,height: 10.h,),
                    // suffixIcon: Icon(Icons.setting),
                    prefixIcon: Container(
                        height: 8,
                        width: 8,
                        child: const Icon(
                          Icons.search_rounded,
                          color: AppColors.colorpurple,
                        )),
                    helperMaxLines: 2,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.lightBorder2, width: 0.w),
                      borderRadius: BorderRadius.circular(8).r,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.w),
                      borderRadius: BorderRadius.circular(8).r,
                    ),
                    constraints: BoxConstraints(
                      maxHeight: 50.h,
                      minWidth: 48.w,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 30.r),
              alignment: AlignmentDirectional.center,
              child: AppText.larg(
                  text: 'aya'.tr, color: Colors.black, fontSize: 14.r),
            ),
            Container(
              // width: 343.w
              // ,
              // height: 152.h,
              margin:
                  const EdgeInsetsDirectional.only(start: 10, end: 10, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: ImageSlideshow(
                width: double.infinity,
                height: 200.h,
                initialPage: 0,
                indicatorColor: AppColors.colorpurple,
                indicatorRadius: 5,
                indicatorBackgroundColor: Colors.grey,
                autoPlayInterval: 3000,
                isLoop: true,
                children: [
                  // SvgPicture.asset('${Const.images}sing_up',
                  // width: double.infinity,
                  //   height: double.infinity,
                  //   fit: BoxFit.cover,),
                  Image.asset(
                    '${Const.images}dlider_k.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    '${Const.images}dlider_k.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    '${Const.images}dlider_k.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    '${Const.images}dlider_k.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsetsDirectional.only(top: 16.r, end: 16.r, start: 16.r),
              width: double.infinity,
              height: 200.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.lightGray6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(
                        top: 10.r, end: 16.r, start: 16.r),
                    child: AppText.medium(
                        text: 'intrections'.tr,
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400),
                  ),
                  Container(
                      padding: EdgeInsetsDirectional.only(top: 40.r),
                      alignment: Alignment.center,
                      child: AppWidgets.CustomButton(
                        text: 'app_evaluation'.tr,
                        click: () {
                          AppHelper.showRatingapp(context);
                        },
                        height: 43.h,
                        width: 180.w,
                        radius: 6.r,
                      )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                  top: 16.r, end: 16.r, start: 16.r, bottom: 20.r),
              padding: EdgeInsetsDirectional.only(bottom: 20.r),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.lightGray6),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsetsDirectional.only(start: 15.r, top: 10.r),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 45,
                              backgroundImage: AssetImage(
                                '${Const.images}profial.jpg',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsetsDirectional.only(start: 15.r, top: 10.r),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppText.medium(
                                    text: 'name',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                SizedBox(
                                  width: 4.w,
                                ),
                                AppText.medium(
                                    text: 'خليل عماد هتهت',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.lightGray8),
                              ],
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(top: 11.r),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppText.medium(
                                      text: 'membership_number',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  AppText.medium(
                                      text: '05972',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.lightred),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(top: 11.r),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppText.medium(
                                      text: 'email',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  AppText.medium(
                                      text: 'khalil@gmail.com',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.lightGray8),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(top: 11.r),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppText.medium(
                                      text: 'subscription_time',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  AppText.medium(
                                      text: 'منذ 12 ساعه',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.lightplue),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsetsDirectional.only(top: 40.r),
                      alignment: Alignment.center,
                      child: AppWidgets.CustomButton(
                        text: 'check_email'.tr,
                        click: () {
                          Get.toNamed(Routes.check_email);
                        },
                        height: 47.h,
                        width: 250.w,
                        radius: 6.r,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
