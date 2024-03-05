import 'package:compatibility_app/api/firebase_api.dart';
import 'package:compatibility_app/model/chat/conversation.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:compatibility_app/widget/chat/conversation_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {

  List<Conversation> listConversations = [];
  List<Conversation> _listSearch = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    FirebaseAPIs.getSelfInfo();

    // TODO for updating user active status according to lifecycle events
    // resume ==> active or online
    // pause ==> inactive or offline
    // SystemChannels.lifecycle.setMessageHandler((message) {
    //   log('Message: $message');
    //   if(message.toString().contains('resume'))
    //     FirebaseAPIs.updateActiveStatus(true);
    //
    //   if(message.toString().contains('pause'))
    //     FirebaseAPIs.updateActiveStatus(false);
    //
    //   return Future.value(message);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // TODO for hiding keyboard when a tap is detected on search
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        // TODO if search on & key button is pressed then close search
        // TODO else simple close current screen on back button click
        onWillPop: () {
          if(_isSearching){
            setState(() {
              _isSearching = !_isSearching;
            });
            return Future.value(false);
          }else {
            return Future.value(true);
          }

        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 80.h,
            backgroundColor: Colors.white,
            elevation: 0,
            title: _isSearching
                ? TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search...',
              ),
              autofocus: true,
              style: TextStyle(
                fontSize: 16.sp,
                letterSpacing: 0.5,
              ),
              onChanged: (val) {
                _listSearch.clear();
                for(var search in listConversations){
                  if(search.name!.toLowerCase().contains(val.toLowerCase())
                      || search.lastMessage!.toLowerCase().contains(val.toLowerCase())
                      || search.email!.toLowerCase().contains(val.toLowerCase())){
                    _listSearch.add(search);
                  }
                  setState(() {
                    _listSearch;
                  });
                }
              },
            )
                : AppText.medium(
                text: 'messages',
                color: AppColors.colorAppMain,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700),
            centerTitle: true,
            // leading: InkWell(
            //     child: SvgPicture.asset('${Const.icons}icon_back.svg', color: AppColors.colorAppMain, fit: BoxFit.scaleDown),
            //     onTap: () => Navigator.pop(context)),
            actions: [
              IconButton(onPressed: () {
                setState(() {
                  _isSearching = !_isSearching;
                });
              }, icon: Icon(_isSearching ? CupertinoIcons.clear_circled_solid : Icons.search_rounded, color: Colors.black,)),
              // IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded, color: Colors.black,))
            ],
          ),
          body: StreamBuilder(
            stream: FirebaseAPIs.getAllUsers(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return AppWidgets.CustomAnimationProgress();

                case ConnectionState.active:
                case ConnectionState.done:
                  final data = snapshot.data?.docs;
                  listConversations = data?.map((conv) => Conversation.fromJson(conv.data())).toList() ?? [];
                  // log('CONVERSATIONS: ${jsonEncode(listConversations)}');
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _isSearching ? _listSearch.length : listConversations.length,
                      itemBuilder: (_, index) => ConversationItem(conversation: _isSearching ? _listSearch[index] : listConversations[index]));
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildMessageItem() => GestureDetector(
    child: Container(
      alignment: AlignmentDirectional.center,
      padding: EdgeInsetsDirectional.only(start: 8.r, end: 8.r, top: 12.r, bottom: 12.r),
      margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 10.r),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(12.r),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 4, offset: const Offset(1.0, 1.0)),
            // BoxShadow(blurRadius: 1, color: Colors.grey.withOpacity(0.1), offset: const Offset(1.0, 1.0))
          ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 60.w, height: 60.h,
              child: CircleCachedImage(imageUrl: Const.sliderImage)),
          Container(
            margin: EdgeInsetsDirectional.only(start: 14.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.medium(text: 'khalil hothot'),
                AppText.medium(text: 'Hello')
              ],
            ),
          ),
          Spacer(),
          Container(
            width: 20.w,
            height: 20.h,
            alignment: AlignmentDirectional.center,
            margin: EdgeInsetsDirectional.only(end: 20.r),
            decoration: BoxDecoration(
                color: AppColors.colorpurple,
                borderRadius: BorderRadiusDirectional.circular(50.r),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.4), blurRadius: 4, offset: const Offset(1.0, 1.0)),
                ]
            ),
            child: AppText.medium(text: '8', color: Colors.white),
          )
        ],
      ),
    ),
    onTap: () => Get.toNamed(Routes.chat),
  );
}
