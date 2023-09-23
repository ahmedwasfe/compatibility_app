

import 'package:compatibility_app/model/home/members.dart';
import 'package:get/get.dart';

import '../model/home/members_filtered.dart';

class MembersController extends GetxController{
  int tabIndex = 0;
//فلترت الاعضاء
  RxString selectedMembersFiltered = ''.obs;

  bool isChecked = false;


//فلترت الاعضاء

  List<MembersFiltered> listFilteredType = [
    MembersFiltered(isSelected: false ,title: 'online'),
    MembersFiltered(isSelected: false , title: 'visited'),
    MembersFiltered(isSelected: false , title: 'new_members'),
    MembersFiltered(isSelected: false , title: 'distinguished_members'),
    MembersFiltered(isSelected: false , title: 'health_conditions'),
    MembersFiltered(isSelected: false , title: 'automated_finder'),
  ];





  List<Members> listmembers = [
    Members(title: 'all'.tr, isSelected: true),
    Members(title: 'male'.tr, isSelected: false),
    Members(title: 'females'.tr, isSelected: false),

  ];


}