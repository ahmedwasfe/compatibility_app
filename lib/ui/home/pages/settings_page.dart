import 'package:compatibility_app/controller/language_controller.dart';
import 'package:compatibility_app/controller/profial_controller.dart';
import 'package:compatibility_app/controller/settings_controller.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  SettingsController _controller = Get.put(SettingsController());
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('settings'.tr),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<ProfileController>(builder: (controller) => Column(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(top: 20.r),
                  alignment: AlignmentDirectional.center,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey.withOpacity(0.4),
                        backgroundImage: NetworkImage(
                          AppHelper.getCurrentUser()!.customerAllowPhoto!.isNotEmpty
                              ? AppHelper.getCurrentUser()!.customerAllowPhoto![0].imageUrl!
                              : Const.defaultUserImage
                        ),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(top: 75, end: 60),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: AppColors.colorpurple,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white, width: 3)),
                        child: InkWell(
                            onTap: () {
                            },
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  margin:
                  EdgeInsetsDirectional.only(start: 8.r, end: 8.r, top: 8.r),
                  child: Column(
                    children: [
                      AppText.medium(text: AppHelper.getCurrentUser()!.fullName!, fontWeight: FontWeight.w600),
                      // AppText.medium(text: AppHelper.getCurrentUser()!.id!.toString(), fontWeight: FontWeight.w600),
                    ],
                  ),
                ),
              ],
            )),
            Container(
              margin:
                  EdgeInsetsDirectional.only(start: 8.r, end: 8.r, top: 8.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.profile);
                    },
                    child: Container(
                      width: 115.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.lightGray9,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            '${Const.images}profial_i.svg',
                            height: 25.h,
                            width: 25.w,
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 9.r),
                            child: AppText.medium(
                                text: 'profile',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.notifications);
                    },
                    child: Container(
                      width: 115.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.lightGray9,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
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
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 9.r),
                            child: AppText.medium(
                                text: 'notifications',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.interestList);
                    },
                    child: Container(
                      width: 115.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.lightGray9,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            '${Const.images}list.svg',
                            height: 25.h,
                            width: 25.w,
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 9.r),
                            child: AppText.medium(
                                text: 'list_interests',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsetsDirectional.only(start: 8.r, end: 8.r, top: 8.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.ignoreList);
                    },
                    child: Container(
                      width: 115.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.lightGray9,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            '${Const.images}Ignore.svg',
                            height: 25.h,
                            width: 25.w,
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 9.r),
                            child: AppText.medium(
                                text: 'ignore_list',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.interestList);
                    },
                    child: Container(
                      width: 115.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.lightGray9,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            '${Const.images}cares.svg',
                            height: 25.h,
                            width: 25.w,
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 9.r),
                            child: AppText.medium(
                                text: 'cares_about_me',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.members);
                    },
                    child: Container(
                      width: 115.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.lightGray9,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            '${Const.images}photos.svg',
                            height: 25.h,
                            width: 25.w,
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 9.r),
                            child: AppText.medium(
                                text: 'members_photo',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsetsDirectional.only(start: 8.r, end: 8.r, top: 8.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.success_stories);
                    },
                    child: Container(
                      width: 115.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.lightGray9,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            '${Const.images}success.svg',
                            height: 25.h,
                            width: 25.w,
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 9.r),
                            child: AppText.medium(
                                text: 'success_stories',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.compatibiltity_card);
                    },
                    child: Container(
                      width: 115.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.lightGray9,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            '${Const.images}compatibility_card.svg',
                            height: 25.h,
                            width: 25.w,
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 9.r),
                            child: AppText.medium(
                                text: 'compatibility_card',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.tawafuq_blog);
                    },
                    child: Container(
                      width: 115.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.lightGray9,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            '${Const.images}tawafuq_blog.svg',
                            height: 25.h,
                            width: 25.w,
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 9.r),
                            child: AppText.medium(
                                text: 'tawafuq_blog',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsetsDirectional.only(start: 8.r, end: 8.r, top: 8.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.call);
                    },
                    child: Container(
                      width: 115.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.lightGray9,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            '${Const.images}call.svg',
                            height: 25.h,
                            width: 25.w,
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 9.r),
                            child: AppText.medium(
                                text: 'call_us',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 115.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.lightGray9,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            '${Const.images}share.svg',
                            height: 25.h,
                            width: 25.w,
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 9.r),
                            child: AppText.medium(
                                text: 'share_app',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.secretPolitics);
                    },
                    child: Container(
                      width: 115.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.lightGray9,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            '${Const.images}plosiy.svg',
                            height: 25.h,
                            width: 25.w,
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 9.r),
                            child: AppText.medium(
                                text: 'confidentiality_policy',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsetsDirectional.only(start: 8.r, end: 8.r, top: 8.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.about);
                    },
                    child: Container(
                      width: 115.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.lightGray9,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            '${Const.images}about.svg',
                            height: 25.h,
                            width: 25.w,
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 9.r),
                            child: AppText.medium(
                                text: 'about_us',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.report_problem);
                    },
                    child: Container(
                      width: 115.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.lightGray9,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            '${Const.images}problem.svg',
                            height: 25.h,
                            width: 25.w,
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 9.r),
                            child: AppText.medium(
                                text: 'report_problem',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.report_problem);
                    },
                    child: Container(
                      width: 115.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.lightGray9,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            '${Const.images}conf.svg',
                            height: 25.h,
                            width: 25.w,
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 9.r),
                            child: AppText.medium(
                                text: 'terms_conditions',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(
                  start: 8.r, end: 8.r, top: 8.r, bottom: 8.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      LanguageController controller = Get.put(LanguageController());
                      controller.showLanguageDialog(context);
                    },
                    child: Container(
                      width: 115.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.lightGray9,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.language_rounded, color: AppColors.colorAppMain),
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 9.r),
                            child: AppText.medium(
                                text: 'language',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _controller.showAccountBottomSheet(context,
                          title: 'delete_account',
                          message: 'delete_account_',
                          type: Const.KEY_SHEET_DELETE_ACCOUNT);
                    },
                    child: Container(
                      width: 115.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1.w,
                            color: AppColors.lightGray9,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            '${Const.images}delete_account.svg',
                            height: 25.h,
                            width: 25.w,
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(top: 9.r),
                            child: AppText.medium(
                                text: 'delete_account',
                                fontWeight: FontWeight.w500,
                                fontSize: 12.r),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => _controller.showAccountBottomSheet(context,
                        title: 'logout',
                        message: 'sure_logout',
                        type: Const.KEY_SHEET_LOGOUT),
                    child: GestureDetector(
                      child: Container(
                        width: 115.w,
                        height: 90.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                              width: 1.w,
                              color: AppColors.lightGray9,
                            )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              '${Const.images}logout.svg',
                              height: 25.h,
                              width: 25.w,
                            ),
                            Container(
                              margin: EdgeInsetsDirectional.only(top: 9.r),
                              child: AppText.medium(
                                  text: 'log_out',
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.lightred2,
                                  fontSize: 12.r),
                            ),
                          ],
                        ),
                      ),
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
