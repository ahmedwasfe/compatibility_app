import 'package:compatibility_app/controller/members_controller.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
//الملف الشخصي لكل عضو
class ProfialMembersScreen extends StatelessWidget {

MembersController _controller=Get.put(MembersController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.medium(
            text: 'notfiactions',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        actions: [

       GetBuilder<MembersController>(  builder: (controller) =>  PopupMenuButton(
         onSelected: (value) {
           // your logic
         },
         itemBuilder: (BuildContext bc) {
           return const [
             PopupMenuItem(
               child: Row(
                 children: [

                 ],
               ),
               value: '/hello',
             ),
             PopupMenuItem(
               child: Row(
                 children: [

                 ],
               ),
               value: '/about',
             ),
             PopupMenuItem(
               child: Row(
                 children: [

                 ],
               ),
               value: '/contact',
             )
           ];
         },
       ))
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [


  Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

  Container(
    alignment: AlignmentDirectional.center,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CircleAvatar(
              radius: 45.h,
              backgroundImage: AssetImage('${Const.images}profial.jpg'),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(end: 50.r,top: 75.r),
              alignment: AlignmentDirectional.topEnd,
              width: 18.w
              ,
              height: 18.h,
              decoration: BoxDecoration(
                color: AppColors.lightgreen2,
                borderRadius: BorderRadius.circular(15.h),
                border: Border.all(
                  width: 2.w,
                  color: Colors.white
                )
              ),
            ),
          ],
        ),
        Container(
          child: AppText.larg(text: 'خليل عماد هتهت',color: Colors.black),
        ),
        Container(
          child: AppText.larg(text: 'متزوج - 31 سنة',color:AppColors.lightgray6,fontSize: 14.h),
        ),
      ],
    ),
  ),
     ],
  ),


          ],
        ),
      ),
    );
  }
}
