
import 'package:compatibility_app/api/firebase_api.dart';
import 'package:compatibility_app/model/chat/conversation.dart';
import 'package:compatibility_app/model/chat/message.dart';
import 'package:compatibility_app/ui/chat/chat_screen.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:compatibility_app/utils/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConversationItem extends StatefulWidget {

  late Conversation conversation;
  ConversationItem({super.key, required this.conversation});

  @override
  State<ConversationItem> createState() => _ConversationItemState();
}

class _ConversationItemState extends State<ConversationItem> {

  // TODO last message info (if null -> no message)
  Message? _message;

  @override
  Widget build(BuildContext context) {
    return buildConversationsItem(widget.conversation);
  }

  Widget buildConversationsItem(Conversation conversation) => InkWell(
    child: StreamBuilder(
      stream: FirebaseAPIs.getLastMessage(conversation),
      builder: (context, snapshot) {
        final data = snapshot.data?.docs;
        final _messages = data?.map((e) => Message.fromJson(e.data())).toList() ?? [];
        if(_messages.isNotEmpty) {
          _message = _messages[0];
        }
        return Container(
          width: double.infinity,
          height: 80,
          margin: EdgeInsetsDirectional.only(start: 2.r, end: 10.r, top: 4.r, bottom: 4.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(50.r)
                ),
                child: CachedImage(
                    height: 100.h,
                    width: 100.w,
                    imageUrl: conversation.image!, isLoading: false, errorImage: '${Const.icons}logo_com.svg'),
              ),
              // SvgPicture.asset('${Const.icons}icon_inbox_color.svg'),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.medium(
                        text: conversation.name!,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.colorTextSub1,
                        textAlign: TextAlign.start,
                        maxline: 3),
                    AppText.medium(
                        text: _message != null ? _message!.type == MessageType.TEXT ? _message!.message! : 'image' : conversation.lastMessage!,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.colorTextSub1,
                        textAlign: TextAlign.start,
                        maxline: 3),
                  ],
                ),
              ),
              Container(
                child: _message == null
                    ? Container()
                    : _message!.read!.isEmpty && _message!.fromId != FirebaseAPIs.currentUser.uuid
                    ? Container(
                   width: 10.w,
                   height: 10.h,
                   margin: EdgeInsetsDirectional.only(top: 10.r),
                   decoration: BoxDecoration(
                       color: Colors.green.withOpacity(0.8),
                       borderRadius: BorderRadiusDirectional.circular(20.r)
                   ),
                 )
                    : AppText.medium(
                  text: DateUtil.getLastMessageTime(context: context, time: _message!.sent!),
                  color: AppColors.colorTextSub1,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        );
      },
    ),
    onTap: () => Get.to(ChatScreen(conversation: conversation)),
  );
}
