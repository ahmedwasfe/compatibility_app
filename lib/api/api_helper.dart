import 'dart:developer';

import 'package:compatibility_app/utils/app_helper.dart';

class ApiHelper {
//
  static const String _baseUrl = 'http://twafuq.com/api';

  static const String COUNTRIES = '$_baseUrl/country';
  static const String CITIES = '$_baseUrl/city';
  static const String MARRIAGE_TYPE = '$_baseUrl/marriage_type';
  static const String SKIN = '$_baseUrl/skin';
  static const String PHYSIQUE = '$_baseUrl/physique';
  static const String RELIGIOUS_COMMITMENT = '$_baseUrl/religious_commitment';
  static const String PRAYER = '$_baseUrl/prayer';
  static const String EDUCATTIONAL = '$_baseUrl/educational';
  static const String FINANCIAL = '$_baseUrl/financial';
  static const String EDUCATION_FIELD = '$_baseUrl/education_field';

  static const String SAVE_PROBLEM = '$_baseUrl/save_problem';
  static const String CONTACT_US = '$_baseUrl/contact_us';

  static const String REGISTER = '$_baseUrl/register';
  static const String CHECK_CODE = '$_baseUrl/send_bincode_by_email';
  static const String LOGIN = '$_baseUrl/login';
  static const String LOGOUT = '$_baseUrl/logout';
  static const String DELETE_ACCOUNT = '$_baseUrl/delete_user';
  static const String UPDATE_PROFILE = '$_baseUrl/save_profile';


  static const String Setting = '$_baseUrl/setting';
  static const String PROFILE = '$_baseUrl/profail';

  static const String NOTIFICATIONS = '$_baseUrl/notification';
  static const String DELETE_NOTIFICATION = '$_baseUrl/delete_notification';


  static const String SAVEPROFILE = '$_baseUrl/save_profile';

  static const String BLOG = '$_baseUrl/posts';

  static const String UPDATE_ACTIVE_STATUS = '$_baseUrl/online_user';
  static const String MEMEBERS = '$_baseUrl/users';
  static const String SUBSCRIPTION = '$_baseUrl/subscription';
  static const String SLIDERS = '$_baseUrl/sliders';


  static const String ADD_REVIEW = '$_baseUrl/add_review';

  static const String IGNORES_LIST = '$_baseUrl/who_ignore_to_me';
  static const String ADD_DELETE_IGNORES_LIST = '$_baseUrl/add_or_delete_ignore';

  static const String INTERESTS_LIST = '$_baseUrl/who_interest_to_me';
  static const String ADD_INTERESTS = '$_baseUrl/add_interest';

  static const String SUCCESS_STORIES = '$_baseUrl/success_story';

//
//   static Map<String, String> registerHeader({required String language, required String deviceName}) {
//     return  {
//       'Accept-Language': language,
//       'X-Requested-With': 'XMLHttpRequest',
//       'Accept': 'application/json',
//       'Content-Type': 'application/json',
//       'X-Client-Device-Name': deviceName,
//       'Connection': 'keep-alive',
//     };
//   }
//
  static Map<String, String> langHeader({required String language}) {
    return {'X-Client-Language': language,
      'Content-Type': 'application/json',};
  }

  static Map<String, String> tokenHeader({required String token}) {
    return {'Authorization': token};
  }
//
//   static Map<String, String> headers({required String language}) {
//     return {
//       'Content-Type': 'application/json',
//       'X-Client-Language': language
//     };
//   }

  // TODO 8|CKFVtk7SAnHMyrVY8LXe1sWNoKD9HiVRFxaNQP1d
  static Map<String, String> header() {
    return {
      'Authorization': 'Bearer ${AppHelper.getCurrentUserToken()!}',
      'X-Client-Language': AppHelper.getAppLanguage(),
      'Accept': 'application/json'
    };
  }

  static Map<String, String> headerToken({required String token}) {
    log('TOK: $token');
    return {
      'X-Client-Device-Name': AppHelper.getDeviceName(),
      'Authorization': 'Bearer $token',
      'X-Client-Language': AppHelper.getAppLanguage(),
      'Accept': 'application/json',
    };
  }

  static Map<String, String> headers() {
    return {'Accept': 'application/json',
      'X-Client-Device-Name': '${AppHelper.getDeviceName()}'};
  }
//
//   static Map<String, String> allHeader(
//       {required String token, required String language}) {
//     return {
//       'Content-Type': 'application/json',
//       'Authorization': token,
//       'X-Client-Language': language
//     };
//   }
//
  static Map<String, String> adminHeader(
      {required String token, required String language}) {
    return {
    'X-Client-Device-Name': AppHelper.getDeviceName(),
      'Accept': 'application/json',
      'Authorization': token,
      'X-Client-Language': language
    };
  }
//
//   static String get baseUrl => baseUrl;
//
//   static Map<String, String> getHeader(
//       {required String token, required String appLanguage}) {
//     return {'Authorization': token, 'X-Client-Language': appLanguage};
//   }
}
