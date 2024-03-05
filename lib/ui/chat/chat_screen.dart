import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:compatibility_app/api/firebase_api.dart';
import 'package:compatibility_app/model/chat/conversation.dart';
import 'package:compatibility_app/model/chat/message.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:compatibility_app/utils/date_util.dart';
import 'package:compatibility_app/utils/preferences_manager.dart';
import 'package:compatibility_app/widget/chat/message_item.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ChatScreen extends StatefulWidget {
  final Conversation? conversation;

  const ChatScreen({super.key, this.conversation});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> _listMessages = [];
  final _messageController = TextEditingController();
  bool _isShowEmoji = false, _isUploading = false, _isTyping = false;

  @override
  void initState() {
    // String uuid = PreferencesManager.getAppData(key: Const.KEY_UUID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: WillPopScope(
          onWillPop: () {
            if (_isShowEmoji) {
              setState(() {
                _isShowEmoji = !_isShowEmoji;
              });
              return Future.value(false);
            } else {
              return Future.value(true);
            }
          },
          child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  elevation: 2,
                  flexibleSpace: _appBar(),
                ),
                body: Column(
                    children: [
                  Expanded(
                      child: StreamBuilder(
                        stream: FirebaseAPIs.getAllMessages(widget.conversation!),
                        builder: (_, snapshot) {
                          switch (snapshot.connectionState){
                            case ConnectionState.waiting:
                            case ConnectionState.none:
                              return Container();

                            case ConnectionState.active:
                            case ConnectionState.done:
                              final data = snapshot.data?.docs;
                              _listMessages = data
                                  ?.map(
                                      (message) => Message.fromJson(message.data()))
                                  .toList() ??
                                  [];
                          // log('MESSAGES: ${jsonEncode(_listMessages)}');

                              return _listMessages.isNotEmpty
                                  ? ListView.builder(
                                  reverse: true,
                                  // padding: EdgeInsets.only(top: mq.height * .01),
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: _listMessages.length,
                                  itemBuilder: (_, index) =>
                                      MessageItem(message: _listMessages[index]))
                                  : Center(child: AppText.medium(text: 'Say Hii! 👋'));
                          }
                        },
                      )),
                  if (_isUploading)
                    Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Padding(
                            padding:
                            const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                            child: AppWidgets.CustomAnimationProgress())),
                  _chatInput(),
                  if (_isShowEmoji)
                    SizedBox(
                      height: 280.h,
                      child: EmojiPicker(
                        textEditingController: _messageController,
                        config: Config(
                            columns: 7,
                            emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0)),
                      ),
                    ),
                ]),
              )),
        ));
  }

  Widget _appBar() => StreamBuilder(
      stream: FirebaseAPIs.getUserInfo(widget.conversation!),
      builder: (_, snapshot) {
        final data = snapshot.data?.docs;
        final chatUser = data?.map((user) => Conversation.fromJson(user.data())).toList() ?? [];
          return Row(
  children: [
    IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: AppColors.colorpurple)),
    Container(
      width: 50.w,
      height: 50.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.r),
        child: CircleCachedImage(
        imageUrl: chatUser.isNotEmpty ? chatUser[0].image! : widget.conversation!.image!, isLoading: false)
      ),
    ),
    Container(
      margin: EdgeInsetsDirectional.only(start: 10.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.medium(text: chatUser.isNotEmpty
              ? chatUser[0].name!
              : widget.conversation!.name!),
          AppText.medium(
              text: chatUser.isNotEmpty
                  ? chatUser[0].isOnline! ? 'Online' : DateUtil.getLastActiveTime(context: context, lastActive: chatUser[0].lastActive!)
                  : DateUtil.getLastActiveTime(context: context, lastActive: widget.conversation!.lastActive!),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400),
        ],
      ),
    )
  ],
);
      });

  Widget _chatInput() => Row(
    children: [
      Expanded(
        child: Card(
          margin: EdgeInsetsDirectional.only(
              start: 10.r, end: 2.r, top: 20.r, bottom: 20.r),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    setState(() => _isShowEmoji = !_isShowEmoji);
                  },
                  icon: const Icon(Icons.emoji_emotions,
                      color: AppColors.colorAppMain)),
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                      hintText: 'type_message'.tr,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: InputBorder.none),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onTap: () {
                    if (_isShowEmoji) {
                      setState(() => _isShowEmoji = !_isShowEmoji);
                    }
                  },
                  onChanged: (world) {
                    setState(() {
                      if(_messageController.text.isNotEmpty){
                        _isTyping = true;
                      }else {
                        _isTyping = false;
                      }
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 5.r, end: 8.r),
                child: GestureDetector(
                    onTap: () {
                      showPickImageSheet();
                    },
                    child: SvgPicture.asset('${Const.icons}icon_attachment.svg')),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 5.r, end: 8.r),
                child: GestureDetector(
                    onTap: () {
                      AppHelper.showToast(message: 'Record Voice');
                    },
                    child: SvgPicture.asset('${Const.icons}icon_mic.svg')),
              ),

            ],
          ),
        ),
      ),
      Container(
        margin: EdgeInsetsDirectional.only(end: 8.r),
        child: FloatingActionButton.small(
            onPressed: () {
              if (_messageController.text.isNotEmpty) {
                FirebaseAPIs.sendMessage(
                    widget.conversation!, _messageController.text, MessageType.TEXT);
                _messageController.clear();
              }
            },
            backgroundColor: AppColors.colorAppMain,
            child: SvgPicture.asset('${Const.icons}icon_send.svg')),
      )
    ],
  );

  void showPickImageSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_) => Container(
          height: 250.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(20.r),
                  topEnd: Radius.circular(20.r)
              )
          ),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 10.h,
                decoration: BoxDecoration(
                    color: AppColors.colorAppMain,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomStart: Radius.circular(50),
                        bottomEnd: Radius.circular(50)
                    )
                ),
              ),
              SizedBox(height: 20.h),
              AppText.medium(text: 'Pick image',
                  fontSize: 20.r,
                  color: AppColors.colorAppMain,
                  fontWeight: FontWeight.w600),
              Container(
                margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r, top: 40.r),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          width: 80,
                          height: 100,
                          margin: EdgeInsetsDirectional.only(start: 40.r, end: 40.r, top: 10.r),
                          decoration: BoxDecoration(
                              color: AppColors.colorAppMain.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20.r)
                          ),
                          alignment: Alignment.center,
                          child: Image.asset(
                              width: 80.w,
                              height: 80.h,
                              '${Const.images}add_image.png'),
                        ),
                        onTap: () {
                          requestStoragePermission(false);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          width: 80,
                          height: 100,
                          margin: EdgeInsetsDirectional.only(start: 40.r, end: 40.r, top: 10.r),
                          decoration: BoxDecoration(
                              color: AppColors.colorAppMain.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20.r)
                          ),
                          alignment: Alignment.center,
                          child: Image.asset(
                              width: 80.w,
                              height: 80.h,
                              '${Const.images}camera.png'),
                        ),
                        onTap: () {
                          requestStoragePermission(true);
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void requestStoragePermission(bool isCamera) async {
    if (await Permission.storage.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [isCamera ? Permission.camera : Permission.storage,].request();
      isCamera ? pickImageFromCamera() : pickImageFromGallary();
    } else {
      isCamera ? pickImageFromCamera() : pickImageFromGallary();
    }
  }

  void pickImageFromGallary() async {
    final picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage(imageQuality: 70);
    for(var i in images){
      log('IMAGE: ${i.path}');
      setState(() => _isUploading = true);
      await FirebaseAPIs.sendImageMessage(widget.conversation!, File(i.path));
      setState(() => _isUploading = false);
    }
  }

  void pickImageFromCamera() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(
        source: ImageSource.camera, imageQuality: 70);
    if (image != null) {
      log('IMAGE: ${image.path}');
      setState(() => _isUploading = true);
      await FirebaseAPIs.sendImageMessage(widget.conversation!, File(image.path));
      setState(() => _isUploading = false);
    }
  }
}