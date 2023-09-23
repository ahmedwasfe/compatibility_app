import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';
class ExcellencePackageScreen extends StatelessWidget {
  const ExcellencePackageScreen({Key? key}) : super(key: key);

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
                  color: AppColors.lightred,
                ),
                child: AppText.medium(
                    text: '8', color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Container(
              margin: EdgeInsetsDirectional.only(top: 16.r,end: 16.r,start: 16.r),
              width:double.infinity,
              height: 160.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.lightGray6
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Container(
                    margin: EdgeInsetsDirectional.only(top: 20.r,end: 16.r,start: 16.r),
                    child: AppText.medium(text: 'subscribe'.tr,fontSize: 14.h,fontWeight: FontWeight.w400),
                  ),

                  Container(
                    margin: EdgeInsetsDirectional.only(start: 10.r,end: 10.r,top: 20.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.center,
                          width:160.w,
                          height: 35.h.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color:Colors.white,
                            border: Border.all(
                              color: AppColors.colorpurple,
                              width: 1.w

                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.medium(text: '+966 555 555 555',color: AppColors.colorpurple,),
                              SizedBox(width: 5.w,),
                              Icon(Icons.wifi_calling_3_rounded,color: AppColors.colorpurple,)
                            ],
                          )
                        ),
                        Container(
                          alignment: AlignmentDirectional.center,
                          width:160.w,
                          height: 35.h.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color:Colors.white,
                            border: Border.all(
                              color: AppColors.colorpurple,
                              width: 1.w

                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.medium(text: 'send',color: AppColors.colorpurple,),
                              SizedBox(width: 5.w,),
                              Icon(Icons.chat,color: AppColors.colorpurple,)
                            ],
                          )
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
              height: 150.h,
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
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8.r),
                        bottomLeft: Radius.circular(8.r),
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
                              text: '*', color: AppColors.lightred, fontSize: 20),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [

                       AppText.medium(text: 'pakege',color: AppColors.colorpurple,fontWeight: FontWeight.w400,
                           fontSize: 14.h),
                       SizedBox(width: 5.w
                         ,),
                       AppText.medium(text: 'bundle_services',color:Colors.black,fontWeight: FontWeight.w400,
                           fontSize: 14.h),
                     ],
                   ),



                        AppText.medium(text: 'increase',color:Colors.black,fontWeight: FontWeight.w400,
                            fontSize: 14.h),
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
              height: 150.h,
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
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8.r),
                        bottomLeft: Radius.circular(8.r),
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
                              text: '*', color: AppColors.lightred, fontSize: 20),
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

              Expanded(
                child: ListView.separated(itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsetsDirectional.only(start: 10.r,end: 10.r,top: 0.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.check,color: AppColors.colorpurple,),
                        SizedBox(width: 5.w,),
                        AppText.medium(text: 'الاشتراك ',color: AppColors.lightGray3,fontSize: 14.h),
                        AppText.medium(text: ' شهر واحد',color: Colors.black,fontSize: 14.h),
                        SizedBox(width: 50.w,),
                        AppText.medium(text: '255 ر.س',color: Colors.black,fontSize: 14.h),
                        Spacer(),
                        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward,color: Colors.black,size: 20,))
                      ],
                    ),
                  );
                }, separatorBuilder: (context,index){
                  return SizedBox(height: 0.h,);
                }, itemCount: 20),
              )
                ],
              ),
            ),



            Container(
              margin:
              EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 20.r),
              width: double.infinity,
              height: 100.h,
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
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8.r),
                        bottomLeft: Radius.circular(8.r),
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
                              text: '*', color: AppColors.lightred, fontSize: 20),
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
  margin: EdgeInsetsDirectional.only(top: 10),
  child:   Row(

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

        child:Image.asset('${Const.images}payment_inst.png',fit: BoxFit.scaleDown,width: double.infinity,height: double.infinity,),),

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

        child:Image.asset('${Const.images}payment_m.png',fit: BoxFit.scaleDown,width: double.infinity,height: double.infinity,),),
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

        child:Image.asset('${Const.images}payment_visa.png',fit: BoxFit.scaleDown,width: double.infinity,height: double.infinity,),),

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

        child:Image.asset('${Const.images}paymentk.png',fit: BoxFit.scaleDown,width: double.infinity,height: double.infinity,),),





    ],

  ),
),                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
  Widget ListPrice(){

    return   Container(
      margin: EdgeInsetsDirectional.only(start: 10.r,end: 10.r,top: 0.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.check,color: AppColors.colorpurple,),
          SizedBox(width: 5.w,),
          AppText.medium(text: 'الاشتراك ',color: AppColors.lightGray3,fontSize: 14.h),
          AppText.medium(text: ' شهر واحد',color: Colors.black,fontSize: 14.h),
          SizedBox(width: 50.w,),
          AppText.medium(text: '255 ر.س',color: Colors.black,fontSize: 14.h),
          Spacer(),
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward,color: Colors.black,size: 20,))
        ],
      ),
    );
  }
}
