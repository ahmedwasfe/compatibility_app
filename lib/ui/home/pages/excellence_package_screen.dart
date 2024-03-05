import 'package:compatibility_app/controller/packages_controller.dart';
import 'package:compatibility_app/model/subscription/subscription.dart';
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

class PackagesScreen extends StatelessWidget {

  final _controller = Get.put(PackagesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        title: AppText.medium(text: 'pakege'),

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
            Container(
              margin:
                  EdgeInsetsDirectional.only(top: 16.r, end: 16.r, start: 16.r),
              padding: EdgeInsetsDirectional.only(bottom: 12.r),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.lightGray6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(
                        top: 20.r, end: 16.r, start: 16.r),
                    child: AppText.medium(
                        text: 'subscribe'.tr,
                        fontSize: 14.h,
                        fontWeight: FontWeight.w400),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsetsDirectional.only(
                        start: 4.r, end: 4.r, top: 20.r),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 38.h,
                              padding: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                color: Colors.white,
                                border: Border.all(
                                    color: AppColors.colorpurple, width: 1.w),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AppText.medium(
                                    text: '+966 555 555 555',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.colorpurple),
                                  SvgPicture.asset('${Const.icons}Icon_call.svg')
                                ],
                              )),
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Container(
                              alignment: AlignmentDirectional.center,
                              height: 38.h,
                              padding: EdgeInsetsDirectional.only(start: 4.r, end: 4.r),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                color: Colors.white,
                                border: Border.all(
                                    color: AppColors.colorpurple, width: 1.w),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AppText.medium(
                                    text: 'send',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.colorpurple,
                                  ),
                                  SvgPicture.asset('${Const.icons}Icon_message.svg')

                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 20.r),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: AppColors.lightGray6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(8.r),
                        topEnd: Radius.circular(8.r),
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
                              text: 'advantages',
                              color: Colors.black,
                              fontSize: 14.h,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(start: 8.r, top: 8.r, bottom: 8.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppText.medium(
                                text: 'pakege',
                                color: AppColors.colorpurple,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.h),
                            SizedBox(width: 4.w),
                            Expanded(
                              child: AppText.medium(
                                  text: 'increase',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.h,
                              maxline: 8),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder(
                future: _controller.getSubscriptions(),
                builder: (_, snapshot) {
                  if(snapshot.connectionState == ConnectionState.done){
                    return Container(
                      margin:
                      EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 20.r),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: AppColors.lightGray6,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: AlignmentDirectional.center,
                            width: double.infinity,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(8.r),
                                topEnd: Radius.circular(8.r),
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
                                      text: 'price',
                                      color: Colors.black,
                                      fontSize: 14.h,
                                      fontWeight: FontWeight.w600),
                                ],
                              ),
                            ),
                          ),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _controller.listSubsciption.length,
                            itemBuilder: (context, index) => buildSubscriptionItem(_controller.listSubsciption[index]),
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 0.h);
                              },)
                        ],
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
                  EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 20.r),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: AppColors.lightGray6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(8.r),
                        topEnd: Radius.circular(8.r),
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
                              text: 'pyment'.tr,
                              color: Colors.black,
                              fontSize: 14.h,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(top: 10, bottom: 10.r),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 70.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.w,
                              color: AppColors.colorpurple,
                            ),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Image.asset(
                            '${Const.images}payment_inst.png',
                            fit: BoxFit.scaleDown,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Container(
                          width: 70.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.w,
                              color: AppColors.colorpurple,
                            ),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Image.asset(
                            '${Const.images}payment_m.png',
                            fit: BoxFit.scaleDown,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Container(
                          width: 70.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.w,
                              color: AppColors.colorpurple,
                            ),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Image.asset(
                            '${Const.images}payment_visa.png',
                            fit: BoxFit.scaleDown,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Container(
                          width: 70.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.w,
                              color: AppColors.colorpurple,
                            ),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Image.asset(
                            '${Const.images}paymentk.png',
                            fit: BoxFit.scaleDown,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSubscriptionItem(SubscriptionData subsciption) => Container(
    width: double.infinity,
    margin: EdgeInsetsDirectional.only(
        start: 10.r, end: 10.r, top: 4.r),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 6.w,
              height: 6.h,
              color: AppColors.colorAppMain,
            ),
            SizedBox(width: 8.r),
            AppText.medium(
                text: 'subscription',
                color: AppColors.lightGray3,
                fontSize: 14.h),
            SizedBox(width: 4.r),
            AppText.medium(
                text: subsciption.name!,
                color: Colors.black,
                fontSize: 14.h),
          ],
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  AppText.medium(
                      text: 'sar',
                      color: Colors.black,
                      fontSize: 14.h),
                  AppText.medium(
                      text: subsciption.price!,
                      color: Colors.black,
                      fontSize: 14.h),
                ],
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 20,
                  ))
            ],
          ),
        )
      ],
    ),
  );

  Widget ListPrice() {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r, top: 0.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.check,
            color: AppColors.colorpurple,
          ),
          SizedBox(
            width: 5.w,
          ),
          AppText.medium(
              text: 'الاشتراك ', color: AppColors.lightGray3, fontSize: 14.h),
          AppText.medium(
              text: ' شهر واحد', color: Colors.black, fontSize: 14.h),
          SizedBox(
            width: 50.w,
          ),
          AppText.medium(text: '255 ر.س', color: Colors.black, fontSize: 14.h),
          Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.black,
                size: 20,
              ))
        ],
      ),
    );
  }
}
