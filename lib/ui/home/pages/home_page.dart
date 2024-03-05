import 'dart:developer';

import 'package:compatibility_app/controller/home_page_controller.dart';
import 'package:compatibility_app/controller/settings_controller.dart';
import 'package:compatibility_app/model/home/slider_Item.dart';
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
    log('UUID: ${AppHelper.getCurrentUser()!.uuid}');
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: SvgPicture.asset(
          '${Const.images}home_page.svg',
          fit: BoxFit.cover,
        ),
        actions: [
          GestureDetector(
            child: Container(
              alignment: AlignmentDirectional.centerEnd,
              margin: EdgeInsetsDirectional.only(end: 20.r),
              child: Stack(
                // alignment: AlignmentDirectional.topEnd,
                children: [
                  SvgPicture.asset(
                      width: 28.w, height: 28.h, '${Const.images}notfiactions.svg'),
                  Container(
                    alignment: AlignmentDirectional.topCenter,
                    margin: EdgeInsetsDirectional.only(top: 0.r, start: 13.0.r),
                    width: 18.w,
                    height: 18.h,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadiusDirectional.circular(50.r)),
                    child: AppText.medium(
                        text: '8',
                        fontWeight: FontWeight.w300,
                        fontSize: 10.sp,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            onTap: () => Get.toNamed(Routes.notifications),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Container(
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
                    suffixIcon: IconButton(onPressed: (){},icon: Icon(Icons.filter_list_rounded ),),
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
            ),*/
            Container(
              margin: EdgeInsetsDirectional.only(top: 30.r),
              alignment: AlignmentDirectional.center,
              child: AppText.larg(
                  text: 'aya'.tr, color: Colors.black, fontSize: 14.r),
            ),
            // Container(
            //   // width: 343.w
            //   // ,
            //   // height: 152.h,
            //   margin:
            //       const EdgeInsetsDirectional.only(start: 10, end: 10, top: 20),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   clipBehavior: Clip.antiAlias,
            //   child: ImageSlideshow(
            //     width: double.infinity,
            //     height: 200.h,
            //     initialPage: 0,
            //     indicatorColor: AppColors.colorpurple,
            //     indicatorRadius: 5,
            //     indicatorBackgroundColor: Colors.grey,
            //     autoPlayInterval: 3000,
            //     isLoop: true,
            //     children: [
            //       // SvgPicture.asset('${Const.images}sing_up',
            //       // width: double.infinity,
            //       //   height: double.infinity,
            //       //   fit: BoxFit.cover,),
            //       Image.asset(
            //         '${Const.images}dlider_k.jpg',
            //         width: double.infinity,
            //         height: double.infinity,
            //         fit: BoxFit.cover,
            //       ),
            //       Image.asset(
            //         '${Const.images}dlider_k.jpg',
            //         width: double.infinity,
            //         height: double.infinity,
            //         fit: BoxFit.cover,
            //       ),
            //       Image.asset(
            //         '${Const.images}dlider_k.jpg',
            //         width: double.infinity,
            //         height: double.infinity,
            //         fit: BoxFit.cover,
            //       ),
            //       Image.asset(
            //         '${Const.images}dlider_k.jpg',
            //         width: double.infinity,
            //         height: double.infinity,
            //         fit: BoxFit.cover,
            //       ),
            //     ],
            //   ),
            // ),
           FutureBuilder(
               future: controller.getSliders(),
               builder: (_, snapshot) {
                 if(snapshot.connectionState == ConnectionState.done){
                   return  Container(
                     clipBehavior: Clip.antiAlias,
                     margin:
                     EdgeInsetsDirectional.only(start: 10.r, end: 10.r, top: 30.r),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadiusDirectional.circular(10.r)),
                     child: ImageSlideshow(
                       width: 360,
                       height: 195,
                       initialPage: 0,
                       indicatorRadius: 5,
                       indicatorColor: Colors.transparent,
                       indicatorBackgroundColor: Colors.transparent,
                       autoPlayInterval: 5000,
                       isLoop: true,
                       children: controller.listSliders
                           .map((slider) => SliderItem(slider: slider))
                           .toList(),
                     ),
                   );
                 }else if(snapshot.connectionState == ConnectionState.waiting){
                   return AppWidgets.CustomAnimationProgress();
                 }else {
                   return Container();
                 }
               }),
           Container(
              margin:
                  EdgeInsetsDirectional.only(top: 16.r, end: 16.r, start: 16.r),
              width: double.infinity,
             padding: EdgeInsetsDirectional.only(bottom: 12.r),
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
                        isUpperCase: false,
                        click: () {
                          controller.showRatingApp(context);
                        },
                        height: 43.h,
                        width: 180.w,
                        radius: 6.r,
                      )),
                ],
              ),
            ),
           Container(
             width: double.infinity,
              margin: EdgeInsetsDirectional.only(
                  top: 16.r, end: 16.r, start: 16.r, bottom: 20.r),
              padding: EdgeInsetsDirectional.only(bottom: 20.r),
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
                        child: CircleCachedImage(
                            radius: 32,
                            fit: BoxFit.scaleDown,
                            imageUrl: AppHelper.getCurrentUser()!.customerAllowPhoto!.isNotEmpty ? AppHelper.getCurrentUser()!.customerAllowPhoto![0].imageUrl! : Const.defaultUserImage),
                      ),
                      Expanded(
                        child: Container(
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
                                      text: AppHelper.getCurrentUser()!.fullName!,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.lightGray8),
                                ],
                              ),
                              // Container(
                              //   margin: EdgeInsetsDirectional.only(top: 11.r),
                              //   child: Row(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              //     children: [
                              //       AppText.medium(
                              //           text: 'membership_number',
                              //           fontSize: 14,
                              //           fontWeight: FontWeight.w600),
                              //       SizedBox(
                              //         width: 4.w,
                              //       ),
                              //       AppText.medium(
                              //           text: '',
                              //           fontSize: 14,
                              //           fontWeight: FontWeight.w600,
                              //           color: AppColors.lightred),
                              //     ],
                              //   ),
                              // ),
                              Container(
                                margin: EdgeInsetsDirectional.only(top: 11.r),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [

                                    AppText.medium(
                                        text: AppHelper.getCurrentUser()!.email!,
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
                                        text: 'country',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    AppText.medium(
                                        text: AppHelper.getCurrentUser()!.country!.name!,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.lightplue),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppHelper.getCurrentUser()!.smsVerify == 0
                      ? Container(
                      padding: EdgeInsetsDirectional.only(top: 40.r),
                      alignment: Alignment.center,
                      child: AppWidgets.CustomButton(
                        text: 'check_email'.tr,
                        isUpperCase: false,
                        click: () {
                          Get.toNamed(Routes.check_email);
                        },
                        height: 47.h,
                        width: 250.w,
                        radius: 6.r,
                      ))
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 30.r),
        child: ListView(
          children: [
            SvgPicture.asset('${Const.images}logo_com.svg',height: 50,width: 50,),

            Container(
              margin: EdgeInsetsDirectional.only(top: 30.r),
              alignment: AlignmentDirectional.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText.larg(text: 'خليل عماد هتهت',fontSize: 17),
                  AppText.medium(text: 'khalil@gmail.com',fontSize: 13),
                ],
              ),
            ),
            SizedBox(height: 30.h,),
            ListTile(
              onTap: ()=>Get.toNamed(Routes.call),
              title: AppText.medium(text: 'call_us'),
              leading: SvgPicture.asset('${Const.icons}icon_call.svg'),
            ),
            ListTile(
              onTap: ()=>  SettingsController.showShareDialog(context),
              title: AppText.medium(text: 'share_app'),
              leading: SvgPicture.asset('${Const.images}share.svg'),
            ),
            ListTile(
              onTap: ()=> Get.toNamed(Routes.success_stories),
              title: AppText.medium(text: 'success_stories'),
              leading: SvgPicture.asset('${Const.images}success.svg'),
            ),

            ListTile(
              onTap: ()=> Get.toNamed(Routes.tawafuq_blog),
              title: AppText.medium(text: 'tawafuq_blog'),
              leading: SvgPicture.asset('${Const.images}tawafuq_blog.svg'),
            ),

            ListTile(
              onTap: ()=> Get.toNamed(Routes.tawafuq_blog),
              title: AppText.medium(text: 'confidentiality_policy'),
              leading: SvgPicture.asset('${Const.images}plosiy.svg'),
            ),

            ListTile(
              onTap: ()=> Get.toNamed(Routes.about),
              title: AppText.medium(text: 'about_us'),
              leading: SvgPicture.asset('${Const.images}about.svg'),
            ),
          ],
        ),
      ),
    );
  }
}




