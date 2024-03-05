import 'package:compatibility_app/controller/settings_controller.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
//نبذه شاشة
class AboutUsScreen extends StatelessWidget {
  SettingsController controller = Get.put(SettingsController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.medium(
            text: 'about_us',
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
          Stack(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.notifications);
                },
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

      body: FutureBuilder(
        future: controller.getAppSettings(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(controller.about != null){
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

    Container(
      margin: EdgeInsetsDirectional.only(start:16.r ,end:16.r ,top: 15.r,bottom: 20.r
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: AppColors.lightGray6,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //TODO Text
          Container(
            margin: EdgeInsetsDirectional.only(start: 16.r, top: 16),
            alignment: AlignmentDirectional.topStart,
            child: AppText.medium(text:'${controller.about.title}',
                fontSize: 14,
                height: 1.4,
                fontWeight: FontWeight.w400,
                color: AppColors.colorpurple),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Html(
              data: controller.about.description,
              // tagsList: Html.tags..addAll(["bird", "flutter"]),
              style: {"p": Style(
                color: Colors.black,
                fontSize: FontSize(16),
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.start,
                maxLines: 2,
                backgroundColor: Colors.white,)},
            ),
          ),


          SizedBox(height: 20.h,),
        ],
      ),
    ),


                  ],
                ),
              );
            }else{
              return Container(
                alignment: AlignmentDirectional.center,
                child: Column(
                  children: [
                    AppText.medium(text: 'no_infromation'.tr,color: AppColors.colorpurple,)
                  ],
                ),
              );
            }
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return AppWidgets.CustomAnimationProgress();
          }else{
            return Container();
          }
        },
      ),
    );
  }
}



