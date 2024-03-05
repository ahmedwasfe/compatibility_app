import 'dart:developer';
import 'dart:io';

import 'package:compatibility_app/api/api_requestes.dart';
import 'package:compatibility_app/api/firebase_api.dart';
import 'package:compatibility_app/model/auth/register/account_status_type.dart';
import 'package:compatibility_app/model/auth/register/beard_type.dart';
import 'package:compatibility_app/model/auth/register/smoking_type.dart';
import 'package:compatibility_app/model/settings/cities.dart';
import 'package:compatibility_app/model/settings/countries.dart';
import 'package:compatibility_app/model/settings/education_field.dart';
import 'package:compatibility_app/model/settings/educational.dart';
import 'package:compatibility_app/model/settings/financial.dart';
import 'package:compatibility_app/model/settings/marriage_type.dart';
import 'package:compatibility_app/model/settings/physique.dart';
import 'package:compatibility_app/model/settings/prayer.dart';
import 'package:compatibility_app/model/settings/problem_type.dart';
import 'package:compatibility_app/model/settings/religious_commitment.dart';
import 'package:compatibility_app/model/settings/skin.dart';
import 'package:compatibility_app/model/user_type.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/ui/auth/forget_password/verification_code_screen.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:compatibility_app/utils/preferences_manager.dart';
import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class RegisterController extends GetxController{
  RxBool isLoading = false.obs;
  bool isCheck = false;

  bool isVisiblePass = true;
  IconData visiblePassIcon = Icons.visibility;

  bool isVisibleConfirmPass = true;
  IconData visibleConfirmPassIcon = Icons.visibility;

//TODO الجنسيه
  RxString selectedNationality_ = ''.obs;
  int selectedNationality = 0;

//TODO الدوله
  RxString selectedCountry_ = ''.obs;
  int selectedCountry = 0;
//TODO المدينه
  RxString selectedCity_ = ''.obs;
  int selectedCity = 0;
//TODO حالة الحساب
  RxString selectedAccountStatus_ = ''.obs;
  String selectedStatus = '';

  //نوع الزواج
  RxString selectedMarriageType_ = ''.obs;
  int selectedMarriageType = 0;

  //لون البشرة
  RxString selectedSkinType_ = ''.obs;
  int selectedSkin = 0;
//بنية الجسم
  RxString selectedStructureType_ = ''.obs;
  int selectedBody = 0;

//الالتزام الديني
  RxString selectedCommitmentType_ = ''.obs;
  int selectedCommitment = 0;

  //الصلاه
  RxString selectedPrayerType_ = ''.obs;
  int selectedPrayer = 0;

  //التدخين
  RxString selectedSmokingType_ = ''.obs;
  String selectedSmoking = '';


  //اللحية
  RxString selectedbeardType_ = ''.obs;
  String selectedBeard = '';

  //المؤهل التعليمي
  RxString selectedEducationalType_ = ''.obs;
  int selectedEducational = 0;

  //الوضع المادي
  RxString selectedFinancialStatusType_ = ''.obs;
  int selectedFinancial = 0;

  //مجال التعليم
  RxString selectedEducationFieldType_ = ''.obs;
  int selectedEducationField = 0;

  //سبب المشكله

  RxString selectedselectedProblem_ = ''.obs;
  int selectedselectedProblem = 0;


  String userSelected = '';

  List<UserType> listUserType = [
    UserType(name: 'as_husband'.tr, value: 'husband', isSelected: false),
    UserType(name: 'as_wife'.tr, value: 'wife', isSelected: false),
  ];

  List<CountryData> listCountries = [];

//المدينه
  List<CityData> listCities = [];

//حالة الحساب
  List<AccountStatus> listAccountStatus = [
    AccountStatus(value: 'appear', name: 'appear'),
    AccountStatus(value: 'disappear', name: 'disappear'),
  ];


  //سبب المشكله
  List<ProblemType> listProblems = [
    ProblemType(value: 'appear', name: 'appear'),
    ProblemType(value: 'disappear', name: 'disappear'),
  ];

  List<SmokingType> listSmoking = [
    SmokingType(value: 'smoking', name: 'smoking_'),
    SmokingType(value: 'non-smoking', name: 'non_smoking'),
  ];



//نوع الزواج
  List<MarriageTypeData> listMarriageType = [];

  //لون البشرة

  List<SkinData> listSkin = [];
  List<PhysiqueData> listPhysique = [];
  List<ReligiousCommitmentData> listReligiousCommitment = [];
  List<PrayerData> listPrayer = [];

  //اللحية
  List<BeardType> listBeard = [
    BeardType(value: 'beard', name: 'beard_'),
    BeardType(value: 'non-beard', name: 'non_beard'),
  ];


  //المؤهل التعليمي
  List<EducationalData> listEducational = [];
  List<FinancialData> listFinancial = [];
  List<EducationFieldData> listEducationField = [];


  late GlobalKey<FormState> formKey;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController jobController;
  late TextEditingController talkDescriptionController;
  late TextEditingController usernameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController descriptionController;

  late TextEditingController ageController;
  late TextEditingController childrenController;

  late TextEditingController weightController;
  late TextEditingController heightController;

  @override
  void onInit() {
    formKey = GlobalKey();
    nameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    jobController = TextEditingController();
    talkDescriptionController = TextEditingController();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    descriptionController = TextEditingController();

    ageController = TextEditingController();
    childrenController = TextEditingController();

    weightController = TextEditingController();
    heightController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {

    formKey.currentState!.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    jobController.dispose();
    talkDescriptionController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    descriptionController.dispose();

    ageController.dispose();
    childrenController.dispose();

    weightController.dispose();
    heightController.dispose();

    super.dispose();
  }

  void visiblePassword() {
    isVisiblePass = !isVisiblePass;
    visiblePassIcon = isVisiblePass ? Icons.visibility : Icons.visibility_off;
    update();
  }

  void visibleConfirmPassword() {
    isVisibleConfirmPass = !isVisibleConfirmPass;
    visibleConfirmPassIcon = isVisibleConfirmPass ? Icons.visibility : Icons.visibility_off;
    update();
  }

  bool isValidationUsername(BuildContext context) {
    if(usernameController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'enter_username',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else {
      return true;
    }
  }

  bool isValidationPassword(BuildContext context) {
    if(passwordController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'please_click_password',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(passwordController.text.length < 6 ) {
      AppWidgets.showSnackBar(context: context,
          message: 'password_must_be_more_than_6',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(confirmPasswordController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'please_confirm_your_password_here',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(confirmPasswordController.text.length < 6 ) {
      AppWidgets.showSnackBar(context: context,
          message: 'password_must_be_more_than_6',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(confirmPasswordController.text != passwordController.text) {
      AppWidgets.showSnackBar(context: context,
          message: 'tow_password_not_match',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else {
      return true;
    }
  }

  bool isValidationNationality(BuildContext context) {
    if(selectedNationality == 0){
      AppWidgets.showSnackBar(context: context,
          message: 'select_nationality',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(selectedCountry == 0){
      AppWidgets.showSnackBar(context: context,
          message: 'select_country',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(selectedCity == 0){
      AppWidgets.showSnackBar(context: context,
          message: 'select_city',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else {
      return true;
    }
  }

  bool isValidationStatus(BuildContext context) {
    if(selectedStatus.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'select_account_status',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(selectedMarriageType == 0){
      AppWidgets.showSnackBar(context: context,
          message: 'select_marriage_type',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(ageController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'enter_age',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(childrenController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'enter_children',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else {
      return true;
    }
  }

  bool isValidationAppearance(BuildContext context) {
    if(weightController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'choose_weight',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(heightController == 0){
      AppWidgets.showSnackBar(context: context,
          message: 'choose_height',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(selectedSkin == 0){
      AppWidgets.showSnackBar(context: context,
          message: 'choose_tone',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(selectedBody == 0){
      AppWidgets.showSnackBar(context: context,
          message: 'choose_structure',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else {
      return true;
    }
  }

  bool isValidationDept(BuildContext context) {
    if(selectedCommitment == 0){
      AppWidgets.showSnackBar(context: context,
          message: 'choose_religious_commitment',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(selectedPrayer == 0){
      AppWidgets.showSnackBar(context: context,
          message: 'choose_prayer_range',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(selectedSmoking.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'choose_whether_smoke_not',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(selectedBeard.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'choose_whether_bearded_not',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else {
      return true;
    }
  }

  bool isValidationEducation(BuildContext context) {
    if(selectedEducational == 0){
      AppWidgets.showSnackBar(context: context,
          message: 'choose_your_educational',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(selectedFinancial == 0){
      AppWidgets.showSnackBar(context: context,
          message: 'choose_physical_mode',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(selectedEducationField == 0){
      AppWidgets.showSnackBar(context: context,
          message: 'choose_field_work',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(jobController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'enter_job_here',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else {
      return true;
    }
  }

  bool isValidationDescription(BuildContext context) {
    if(descriptionController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'enter_description',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else {
      return true;
    }
  }

  bool isValidationSelfDescription(BuildContext context) {
    if(talkDescriptionController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'self_here',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else {
      return true;
    }
  }

  bool isValidationPersonalInfo(BuildContext context) {
    if(nameController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'enter_full_name',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(phoneController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'enter_mobile',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else if(emailController.text.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'enter_email',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else {
      return true;
    }
  }

  bool isValidationUserType(BuildContext context) {
    if(userSelected.isEmpty){
      AppWidgets.showSnackBar(context: context,
          message: 'welcome_to_application',
          textColor: AppColors.colorErrorText,
          backgroundColor: AppColors.colorErrorBG,
          iconColor: AppColors.colorErrorText);
      return false;
    }else {
      return true;
    }
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

  Future<void> getCities(int countryId) async {
    await ApiRequestes.getCities(countryId)
        .then((value) {
      if(value != null){
        listCities.clear();
        listCities.addAll(value.result!.cities!);
      }
    });
  }

  Future<void> getMarriageType() async {
    await ApiRequestes.getMarriageType()
        .then((value) {
      if(value != null){
        listMarriageType.clear();
        listMarriageType.addAll(value.result!.marriageType!);
      }
    });
  }

  Future<void> getSkin() async {
    await ApiRequestes.getSkin()
        .then((value) {
      if(value != null){
        listSkin.clear();
        listSkin.addAll(value.result!.skin!);
      }
    });
  }

  Future<void> getPhysique() async {
    await ApiRequestes.getPhysique()
        .then((value) {
      if(value != null){
        listPhysique.clear();
        listPhysique.addAll(value.result!.physique!);
      }
    });
  }

  Future<void> getReligiousCommitment() async {
    await ApiRequestes.getReligiousCommitment()
        .then((value) {
      if(value != null){
        listReligiousCommitment.clear();
        listReligiousCommitment.addAll(value.result!.religiousCommitment!);
      }
    });
  }

  Future<void> getPrayer() async {
    await ApiRequestes.getPrayer()
        .then((value) {
      if(value != null){
        listPrayer.clear();
        listPrayer.addAll(value.result!.prayer!);
      }
    });
  }

  Future<void> getEducational() async {
    await ApiRequestes.getEducational()
        .then((value) {
      if(value != null){
        listEducational.clear();
        listEducational.addAll(value.result!.educational!);
      }
    });
  }

  Future<void> getFinancial() async {
    await ApiRequestes.getFinancial()
        .then((value) {
      if(value != null){
        listFinancial.clear();
        listFinancial.addAll(value.result!.financial!);
      }
    });
  }

  Future<void> getEducationField() async {
    await ApiRequestes.getEducationField()
        .then((value) {
      if(value != null){
        listEducationField.clear();
        listEducationField.addAll(value.result!.educationField!);
      }
    });
  }

  void createAccount(BuildContext context) {
    isLoading(true);
    ApiRequestes.register(status: selectedStatus, marriageTypeId: selectedMarriageType,
        age: ageController.text, childrenNum: childrenController.text, weight: weightController.text,
        height: heightController.text, skinId: selectedSkin,
        physiqueId: selectedBody, religiousCommitmentId: selectedCommitment,
        prayerId: selectedPrayer,
        type: userSelected, educationalId: selectedEducational, smoking: selectedSmoking, beard: selectedBeard,
        financialId: selectedFinancial, educationFieldId: selectedEducationField, job: jobController.text,
        lifePartnerBio: talkDescriptionController.text, nationalityId: selectedNationality,
        countryId: selectedCountry, cityId: selectedCity, email: emailController.text, username: usernameController.text,
        fullName: nameController.text, password: passwordController.text,
        confirmPassword: confirmPasswordController.text, mobile: phoneController.text, bio: descriptionController.text,
        deviceType: Platform.isAndroid ? TargetPlatform.android.name : TargetPlatform.iOS.name, fcmToken: PreferencesManager.getUserToken(key: Const.KEY_FCM_TOKEN))
        .then((value) async {
          if(value != null){
            isLoading(false);
            Get.to(VerificationCodeScreen(email: value.result!.user!.email!, token: value.result!.token!));
          }else {
            isLoading(false);
          }
    });
  }

  void showPromiseDialog(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (_) => GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
              alignment: AlignmentDirectional.center,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(12.r),
                      topEnd: Radius.circular(12.r)
                  )
              ),
              child: Container(
                padding: EdgeInsetsDirectional.only(start: 6.r, end: 6.r),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 5.h),
                    SvgPicture.asset('${Const.images}image_promise.svg', width: 120, height: 120),
                    SizedBox(height: 2.h),
                    AppText.medium(text: 'السلام عليكم ورحمة الله وبركاته', maxline: 1, textAlign: TextAlign.center),
                    AppText.medium(text: 'promise_title', maxline: 1, textAlign: TextAlign.center, color: AppColors.lightpurple),
                    SizedBox(height: 4.h),
                    AppText.medium(text: 'promise_content', maxline: 10, textAlign: TextAlign.center, fontSize: 14.sp),
                    Row(
                      children: [
                        GetBuilder<RegisterController>(builder: (controller) => CustomCheckBox(
                          value: isCheck,
                          checkedFillColor: AppColors.colorAppMain,
                          splashColor: AppColors.colorAppMain,
                          borderColor: Colors.grey,
                          tooltip: 'Custom Check Box',
                          splashRadius: 9,
                          onChanged: (val) {
                            isCheck = val;
                            controller.update();
                          },
                        )),
                        AppText.medium(
                            text: 'promise_check', maxline: 1, textAlign: TextAlign.center, fontSize: 14.sp),
                      ],
                    ),
                    GetBuilder<RegisterController>(builder: (controller) => Container(
                      margin: EdgeInsetsDirectional.only(start: 16.r, end: 16.r, top: 4.r),
                      child: AppWidgets.CustomButton(
                          text: 'continuation',
                          textColor: isCheck ? Colors.white : AppColors.colorAppMain,
                          isUpperCase: false,
                          radius: 8.r,
                          background: isCheck ? AppColors.colorAppMain : Colors.white,
                          borderColor: isCheck ? Colors.white : AppColors.colorAppMain,
                          click: () {
                            if(isCheck) {
                              createAccount(context);
                            }
                          }),
                    ))
                  ],
                ),
              )
          ),
        ));
  }
}