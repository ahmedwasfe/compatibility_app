import 'dart:developer';

import 'package:compatibility_app/controller/blog_controller.dart';
import 'package:compatibility_app/model/post/blog.dart';
import 'package:compatibility_app/model/user.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/ui/settings/tawafuq_details_screen.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

//مدونة توافق
class TawafuqBlogScreen extends StatelessWidget {
  BlogController controller = Get.put(BlogController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: AppText.medium(
            text: 'tawafuq_blog',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
        future: controller.getPost(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: GetBuilder<BlogController>(
                  builder: (controller) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsetsDirectional.only(
                                  top: 14.r, start: 16.r),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppText.medium(
                                      text:
                                          '(${controller.listBlog.length})'.tr,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.h),
                                ],
                              )),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.listBlog.length,
                              itemBuilder: (context, index) =>
                                  buildPostItem(controller.listBlog[index]))
                        ],
                      )),
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

  Widget buildPostItem(Blogs post) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 15.r),
      width: double.infinity,
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
                      text: post.title!,
                      color: Colors.black,
                      fontSize: 14.h,
                      fontWeight: FontWeight.w600),
                  const Spacer(),
                  const Icon(
                    Icons.access_time_outlined,
                    color: AppColors.lightgray,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  AppText.medium(
                      text: post.createdAt!,
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
            clipBehavior: Clip.antiAlias,
            margin:
                EdgeInsetsDirectional.only(start: 12.r, end: 12.r, top: 9.r),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
            child: CachedImage(imageUrl: post.imageUrl!, isLoading: true),
          ),

          Container(
            width: double.infinity,
            margin: EdgeInsetsDirectional.only(start: 12.r, top: 4.r),
            child: AppText.medium(
              text: post.description!,
              fontWeight: FontWeight.w400,
              fontSize: 12.h,
              height: 1.8,
              maxline: 10,
            ),
          ),

          InkWell(
            onTap: () {
              log('POSTID: ${post.id}');
              Get.to(TawafuqDetailsScreen(postId: post.id!));
            },
            child: Container(
              margin: EdgeInsetsDirectional.only(
                  top: 8.r, bottom: 10.r, start: 10.r),
              child: Row(
                children: [
                  AppText.larg(text: 'more', fontSize: 15),
                  SizedBox(
                    width: 3.w,
                  ),
                  AppText.larg(text: '....', fontSize: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
