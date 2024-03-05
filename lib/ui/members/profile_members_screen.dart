import 'dart:convert';
import 'dart:developer';

import 'package:compatibility_app/api/firebase_api.dart';
import 'package:compatibility_app/controller/members_controller.dart';
import 'package:compatibility_app/model/chat/conversation.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/ui/chat/chat_screen.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

//الملف الشخصي لكل عضو
class ProfileMemeberScreen extends StatelessWidget {
  int? userId;

  ProfileMemeberScreen({this.userId});

  MembersController _controller = Get.put(MembersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.medium(
            text: '',
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
          GetBuilder<MembersController>(
              builder: (controller) => PopupMenuButton(
                    icon: SvgPicture.asset('${Const.icons}Icon_popup_menu.svg'),
                    onSelected: (value) {
                      // your logic
                    },
                    itemBuilder: (BuildContext bc) {
                      return [
                        // PopupMenuItem(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //     children: [
                        //       AppText.medium(text: 'share'),
                        //       SvgPicture.asset('${Const.icons}icon_share.svg'),
                        //     ],
                        //   ),
                        // ),
                        PopupMenuItem(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AppText.medium(text: 'interest'),
                              SvgPicture.asset(
                                  '${Const.icons}icon_interest.svg'),
                            ],
                          ),
                          onTap: () => _controller.addInterest(userId!),
                        ),
                        PopupMenuItem(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AppText.medium(text: 'ignorance'),
                              SvgPicture.asset('${Const.icons}Icon_ignor.svg'),
                            ],
                          ),
                          onTap: () => _controller.addDeleteIgnore(userId!),
                        ),
                        PopupMenuItem(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AppText.medium(text: 'inform_management'),
                              SvgPicture.asset('${Const.icons}icon_report.svg'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AppText.medium(text: 'sending_message'),
                              SvgPicture.asset('${Const.icons}icon_chat.svg'),
                            ],
                          ),
                          onTap: () async {
                            String otherUserUUID = _controller.listMembers[0].uuid!;
                            String currentUserUUID = AppHelper.getCurrentUser()!.uuid!;
                            log('Other User UUID: $otherUserUUID');
                            log('Current User UUID: $currentUserUUID');
                            FirebaseAPIs.updateIsChat(true, otherUserUUID);
                            FirebaseAPIs.getUserData(otherUserUUID)
                            .then((value) {
                              final data = value.data()!;
                              Conversation chatUser = Conversation.fromJson(data);
                              Get.to(ChatScreen(conversation: chatUser));
                              log('OTHER USER: ${jsonEncode(chatUser)}');
                            });

                            // FirebaseAPIs.updateIsChat(true, currentUserUUID);
                          },
                        ),
                      ];
                    },
                  ))
        ],
      ),
      body: FutureBuilder(
        future: _controller.getMemebers(userId: userId!),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
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
                            Align(
                              alignment: AlignmentDirectional.center,
                              child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  CircleCachedImage(
                                      imageUrl: _controller.listMembers[0]
                                              .customerAllowPhoto!.isNotEmpty
                                          ? _controller.listMembers[0]
                                              .customerAllowPhoto![0].imageUrl!
                                          : Const.defaultUserImage,
                                      radius: 45),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        end: 50.r, top: 75.r),
                                    alignment: AlignmentDirectional.center,
                                    width: 18.w,
                                    height: 18.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.lightgreen2,
                                        borderRadius:
                                            BorderRadius.circular(15.h),
                                        border: Border.all(
                                            width: 2.w, color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: AppText.larg(
                                  text: _controller.listMembers[0].fullName!,
                                  color: Colors.black,
                                  fontSize: 14.h),
                            ),
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: AppText.larg(
                                  text: 'سنة  ${_controller.listMembers[0].age}',
                                  color: AppColors.lightgray6,
                                  fontSize: 12.h),
                            ),
                            Container(
                                margin: EdgeInsetsDirectional.only(
                                    top: 20.r, start: 20.r, end: 20.r),
                                child: Divider(
                                  color: AppColors.grayColorB,
                                )),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsetsDirectional.only(
                                  start: 10.r, end: 10.r, top: 15.r),
                              decoration: BoxDecoration(
                                color: AppColors.lightGray6,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: AlignmentDirectional.topStart,
                                    width: double.infinity,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.grayColor,
                                      borderRadius: BorderRadiusDirectional.only(
                                          topStart: Radius.circular(8.r),
                                          topEnd: Radius.circular(8.r)),
                                    ),
                                    child: Container(
                                      margin: EdgeInsetsDirectional.only(
                                          top: 12.r, start: 14.r),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment:
                                                AlignmentDirectional.topStart,
                                            child: AppText.medium(
                                                text: 'date_registration'.tr,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Container(
                                              margin:
                                                  EdgeInsetsDirectional.only(
                                                      start: 4.r),
                                              child: AppText.medium(
                                                  text: '*',
                                                  color: Colors.red,
                                                  fontSize: 18)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 12.r, start: 12.r),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText.medium(
                                            text: 'nationality'.tr,
                                            fontSize: 12.h,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        AppText.medium(
                                            text: _controller.listMembers[0].nationality!.nationality!,
                                            fontSize: 12.h,
                                            color: AppColors.lightGray15),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 12.r, start: 12.r),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        AppText.medium(
                                            text: 'place'.tr,
                                            fontSize: 12.h,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        AppText.medium(
                                            text: _controller.listMembers[0].nationality!.name!,
                                            fontSize: 12.h,
                                            color: AppColors.lightGray15),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 12.r, start: 12.r),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        AppText.medium(
                                            text: 'marige_type'.tr,
                                            fontSize: 12.h,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        AppText.medium(
                                            text: _controller.listMembers[0].marriageTypeId!.name!,
                                            fontSize: 12.h,
                                            color: AppColors.lightGray15),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 12.r, start: 12.r),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        AppText.medium(
                                            text: 'marige_type'.tr,
                                            fontSize: 12.h,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        AppText.medium(
                                            text: _controller.listMembers[0].marriageTypeId!.name!,
                                            fontSize: 12.h,
                                            color: AppColors.lightGray15),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 12.r, start: 12.r),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        AppText.medium(
                                            text: 'state_type'.tr,
                                            fontSize: 12.h,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        AppText.medium(
                                            text: _controller.listMembers[0].marriageTypeId!.name!,
                                            fontSize: 12.h,
                                            color: AppColors.lightGray15),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 12.r, start: 12.r),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        AppText.medium(
                                            text: 'age'.tr,
                                            fontSize: 12.h,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        AppText.medium(
                                            text: _controller.listMembers[0].age!,
                                            fontSize: 12.h,
                                            color: AppColors.lightGray15),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 12.r, start: 12.r),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        AppText.medium(
                                            text: 'children_num'.tr,
                                            fontSize: 12.h,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        AppText.medium(
                                            text: _controller.listMembers[0].childrenNum!,
                                            fontSize: 12.h,
                                            color: AppColors.lightGray15),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 12.r, start: 12.r),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        AppText.medium(
                                            text: 'width_length'.tr,
                                            fontSize: 12.h,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        AppText.medium(
                                            text: _controller.listMembers[0].weight! + ' / ' + _controller.listMembers[0].height!,
                                            fontSize: 12.h,
                                            color: AppColors.lightGray15),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 12.r, start: 12.r),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        AppText.medium(
                                            text: 'color_skin'.tr,
                                            fontSize: 12.h,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        AppText.medium(
                                            text: _controller.listMembers[0].skin!.name!,
                                            fontSize: 12.h,
                                            color: AppColors.lightGray15),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 12.r, start: 12.r),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        AppText.medium(
                                            text: 'body'.tr,
                                            fontSize: 12.h,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        AppText.medium(
                                            text: _controller.listMembers[0].physique!.name!,
                                            fontSize: 12.h,
                                            color: AppColors.lightGray15),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 12.r, start: 12.r),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        AppText.medium(
                                            text: 'job'.tr,
                                            fontSize: 12.h,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        AppText.medium(
                                            text: _controller.listMembers[0].job!,
                                            fontSize: 12.h,
                                            color: AppColors.lightGray15),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 12.r, start: 12.r),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        AppText.medium(
                                            text: 'educational'.tr,
                                            fontSize: 12.h,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        AppText.medium(
                                            text: _controller.listMembers[0].educational!.name!,
                                            fontSize: 12.h,
                                            color: AppColors.lightGray15),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 12.r, start: 12.r),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        AppText.medium(
                                            text: 'salary'.tr,
                                            fontSize: 12.h,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        AppText.medium(
                                            text: _controller.listMembers[0].financial!.name!,
                                            fontSize: 12.h,
                                            color: AppColors.lightGray15),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 12.r, start: 12.r),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        AppText.medium(
                                            text: 'religious_commitment'.tr,
                                            fontSize: 12.h,
                                            fontWeight: FontWeight.w600),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        AppText.medium(
                                            text: _controller.listMembers[0].religiousCommitment!.name!,
                                            fontSize: 12.h,
                                            color: AppColors.lightGray15),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                padding: EdgeInsetsDirectional.only(
                                    top: 20.r, bottom: 10),
                                alignment: Alignment.center,
                                child: AppWidgets.CustomButton(
                                  text: 'colse'.tr,
                                  click: () {
                                    Navigator.pop(context);
                                  },
                                  height: 47.h,
                                  width: 220.w,
                                  radius: 6.r,
                                )),
                          ],
                        ),
                      ),
                    ],
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
}
