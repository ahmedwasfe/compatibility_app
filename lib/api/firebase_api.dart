import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:compatibility_app/model/chat/conversation.dart';
import 'package:compatibility_app/model/chat/message.dart';
import 'package:compatibility_app/model/user.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:compatibility_app/utils/preferences_manager.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';

// TODO NOTIFICATIONS
Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('NOTI TITLE: ${message.notification?.title}');
  print('NOTI BODY: ${message.notification?.body}');
  print('NOTI PAYLOAD: ${jsonEncode(message.data)}');
}

class FirebaseAPIs {
  // TODO FCM TOKEN
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> getFCMToken() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken().then((token) {
      if (token != null) {
        print('FIREBASE_TOKEN: ${token}');
        PreferencesManager.saveUserToken(
            key: Const.KEY_FCM_TOKEN, token: token);
      }
    });
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  // TODO for accessing cloud firestore database
  static FirebaseFirestore mFirestore = FirebaseFirestore.instance;

  // for accessing firebase storage
  static FirebaseStorage mStorage = FirebaseStorage.instance;

  // static User get user => mAuth.currentUser!;
  static User currentUser = AppHelper.getCurrentUser()!;

  static late Conversation me;

  // TODO for checking id user exists or not ?
  static Future<bool> userExist() async {
    return (await mFirestore
            .collection(Const.KEY_COLLECTION_CONVERSATIONS)
            .doc(currentUser.uuid!)
            .get())
        .exists;
  }

  static Future<void> getSelfInfo() async {
    await mFirestore
        .collection(Const.KEY_COLLECTION_CONVERSATIONS)
        .doc(currentUser.uuid)
        .get()
        .then((user) async {
      if (user.exists) {
        me = Conversation.fromJson(user.data()!);
        print('Current User: ${jsonEncode(me)}');
      } else {
        await createConversation().then((value) => getSelfInfo());
      }
    });
  }

  // TODO Create new conversation
  static Future<void> createConversation() async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    Conversation conversation = Conversation(
      userId: currentUser.id.toString(),
      uuid: currentUser.uuid,
      name: currentUser.fullName,
      image: currentUser.customerAllowPhoto!.isNotEmpty
          ? currentUser.customerAllowPhoto![0].imageUrl
          : Const.defaultUserImage,
      email: currentUser.email,
      phone: currentUser.mobile,
      userType: currentUser.type,
      lastMessage: "Hey, I'm using Tawwafq",
      createAt: time,
      isOnline: false,
      isChat: false,
      lastActive: time,
      pushToken: PreferencesManager.getAppData(key: Const.KEY_FCM_TOKEN),
    );
    return await mFirestore
        .collection(Const.KEY_COLLECTION_CONVERSATIONS)
        .doc(currentUser.uuid)
        .set(conversation.toJson());
  }

  // TODO
// TODO update online or last active status of user
  static Future<void> updateIsChat(bool isChat, String userUUID) async {
    var activeIsChat = {
      'is_chat': isChat,
    };
    mFirestore
        .collection(Const.KEY_COLLECTION_CONVERSATIONS)
        .doc(userUUID)
        .update(activeIsChat);
  }

  // TODO for getting conversation Id
  static String getConversationId(String id) =>
      currentUser.uuid.hashCode <= id.hashCode
          ? '${currentUser.uuid}_$id'
          : '${id}_${currentUser.uuid}';

  // TODO get all users without current user
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
    return mFirestore
        .collection(Const.KEY_COLLECTION_CONVERSATIONS)
        .where('uuid', isNotEqualTo: currentUser.uuid)
        .where('is_chat', isEqualTo: true)
        // .where('last_active')
        .snapshots();
  }

  // TODO getting specific user info
  static Stream<QuerySnapshot<Map<String, dynamic>>> getUserInfo(
      Conversation conversation) {
    return mFirestore
        .collection(Const.KEY_COLLECTION_CONVERSATIONS)
        .where('uuid', isEqualTo: conversation.uuid)
        .snapshots();
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String uuid) {
    return mFirestore
        .collection(Const.KEY_COLLECTION_CONVERSATIONS)
        .doc(uuid)
        .get();
  }

  // TODO update online or last active status of user
  static Future<void> updateActiveStatus(bool isOnline) async {
    final lastActive = DateTime.now().millisecondsSinceEpoch.toString();
    var activeStatus = {'is_online': isOnline, 'last_active': lastActive};
    mFirestore
        .collection(Const.KEY_COLLECTION_CONVERSATIONS)
        .doc(currentUser.uuid)
        .update(activeStatus);
  }

  // TODO ******** Chat Screen Related APIs *********

  // TODO for get all messages of specific conversation from firestore database
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(
      Conversation conversation) {
    return mFirestore
        .collection(
            '${Const.KEY_COLLECTION_CHATS}/${getConversationId(conversation.uuid!)}/${Const.KEY_COLLECTION_MESSAGES}/')
        .orderBy('sent', descending: true)
        .snapshots();
  }

  // TODO for send messages
  static Future<void> sendMessage(
      Conversation conversation, String msg, MessageType messageType) async {
    // message sending time (also used as id)
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    // message to send
    Message message = Message(
        fromId: currentUser.uuid,
        toId: conversation.uuid,
        toImage: conversation.image,
        message: msg,
        read: '',
        type: messageType,
        sent: time);

    final ref = mFirestore.collection(
        '${Const.KEY_COLLECTION_CHATS}/${getConversationId(conversation.uuid!)}/${Const.KEY_COLLECTION_MESSAGES}/');
    await ref.doc(time).set(message.toJson());
  }

  // TODO update read status of message
  static Future<void> updateMessageReadStatus(Message message) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    var readMessage = {'read': time};

    mFirestore
        .collection(
            '${Const.KEY_COLLECTION_CHATS}/${getConversationId(message.fromId!)}/${Const.KEY_COLLECTION_MESSAGES}/')
        .doc(message.sent!)
        .update(readMessage);
  }

  // TODO get only last message of a Specific chat
  static Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(
      Conversation conversation) {
    return mFirestore
        .collection(
            '${Const.KEY_COLLECTION_CHATS}/${getConversationId(conversation.uuid!)}/${Const.KEY_COLLECTION_MESSAGES}/')
        .orderBy('sent', descending: true)
        .limit(1)
        .snapshots();
  }

  // TODO Send chat image
  static Future<void> sendImageMessage(
      Conversation conversation, File file) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    // getting image file extension
    final ext = file.path.split('.').last;

    // storage image file ref with path
    final ref = mStorage.ref().child(
        '${Const.KEY_COLLECTION_IMAGES}/${getConversationId(conversation.uuid!)}/${time}.$ext');

    // uploading image
    await ref
        .putFile(file, SettableMetadata(contentType: 'image/$ext'))
        .then((p0) {
      log('Data Transferred: ${p0.bytesTransferred / 1000} KB');
    });

    // update image in firestore database
    final imageUri = await ref.getDownloadURL();
    await sendMessage(conversation, imageUri, MessageType.IMAGE);
  }
}
