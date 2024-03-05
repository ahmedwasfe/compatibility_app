import 'package:compatibility_app/controller/interest_list_controller.dart';
import 'package:compatibility_app/model/user.dart';
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

class InterestListScreen extends StatelessWidget {
  final _controller = Get.put(InterestListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.medium(
            text: 'list_interests',
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
          Container(
            alignment: AlignmentDirectional.centerEnd,
            margin: EdgeInsetsDirectional.only(end: 20.r),
            child: Stack(
              // alignment: AlignmentDirectional.topEnd,
              children: [
                SvgPicture.asset(
                    width: 28.w,
                    height: 28.h,
                    '${Const.images}notfiactions.svg'),
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
        ],
      ),
      body: FutureBuilder(
        future: _controller.getUsersInterest(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
           if(_controller.listUsers.isNotEmpty){
             return Column(
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
                             text: '(${_controller.listUsers.length})'.tr,
                             fontWeight: FontWeight.w600,
                             fontSize: 16.h),
                       ],
                     )),
                 Expanded(
                   child: ListView.separated(
                       physics: BouncingScrollPhysics(),
                       shrinkWrap: true,
                       itemCount: _controller.listUsers.length,
                       itemBuilder: (context, index) => buildInterestItem(_controller.listUsers[index]),
                       separatorBuilder: (context, index) {
                         return SizedBox(
                           height: 1.h,
                         );
                       }),
                 )
               ],
             );
           }else {
             return Container(
               padding: EdgeInsetsDirectional.only(start: 8.r, end: 8.r),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   SvgPicture.asset('${Const.images}no_memebers_interest.svg'),
                   AppText.medium(text: 'no_memebers_interest')
                 ],
               ),
             );
           }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return AppWidgets.CustomAnimationProgress();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget buildInterestItem(User user) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.profileMember),
      child: Container(
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
                  CircleCachedImage(imageUrl: user.customerAllowPhoto!.isNotEmpty ? user.customerAllowPhoto![0].imageUrl! : Const.defaultUserImage),
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
                          text: user.fullName!,
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
                            text: user.age!,
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
                            text: user.nationality!.nationality!,
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
      ),
    );
  }
}
