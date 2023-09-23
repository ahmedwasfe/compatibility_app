import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';
//قائمة التجاهل
class LgnoreList extends StatelessWidget {
  const LgnoreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.medium(
            text: 'ignore_list',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsetsDirectional.only(top: 14.r, start: 16.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText.medium(
                      text: 'all_members'.tr,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.h),
                  SizedBox(
                    width: 3.w,
                  ),
                  AppText.medium(
                      text: '(12)'.tr,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.h),
                ],
              )),
          Expanded(
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListInterest();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 1.h,
                  );
                },
                itemCount: 20),
          )
        ],
      ),
    );
  }

  Widget ListInterest() {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 14.r),
      width: double.infinity,
      height: 110.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.lightGray21,
      ),
      child: Row(
        children: [
          Container(
            margin:
            EdgeInsetsDirectional.only(end: 10.r, top: 10.r, start: 10.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35.r,
                  backgroundImage: AssetImage('${Const.images}profial.jpg'),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(start: 15.r, top: 10.r),
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
                          text: 'age',
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        width: 4.w,
                      ),
                      AppText.medium(
                          text: '12',
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
                          text: 'residency',
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      SizedBox(
                        width: 4.w,
                      ),
                      AppText.medium(
                          text: 'فلسطين',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.lightGray8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

