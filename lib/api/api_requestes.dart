// import 'dart:convert';
// import 'dart:developer';
// import 'dart:math';
// import 'package:compatibility_app/api/api_helper.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:compatibility_app/api/api_helper.dart';
import 'package:compatibility_app/model/auth/auth.dart';
import 'package:compatibility_app/model/auth/check_code.dart';
import 'package:compatibility_app/model/auth/delete_account.dart';
import 'package:compatibility_app/model/auth/logout.dart';
import 'package:compatibility_app/model/auth/update_profile.dart';
import 'package:compatibility_app/model/error_message.dart';
import 'package:compatibility_app/model/ignore/add_delete_ignore.dart';
import 'package:compatibility_app/model/ignore/ignore.dart';
import 'package:compatibility_app/model/interest/add_interest.dart';
import 'package:compatibility_app/model/interest/interest.dart';
import 'package:compatibility_app/model/member/members.dart';
import 'package:compatibility_app/model/notifications/delete_notifications.dart';
import 'package:compatibility_app/model/notifications/notifications.dart';
import 'package:compatibility_app/model/post/blog.dart';
import 'package:compatibility_app/model/review/add_review.dart';
import 'package:compatibility_app/model/settings/app_settings.dart';
import 'package:compatibility_app/model/settings/cities.dart';
import 'package:compatibility_app/model/settings/countries.dart';
import 'package:compatibility_app/model/settings/education_field.dart';
import 'package:compatibility_app/model/settings/educational.dart';
import 'package:compatibility_app/model/settings/financial.dart';
import 'package:compatibility_app/model/settings/physique.dart';
import 'package:compatibility_app/model/settings/prayer.dart';
import 'package:compatibility_app/model/settings/problem_model.dart';
import 'package:compatibility_app/model/settings/religious_commitment.dart';
import 'package:compatibility_app/model/settings/skin.dart';
import 'package:compatibility_app/model/sliders.dart';
import 'package:compatibility_app/model/subscription/subscription.dart';
import 'package:compatibility_app/model/success_stories.dart';
import 'package:compatibility_app/model/settings/contactus_model.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/preferences_manager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/settings/marriage_type.dart';

//
class ApiRequestes {
  static final _client = http.Client();

  static Future<Countries?> getCountries() async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.COUNTRIES),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Countries countries = Countries.fromJson(body);
      // log('SUCCESS getCountries: ${jsonEncode(countries)}');
      return countries;
    } else {
      log('ERROR getCountries: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Cities?> getCities(int countryId) async {
    http.Response response = await _client.get(
        Uri.parse('${ApiHelper.CITIES}?country_id=$countryId'),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Cities city = Cities.fromJson(body);
      // log('SUCCESS getCities: ${jsonEncode(city)}');
      return city;
    } else {
      log('ERROR getCities: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<MarriageType?> getMarriageType() async {
    http.Response response = await _client.get(
        Uri.parse(ApiHelper.MARRIAGE_TYPE),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      MarriageType type = MarriageType.fromJson(body);
      // log('SUCCESS getMarriageType: ${jsonEncode(type)}');
      return type;
    } else {
      log('ERROR getMarriageType: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Skin?> getSkin() async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.SKIN),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Skin skin = Skin.fromJson(body);
      // log('SUCCESS getSkin: ${jsonEncode(skin)}');
      return skin;
    } else {
      log('ERROR getSkin: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Physique?> getPhysique() async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.PHYSIQUE),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Physique physique = Physique.fromJson(body);
      // log('SUCCESS getPhysique: ${jsonEncode(physique)}');
      return physique;
    } else {
      log('ERROR getPhysique: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<ReligiousCommitment?> getReligiousCommitment() async {
    http.Response response = await _client.get(
        Uri.parse(ApiHelper.RELIGIOUS_COMMITMENT),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      ReligiousCommitment religiousCommitment =
          ReligiousCommitment.fromJson(body);
      // log('SUCCESS getReligiousCommitment: ${jsonEncode(religiousCommitment)}');
      return religiousCommitment;
    } else {
      log('ERROR getReligiousCommitment: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Prayer?> getPrayer() async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.PRAYER),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Prayer prayer = Prayer.fromJson(body);
      // log('SUCCESS getPrayer: ${jsonEncode(prayer)}');
      return prayer;
    } else {
      log('ERROR getPrayer: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Educational?> getEducational() async {
    http.Response response = await _client.get(
        Uri.parse(ApiHelper.EDUCATTIONAL),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Educational educational = Educational.fromJson(body);
      // log('SUCCESS getEducational: ${jsonEncode(educational)}');
      return educational;
    } else {
      log('ERROR getEducational: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Financial?> getFinancial() async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.FINANCIAL),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Financial financial = Financial.fromJson(body);
      // log('SUCCESS getFinancial: ${jsonEncode(financial)}');
      return financial;
    } else {
      log('ERROR getFinancial: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<EducationField?> getEducationField() async {
    http.Response response = await _client.get(
        Uri.parse(ApiHelper.EDUCATION_FIELD),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      EducationField educationField = EducationField.fromJson(body);
      log('SUCCESS getEducationField: ${jsonEncode(educationField)}');
      return educationField;
    } else {
      log('ERROR getEducationField: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Auth?> login(
      {required String username, required String password}) async {
    String deviceName = AppHelper.getDeviceName();
    print('DEVICE_NAME: ${AppHelper.getDeviceName()}');
    print('DEVICE_NAME: $deviceName');
    print('UserName: $username');
    print('PASSWORD: $password');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'X-Client-Device-Name': '$deviceName',
    };
    http.Response response = await _client.post(Uri.parse(ApiHelper.LOGIN),
        headers: headers,
        body: jsonEncode(
            <String, dynamic>{'username': username, 'password': password}),
        encoding: Encoding.getByName('utf-8'));
    // print("LOGIN: ${jsonDecode(response.body)}");
    Auth user = Auth();
    if (response.statusCode == 200 || response.statusCode == 201) {
      var body = jsonDecode(response.body);
      user = Auth.fromJson(body);
      // print('SUUCESS login: ${jsonEncode(user)}');
      return user;
    } else {
      var body = jsonDecode(response.body);
      user = Auth.fromJson(body);
      AppHelper.showToast(message: '${user.msg}', color: Colors.redAccent);
      print('ERROR login: ${jsonEncode(user)}');
      return null;
    }
  }
  
  static Future<CheckCode?> checkCode({required String token, required String code}) async {
    log('CODE: $code');
   http.Response response = await _client.post(Uri.parse(ApiHelper.CHECK_CODE),
   headers: ApiHelper.headerToken(token: token),
   body: <String, dynamic> {
     'bin_code': code
   }, encoding: Encoding.getByName('utf8'));

   if(response.statusCode == 200){
     var body = jsonDecode(response.body);
     CheckCode code = CheckCode.fromJson(body);
     log('SUCCESS checkCode: ${jsonEncode(code)}');
     return code;
   }else {
     log('ERROR checkCode: ${jsonDecode(response.body)}');
     return null;
   }
  }

  static Future<Auth?> register(
      {required String status,
      required int marriageTypeId,
      required String age,
      required String childrenNum,
      required String weight,
      required String height,
      required int skinId,
      required int physiqueId,
      required int religiousCommitmentId,
      required int prayerId,
      required String type,
      required int educationalId,
      required String smoking,
      required String beard,
      required int financialId,
      required int educationFieldId,
      required String job,
      required String lifePartnerBio,
      required int nationalityId,
      required int countryId,
      required int cityId,
      required String email,
      required String username,
      required String fullName,
      required String password,
      required String confirmPassword,
      required String mobile,
      required String bio,
      required String deviceType,
      required String fcmToken}) async {
    log('DEVICE TYPE: $deviceType');
    log('FCM TOKEN: $fcmToken');
    log('USERNAME: $username');
    log('USERNAME: $fullName');
    http.Response response = await _client.post(Uri.parse(ApiHelper.REGISTER),
        headers: ApiHelper.headers(),
        body: <String, dynamic>{
          'status': status,
          'marriage_type_id': marriageTypeId.toString(),
          'age': age,
          'children_num': childrenNum,
          'weight': weight,
          'height': height,
          'skin_id': skinId.toString(),
          'physique_id': physiqueId.toString(),
          'religious_commitment_id': religiousCommitmentId.toString(),
          'prayer_id': prayerId.toString(),
          'type': type,
          'educational_id': educationalId.toString(),
          'is_smoking': smoking,
          'is_beard': beard,
          'financial_id': financialId.toString(),
          'education_field_id': educationFieldId.toString(),
          'job': job,
          'life_partner_bio': lifePartnerBio,
          'nationality_id': nationalityId.toString(),
          'country_id': countryId.toString(),
          'city_id': cityId.toString(),
          'email': email,
          'username': username,
          'password': password,
          'password_confirmation': confirmPassword,
          'full_name': fullName,
          'mobile': mobile,
          'bio': bio,
          'device_type': deviceType,
          'fcm_token': fcmToken,
        },
        encoding: Encoding.getByName('utf-8'));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Auth auth = Auth.fromJson(body);
      // log('SUCCESS register: ${jsonEncode(auth)}');
      return auth;
    } else {
      log('ERROR register: ${jsonDecode(response.body)}');
      return null;
      ;
    }
  }

  static Future<Logout?> logout() async {
    http.Response response = await _client.post(Uri.parse(ApiHelper.LOGOUT),
        headers: ApiHelper.header());

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      Logout logout = Logout.fromJson(body);
      // log('SUCCESS logout: ${jsonEncode(logout)}');
      return logout;
    }else {
      log('ERROR logout: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<DeleteAccount?> deleteAccount({required int userId}) async {
    http.Response response = await _client.post(Uri.parse(ApiHelper.DELETE_ACCOUNT),
    headers: ApiHelper.header(),
    body: <String, dynamic> {
      'id': userId.toString()
    });

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      DeleteAccount account = DeleteAccount.fromJson(body);
      // log('SUCCESS deleteAccount: ${jsonEncode(account)}');
      return account;
    }else {
      log('ERROR deleteAccount: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<UpdateProfile?> updateProfile(
      {
        required String fullName,
        required String email,
        required String mobile,
        required String image,
        required String password,
        required String confirmPassword,
      }) async {
    var request =
    http.MultipartRequest('POST', Uri.parse(ApiHelper.UPDATE_PROFILE));

    request.headers.addAll(ApiHelper.header());

    request.files.add(await http.MultipartFile.fromPath(
        'image', image,
        filename: image.split('/').last));

    request.fields['full_name'] = fullName;
    request.fields['email'] = email;
    request.fields['mobile'] = mobile;
    request.fields['password'] = password;
    request.fields['password_confirmation'] = confirmPassword;

    http.StreamedResponse response = await request.send();
    var responseBody = await http.Response.fromStream(response);

    if (responseBody.statusCode == 200 || responseBody.statusCode == 201) {
      var body = jsonDecode(responseBody.body);
      UpdateProfile profile = UpdateProfile.fromJson(body);
      // print('SUCCESS updateProfile: ${jsonEncode(profile)}');
      return profile;
    } else {
      print('ERROR updateProfile: ${jsonDecode(responseBody.body)}');
      return null;
    }
  }

  static Future<Auth?> updateActiveStatus(
      {required int userId, required String status}) async {
    http.Response response = await _client.post(
        Uri.parse(
            '${ApiHelper.UPDATE_ACTIVE_STATUS}?id=$userId&status=$status'),
        headers: ApiHelper.header());
    // log('SUCCESS updateActiveStatus: ${jsonDecode(response.body)}');
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Auth auth = Auth.fromJson(body);
      // log('SUCCESS updateActiveStatus: ${jsonEncode(auth)}');
      return auth;
    } else {
      log('ERROR updateActiveStatus: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<AppSettings?> getSettings({required String appLanguage}) async {
    print("getSettings: $appLanguage");
    http.Response response = await _client.get(Uri.parse(ApiHelper.Setting),
        headers: ApiHelper.langHeader(language: appLanguage));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      AppSettings settings = AppSettings.fromJson(body);
      // log('SUCCESS: ${jsonEncode(settings)}');
      return settings;
    } else {
      print('ERROR:${jsonDecode(response.body)}');
      return null;
    }
  }


  static Future<Notifications?> getNotifications({required String type}) async {
    http.Response response = await _client.get(
        Uri.parse('${ApiHelper.NOTIFICATIONS}?type=$type'),
        headers: ApiHelper.header());
    log('message: ${type}');
    log('message: ${response.statusCode}');
    //

    if (response.statusCode == 200) {
      // log('message: ${jsonDecode(response.body)}');
      var body = jsonDecode(response.body);
      Notifications notification = Notifications.fromJson(body);
      // log('SUCCESS getNotifications: ${jsonEncode(notification)}');
      return notification;
    } else {
      log('ERROR getNotifications: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<DeleteNotifactions?> deleteNotifications(
      {required String notificationId}) async {
    http.Response response = await _client.post(
      Uri.parse(ApiHelper.DELETE_NOTIFICATION),
      headers: ApiHelper.header(),
      body: <String, dynamic>{'notification_id': notificationId},
    );
    if (response.statusCode == 200) {
      log('message: ${jsonDecode(response.body)}');
      var body = jsonDecode(response.body);
      DeleteNotifactions notification = DeleteNotifactions.fromJson(body);
      // log('SUCCESS DeleteNotifications: ${jsonEncode(notification)}');
      // print('SUCCESS: deleteNotifications: ${jsonEncode(notification)}');
      return notification;
    } else {
      // log('ERROR DeleteNotifications: ${jsonDecode(response.body)}');
      print('ERROR deleteNotifications: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Blog?> getPost(
      {required String appLanguage, int? postId}) async {
    http.Response response = await _client.get(
      Uri.parse('${ApiHelper.BLOG}?post_id=${postId ?? 0}'),
      headers: ApiHelper.header(),
    );
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Blog post = Blog.fromJson(body);
      // print('SUCCESS: getPost: ${jsonEncode(post)}');
      return post;
    } else {
      print('ERROR getPost: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Memebers?> getMemebers(
      {int userId = 0,
      String type = '',
      int countryId = 0,
      String gender = ''}) async {
    log('getMemebers type: $type');
    log('getMemebers countryId: $countryId');
    log('getMemebers gender: $gender');
    http.Response response = await _client.get(
        Uri.parse(
            '${ApiHelper.MEMEBERS}?id=$userId&type=$type&country_id=$countryId&gender=$gender'),
        headers: ApiHelper.header());
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Memebers memebers = Memebers.fromJson(body);
      // log('SUCCESS getMemebers: ${jsonEncode(memebers)}');
      return memebers;
    } else {
      log('ERROR getMemebers: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Subscription?> getSubscriptions() async {
    http.Response response = await _client.get(
      Uri.parse(ApiHelper.SUBSCRIPTION),
    );
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Subscription subscription = Subscription.fromJson(body);
      // log('SUCCESS getSubscriptions: ${jsonEncode(subscription)}');
      return subscription;
    } else {
      log('ERROR getSubscriptions: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Sliders?> getSliders() async {
    http.Response response = await _client.get(
      Uri.parse(ApiHelper.SLIDERS),
    );
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Sliders slider = Sliders.fromJson(body);
      // log('SUCCESS getSliders: ${jsonEncode(slider)}');
      return slider;
    } else {
      log('ERROR getSliders: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<AddReview?> addReview({required int rate}) async {
    http.Response response = await _client.post(Uri.parse(ApiHelper.ADD_REVIEW),
        headers: ApiHelper.header(),
        body: <String, dynamic>{'rate': rate.toString()});
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      AddReview review = AddReview.fromJson(body);
      // log('SUCCESS addReview: ${jsonEncode(review)}');
      return review;
    } else {
      ErrorMessage message = ErrorMessage.fromJson(jsonDecode(response.body));
      AppHelper.showToast(message: message.msg!, color: Colors.redAccent);
      log('ERROR addReview: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<IgnoreList?> getUsersIgnore() async {
    log('message');
    http.Response response = await _client.get(
        Uri.parse('${ApiHelper.IGNORES_LIST}?status=1'),
        headers: ApiHelper.header());
    log('message: ${response.statusCode}');
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      IgnoreList ignoreList = IgnoreList.fromJson(body);
      // log('SUCCESS getUsersIgnore: ${jsonEncode(ignoreList)}');
      return ignoreList;
    } else {
      log('ERROR getUsersIgnore: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<AddDeleteIgnore?> addDeleteIgnore({required int userId}) async {
    http.Response response = await _client.post(
        Uri.parse(ApiHelper.ADD_DELETE_IGNORES_LIST),
        headers: ApiHelper.header(),
        body: <String, dynamic>{'customer_id': userId.toString()});
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      AddDeleteIgnore deleteIgnore = AddDeleteIgnore.fromJson(body);
      // log('SUCCESS addDeleteIgnore: ${jsonEncode(deleteIgnore)}');
      return deleteIgnore;
    } else {
      ErrorMessage message = ErrorMessage.fromJson(jsonDecode(response.body));
      AppHelper.showToast(message: message.msg!);
      log('ERROR addDeleteIgnore: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<InterestList?> getUsersInterest() async {
    http.Response response = await _client
        .get(Uri.parse(ApiHelper.INTERESTS_LIST), headers: ApiHelper.header());
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      InterestList interest = InterestList.fromJson(body);
      // log('SUCCESS getUsersInterest: ${jsonEncode(interest)}');
      return interest;
    } else {
      log('ERROR getUsersInterest: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<AddInterest?> addInterest({required int userId}) async {
    http.Response response = await _client.post(
        Uri.parse(ApiHelper.ADD_INTERESTS),
        headers: ApiHelper.header(),
        body: <String, dynamic>{'customer_id': userId.toString()});
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      AddInterest interest = AddInterest.fromJson(body);
      // log('SUCCESS addInterest: ${jsonEncode(interest)}');
      return interest;
    } else {
      ErrorMessage message = ErrorMessage.fromJson(jsonDecode(response.body));
      AppHelper.showToast(message: message.msg!);
      log('ERROR addInterest: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<SuccessStories?> getSuccessStories({int? countryId}) async {
    log('COUNTRY ID: ${countryId}');
    http.Response response = await _client.get(
        Uri.parse('${ApiHelper.SUCCESS_STORIES}?country_id=${countryId ?? 0}'));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      SuccessStories stories = SuccessStories.fromJson(body);
      // log('SUCCESS SuccessStories: ${jsonEncode(stories)}');
      return stories;
    } else {
      log('ERROR getSuccessStories: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<ProblemModel?> saveProblem({
    required String subject,
    required String message,
  }) async {
    http.Response response =
        await _client.post(Uri.parse(ApiHelper.SAVE_PROBLEM),
            body: <String, dynamic>{
              'subject': subject,
              'message': message,
            },
            headers: ApiHelper.header());
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      ProblemModel problem = ProblemModel();
      problem = ProblemModel.fromJson(body);
      return problem;
    } else {
      print('ERROR : ${jsonDecode(response.body)}');
      return null;
    }
  }

  //TODO Contact_US
  static Future<ContactusModel?> contactUs({
    required String name,
    required String email,
    required String mobile,
    required String message,
  }) async {

    http.Response response = await _client.post(Uri.parse(ApiHelper.CONTACT_US),
        body: <String, dynamic>{
          'name': name,
          'email': email,
          'mobile': mobile,
          'message': message,
        },
        headers: ApiHelper.header());
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      ContactusModel contact = ContactusModel.fromJson(body);
      return contact;
    } else {
      print('ERROR : ${jsonDecode(response.body)}');
      return null;
    }
  }
}
