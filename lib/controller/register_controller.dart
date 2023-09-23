import 'package:compatibility_app/model/auth/register/account_status_type.dart';
import 'package:compatibility_app/model/auth/register/age_type.dart';
import 'package:compatibility_app/model/auth/register/childern_type.dart';
import 'package:compatibility_app/model/auth/register/city_type.dart';
import 'package:compatibility_app/model/auth/register/commitment_type.dart';
import 'package:compatibility_app/model/auth/register/country_type.dart';
import 'package:compatibility_app/model/auth/register/education_field_type.dart';
import 'package:compatibility_app/model/auth/register/educational_type.dart';
import 'package:compatibility_app/model/auth/register/financial_status_type.dart';
import 'package:compatibility_app/model/auth/register/higth_type.dart';
import 'package:compatibility_app/model/auth/register/kg_type.dart';
import 'package:compatibility_app/model/auth/register/marriage_type.dart';
import 'package:compatibility_app/model/auth/register/prayer_type.dart';
import 'package:compatibility_app/model/auth/register/skin_type.dart';
import 'package:compatibility_app/model/auth/register/smoking_type.dart';
import 'package:compatibility_app/model/auth/register/structure_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/auth/register/beard_type.dart';
import '../model/auth/register/nationality_type.dart';

class RegisterController extends GetxController{
  RxBool isLoading = false.obs;
  bool isCheck = false;

  bool isVisiblePass = true;
  IconData visiblePassIcon = Icons.visibility;

  bool isVisibleConfirmPass = true;
  IconData visibleConfirmPassIcon = Icons.visibility;

//الجنسيه
  RxString selectedNationalityType_ = ''.obs;
//الدوله
  RxString selectedCountryType_ = ''.obs;
//المدينه
  RxString selectedCityType_ = ''.obs;
//حالة الحساب
  RxString selectedAccountStatusType_ = ''.obs;

  //نوع الزواج
  RxString selectedMarriageType_ = ''.obs;

  //العمر
  RxString selectedAgeType_ = ''.obs;
//الأطفال
  RxString selectedchildernType_ = ''.obs;

//الوزن
  RxString selectedKgType_ = ''.obs;


//الطول (سم)
  RxString selectedhightType_ = ''.obs;

  //لون البشرة
  RxString selectedSkinType_ = ''.obs;
//بنية الجسم
  RxString selectedStructureType_ = ''.obs;

//الالتزام الديني
  RxString selectedCommitmentType_ = ''.obs;

  //الصلاه
  RxString selectedPrayerType_ = ''.obs;

  //التدخين
  RxString selectedSmokingType_ = ''.obs;


  //اللحية
  RxString selectedbeardType_ = ''.obs;

  //المؤهل التعليمي
  RxString selectedEducationalType_ = ''.obs;

  //الوضع المادي
  RxString selectedFinancialStatusType_ = ''.obs;

  //مجال التعليم
  RxString selectedEducationFieldType_ = ''.obs;

  //الجنسيه
  List<NationalityType> listNationalityType = [
    NationalityType(value: 0, name: 'Palestion'),
    NationalityType(value: 1, name: 'Laban'),
    NationalityType(value: 1, name: 'jordan'),
  ];

//الدوله

  List<CountryType> listCountryType = [
    CountryType(value: 0, name: '555'),
    CountryType(value: 1, name: '4444'),
    CountryType(value: 1, name: 'schskjn'),
  ];

//المدينه
  List<CityType> listCityType = [
    CityType(value: 0, name: '555'),
    CityType(value: 1, name: '4444'),
    CityType(value: 1, name: 'schskjn'),
  ];

//حالة الحساب
  List<AccountStatusType> listAccountStatusType = [
    AccountStatusType(value: 0, name: '555'),
    AccountStatusType(value: 1, name: '4444'),
    AccountStatusType(value: 1, name: 'schskjn'),
  ];



//نوع الزواج
  List<MarriageType> listMarriageType = [
    MarriageType(value: 0, name: '555'),
    MarriageType(value: 1, name: '4444'),
    MarriageType(value: 1, name: 'schskjn'),
  ];


  //العمر
  List<AgeType> listAgeType = [
    AgeType(value: 0, name: '555'),
    AgeType(value: 1, name: '4444'),
    AgeType(value: 1, name: 'schskjn'),
  ];

//الأطفال
  List<ChildernType> listchildernType = [
    ChildernType(value: 0, name: '555'),
    ChildernType(value: 1, name: '4444'),
    ChildernType(value: 1, name: 'schskjn'),
  ];


  //الوزن
  List<KgType> listKgType = [
    KgType(value: 0, name: '555'),
    KgType(value: 1, name: '4444'),
    KgType(value: 1, name: 'schskjn'),
  ];



//الطول (سم)
  List<HigthType> listHigthType = [
    HigthType(value: 0, name: '555'),
    HigthType(value: 1, name: '4444'),
    HigthType(value: 1, name: 'schskjn'),
  ];

  //لون البشرة

  List<SkinType> listSkinType = [
    SkinType(value: 0, name: '555'),
    SkinType(value: 1, name: '4444'),
    SkinType(value: 1, name: 'schskjn'),
  ];




//بنية الجسم
  List<StructureType> listStructureType = [
    StructureType(value: 0, name: '555'),
    StructureType(value: 1, name: '4444'),
    StructureType(value: 1, name: 'schskjn'),
  ];



//الالتزام الديني
  List<CommitmentType> listCommitmentType = [
    CommitmentType(value: 0, name: '555'),
    CommitmentType(value: 1, name: '4444'),
    CommitmentType(value: 1, name: 'schskjn'),
  ];



  //الصلاه
  List<PrayerType> listPrayerType = [
    PrayerType(value: 0, name: '555'),
    PrayerType(value: 1, name: '4444'),
    PrayerType(value: 1, name: 'schskjn'),
  ];


  //التدخين
  List<SmokingType> listSmokingType = [
    SmokingType(value: 0, name: '555'),
    SmokingType(value: 1, name: '4444'),
    SmokingType(value: 1, name: 'schskjn'),
  ];

  //اللحية
  List<BeardType> listbeardType = [
    BeardType(value: 0, name: '555'),
    BeardType(value: 1, name: '4444'),
    BeardType(value: 1, name: 'schskjn'),
  ];


  //المؤهل التعليمي
  List<EducationalType> listEducationalType = [
    EducationalType(value: 0, name: '555'),
    EducationalType(value: 1, name: '4444'),
    EducationalType(value: 1, name: 'schskjn'),
  ];

  //الوضع المادي
  List<SinancialStatusType> listFinancialStatusType = [
    SinancialStatusType(value: 0, name: '555'),
    SinancialStatusType(value: 1, name: '4444'),
    SinancialStatusType(value: 1, name: 'schskjn'),
  ];

  //مجال التعليم
  List<EducationFieldType> listEducationFieldType = [
    EducationFieldType(value: 0, name: '555'),
    EducationFieldType(value: 1, name: '4444'),
    EducationFieldType(value: 1, name: 'schskjn'),
  ];


  late GlobalKey<FormState> formKey;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController jobController;
  late TextEditingController selfController;
  late TextEditingController userNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;

  @override
  void onInit() {
    formKey = GlobalKey();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    jobController = TextEditingController();
    selfController = TextEditingController();
    userNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    super.onInit();

    // nameController.text = 'khalil';

  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    jobController.dispose();
    selfController.dispose();
    userNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }
  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon = isVisiblePass ? Icons.visibility : Icons.visibility_off;
    update();
  }
}