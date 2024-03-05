

import 'package:compatibility_app/api/api_requestes.dart';
import 'package:compatibility_app/model/filter_type.dart';
import 'package:compatibility_app/model/home/members.dart';
import 'package:compatibility_app/model/member/members.dart';
import 'package:compatibility_app/model/settings/countries.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:get/get.dart';

import '../model/home/members_filtered.dart';

class MembersController extends GetxController{
  int tabIndex = 0;
//فلترت الاعضاء
  RxString selectedMembersFiltered = ''.obs;
  String selectedGender = '';
  RxString selectedCountry_ = ''.obs;
  int selectedCountry = 0;

  bool isChecked = false;

  List<MemeberData> listMembers = [];
  List<CountryData> listCountries = [];

//فلترت الاعضاء

  List<FilterType> listFilteredType = [
    FilterType(title: 'online'.tr, value: Const.KEY_Memeber_ONLINE),
    FilterType(title: 'visited'.tr, value: Const.KEY_Memeber_Visit_Profile),
    FilterType(title: 'new_members'.tr, value: Const.KEY_Memeber_NEW),
  ];

  List<Members> listGenderType = [
    Members(title: 'all'.tr, isSelected: true, value: 'all'),
    Members(title: 'male'.tr, isSelected: false, value: 'husband'),
    Members(title: 'females'.tr, isSelected: false, value: 'wife'),
  ];

  @override
  void dispose() {
    selectedMembersFiltered = ''.obs;
    selectedGender = 'all';
    selectedCountry = 0;
    selectedCountry_ = ''.obs;
    super.dispose();
  }


  Future<void> getMemebers({int? userId}) async {
    await ApiRequestes.getMemebers(userId: userId??0, type: selectedMembersFiltered.value, countryId: selectedCountry, gender: selectedGender)
        .then((value) {
          if(value != null) {
            listMembers.clear();
            listMembers.addAll(value.result!.users!);
            update();
          }
    });
    update();
  }

  Future<void> getCountries() async {
    await ApiRequestes.getCountries()
        .then((value) {
      if(value != null){
        listCountries.clear();
        listCountries.addAll(value.result!.countries!);
      }
    });
  }

  void addDeleteIgnore(int userId) {
    ApiRequestes.addDeleteIgnore(userId: userId)
        .then((value) {
          if(value != null){
            AppHelper.showToast(message: value.msg!);
          }
    });
  }

  void addInterest(int userId) {
    ApiRequestes.addInterest(userId: userId)
        .then((value) {
      if(value != null){
        AppHelper.showToast(message: value.msg!);
      }
    });
  }
}