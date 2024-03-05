

import 'package:compatibility_app/api/firebase_api.dart';
import 'package:compatibility_app/model/chat/message.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageItem extends StatefulWidget {

  const MessageItem({super.key, required this.message});
  final Message message;

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {

  @override
  Widget build(BuildContext context) {
    // log("UUID: ${PreferencesManager.getAppData(key: Const.KEY_UUID)}");
    // bool isMe = FirebaseAPIs.currentUser.uuid == widget.message.fromId;
    bool isMe = AppHelper.getCurrentUser()!.uuid != widget.message.fromId;
    // log("isMe: $isMe");
    return InkWell(
        onLongPress: () {},
        child: isMe ? _senderMessage() : _reciverMessage());
  }

  // TODO Sender or another user message
  Widget _reciverMessage() {
    // update last read message if sender and receiver are different
    if(widget.message.read!.isEmpty){
      FirebaseAPIs.updateMessageReadStatus(widget.message);
      // log('message read update');
    }
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(widget.message.type == MessageType.IMAGE ? 10.r : 16.r),
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: AppColors.colorpurple,
                // border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24.r),
                    bottomRight: Radius.circular(24.r),
                    bottomLeft: Radius.circular(24.r))
            ),
            child: widget.message.type == MessageType.TEXT ? AppText.medium(text: widget.message.message!,
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                maxline: 8)
                : ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedImage(imageUrl: widget.message.message!,
                  isLoading: true,)),
          ),
        ),
        // const Spacer(),
        Padding(
          padding: EdgeInsetsDirectional.only(top: 20.r, end: 20.r),
          child: AppText.medium(text: DateUtil.getFormattedTime(context: context, time: widget.message.sent!), fontSize: 13.sp),
        )
      ],
    );
  }

  Widget _senderMessage() => Row(
    // crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          const SizedBox(width: 16),
          // double tick blue icon for message read
          if(widget.message.read!.isNotEmpty)
            const Icon(Icons.done_all_rounded, color: Colors.blue, size: 16),
          const SizedBox(width: 2),
          AppText.medium(text: DateUtil.getFormattedTime(context: context, time: widget.message.sent!), fontSize: 13.sp),
        ],
      ),
      Flexible(
        child: Container(
          padding: EdgeInsets.all(widget.message.type == MessageType.IMAGE ? 10.r : 16.r),
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 16,
              vertical: 10),
          decoration: BoxDecoration(
              color: AppColors.grayColor,
              // border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                  bottomLeft: Radius.circular(24.r))
          ),
          child: widget.message.type == MessageType.TEXT ? AppText.medium(text: widget.message.message!,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              maxline: 8)
              : ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedImage(imageUrl: widget.message.message!,
                  progressColor: Colors.white,
                  isLoading: true)),
        ),
      ),
    ],
  );
}