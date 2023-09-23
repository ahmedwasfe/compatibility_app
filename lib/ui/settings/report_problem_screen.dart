import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
//شاشة الابلاغ عن المشكله
class ReportProblemScreen extends StatelessWidget {
  const ReportProblemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.medium(
            text: 'terms_conditions',
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
        ],
      ),

      body: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(top: 14.r,start: 16.r),
                child: AppText.medium(text: 'problem',fontWeight: FontWeight.w600,
                    fontSize: 14.h,
                    color: AppColors.lightGray87),
              ),

              Container(
                margin: EdgeInsetsDirectional.only(start:16.r ,end:16.r ,top: 15.r,bottom: 20.r
                ),
                width: double.infinity,
                height:650.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: AppColors.lightGray6,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
Container(
  margin: EdgeInsetsDirectional.only(start:12.r ,end:12.r ,top: 6.r,
  ),
  child: AppText.medium(text: 'نصصصصصص جاي من الابي اي  ',
  color: AppColors.colorgreenl,
  fontSize: 14.h,
  fontWeight: FontWeight.w400,
  ),
),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
