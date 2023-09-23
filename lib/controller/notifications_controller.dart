

import 'package:compatibility_app/model/home/members.dart';
import 'package:compatibility_app/model/notifications/notifications_type.dart';
import 'package:get/get.dart';

import '../model/home/members_filtered.dart';

class NotificationsController extends GetxController{

//فلترت الاعضاء
  RxString selectedNotificationsType = ''.obs;

  bool isChecked = false;


//فلترت الاعضاء

  List<NotificationsType> listNotificationsType = [
    NotificationsType(isSelected: false ,title: 'all'),
    NotificationsType(isSelected: false ,title: 'management'),
    NotificationsType(isSelected: false , title: 'cares_about'),
    NotificationsType(isSelected: false , title: 'visited'),
    NotificationsType(isSelected: false , title: 'ignore'),
    NotificationsType(isSelected: false , title: 'deleted_ignore_list'),
    NotificationsType(isSelected: false , title: 'photo'),
  ];








}