import 'dart:developer';

import 'package:compatibility_app/controller/blog_controller.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// تفاصيل المدونه
class TawafuqDetailsScreen extends StatelessWidget {
  int? postId;

  TawafuqDetailsScreen({this.postId});

  final _controller = Get.put(BlogController());

  @override
  Widget build(BuildContext context) {
    log('POST ID: ${postId}');
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.medium(
            text: 'tawafuq_details',
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
      body: FutureBuilder(
        future: _controller.getPost(postId: postId!),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(
                        start: 16.r, end: 16.r, top: 15.r),
                    width: double.infinity,
                    height: 800.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: AppColors.lightGray6,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.center,
                          width: double.infinity,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                              topEnd: Radius.circular(8.r),
                              topStart: Radius.circular(8.r),
                            ),
                            color: AppColors.grayColor,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 12.r, end: 12.r, top: 7.r),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppText.medium(
                                    text: '*',
                                    color: AppColors.lightred,
                                    fontSize: 20),
                                SizedBox(
                                  width: 5.w,
                                ),
                                AppText.larg(
                                    text: _controller.listBlog[0].title!,
                                    color: Colors.black,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.w600),
                                Spacer(),
                                Icon(
                                  Icons.access_time_outlined,
                                  color: AppColors.lightgray,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                AppText.medium(
                                    text: 'منذ 5 أيام',
                                    color: AppColors.lightgray,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.h),
                              ],
                            ),
                          ),
                        ),
                        // SvgPicture.asset('${Const.images}details.svg',
                        // fit: BoxFit.cover,
                        // height:125.h,
                        // width: double.infinity,),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsetsDirectional.only(
                              start: 12.r, end: 12.r, top: 9.r),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r)),
                          child: CachedImage(imageUrl: _controller.listBlog[0].imageUrl!),
                        ),

                        Container(
                          width: double.infinity,
                          margin:
                              EdgeInsetsDirectional.only(start: 12.r, top: 4.r),
                          child: AppText.medium(
                              text: _controller.listBlog[0].description!,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.h,
                              height: 1.8,
                          maxline: 20),
                        ),

                        // Container(
                        //   width: double.infinity,
                        //   margin: EdgeInsetsDirectional.only(
                        //       start: 12.r, top: 15.r),
                        //   child: AppText.larg(
                        //       text: 'الندم والتفكير الزائد :_',
                        //       fontSize: 14,
                        //       color: Colors.black),
                        // ),
                        // Container(
                        //   width: double.infinity,
                        //   margin:
                        //       EdgeInsetsDirectional.only(start: 12.r, top: 4.r),
                        //   child: AppText.medium(
                        //       text:
                        //           'النص جايييييييييييي من الابي اي النص جايييييييييييي من الابي اي\nالنص جايييييييييييي من الابي ايالنص جايييييييييييي من الابي اي\nالنص جايييييييييييي من الابي ايالنص جايييييييييييي من الابي اي\nالنص جايييييييييييي من الابي ايالنص جايييييييييييي من الابي اي',
                        //       fontWeight: FontWeight.w400,
                        //       fontSize: 12.h,
                        //       height: 1.8),
                        // ),

                        // Container(
                        //   width: double.infinity,
                        //   margin: EdgeInsetsDirectional.only(
                        //       start: 12.r, top: 30.r),
                        //   child: AppText.larg(
                        //       text: 'الندم والتفكير الزائد :_',
                        //       fontSize: 14,
                        //       color: Colors.black),
                        // ),
                        // Container(
                        //   width: double.infinity,
                        //   margin:
                        //       EdgeInsetsDirectional.only(start: 12.r, top: 4.r),
                        //   child: AppText.medium(
                        //       text:
                        //           '',
                        //       fontWeight: FontWeight.w400,
                        //       fontSize: 12.h,
                        //       height: 1.8),
                        // ),
                        //
                        // Container(
                        //   width: double.infinity,
                        //   margin: EdgeInsetsDirectional.only(
                        //       start: 12.r, top: 30.r),
                        //   child: AppText.larg(
                        //       text: 'الندم والتفكير الزائد :_',
                        //       fontSize: 14,
                        //       color: Colors.black),
                        // ),
                        // Container(
                        //   width: double.infinity,
                        //   margin:
                        //       EdgeInsetsDirectional.only(start: 12.r, top: 4.r),
                        //   child: AppText.medium(
                        //       text:
                        //           'النص جايييييييييييي من الابي اي النص جايييييييييييي من الابي اي\nالنص جايييييييييييي من الابي ايالنص جايييييييييييي من الابي اي\nالنص جايييييييييييي من الابي ايالنص جايييييييييييي من الابي اي\nالنص جايييييييييييي من الابي ايالنص جايييييييييييي من الابي اي',
                        //       fontWeight: FontWeight.w400,
                        //       fontSize: 12.h,
                        //       height: 1.8),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return AppWidgets.CustomAnimationProgress();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget ListTawafuq() {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 15.r),
      width: double.infinity,
      height: 318.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: AppColors.colorGray,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            width: double.infinity,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r),
              ),
              color: AppColors.grayColor,
            ),
            child: Padding(
              padding:
                  EdgeInsetsDirectional.only(start: 12.r, end: 12.r, top: 7.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText.medium(
                      text: '*', color: AppColors.lightred, fontSize: 20),
                  SizedBox(
                    width: 5.w,
                  ),
                  AppText.larg(
                      text: 'مشاعر الندم بعد الفراق',
                      color: Colors.black,
                      fontSize: 14.h,
                      fontWeight: FontWeight.w600),
                  Spacer(),
                  Icon(
                    Icons.access_time_outlined,
                    color: AppColors.lightgray,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  AppText.medium(
                      text: 'منذ 5 أيام',
                      color: AppColors.lightgray,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.h),
                ],
              ),
            ),
          ),
          // SvgPicture.asset('${Const.images}details.svg',
          // fit: BoxFit.cover,
          // height:125.h,
          // width: double.infinity,),
          Container(
            margin:
                EdgeInsetsDirectional.only(start: 12.r, end: 12.r, top: 9.r),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
            child: Image.asset(
              '${Const.images}detailsss.jpg',
              fit: BoxFit.cover,
              height: 125.h,
              width: double.infinity,
            ),
          ),

          Container(
            width: double.infinity,
            margin: EdgeInsetsDirectional.only(start: 12.r, top: 4.r),
            child: AppText.medium(
                text:
                    'النص جايييييييييييي من الابي اي النص جايييييييييييي من الابي اي\nالنص جايييييييييييي من الابي ايالنص جايييييييييييي من الابي اي\nالنص جايييييييييييي من الابي ايالنص جايييييييييييي من الابي اي\nالنص جايييييييييييي من الابي ايالنص جايييييييييييي من الابي اي',
                fontWeight: FontWeight.w400,
                fontSize: 12.h,
                height: 1.8),
          ),

          Container(
            child: AppText.larg(text: 'more'),
          ),
        ],
      ),
    );
  }
}
