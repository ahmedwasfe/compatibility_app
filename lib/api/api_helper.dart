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

  static const String REGISTER = '$_baseUrl/register';
  static const String LOGIN = '$_baseUrl/login';
//
//   static const String BOARDING = '$_baseUrl/app-starter-interfaces';
//   static const String TERMS = '$_baseUrl/term-conditions';
//   static const String PRIVACY = '$_baseUrl/privacy-policy';
//   static const String FAQS = '$_baseUrl/faqs';
//   static const String CONTACT_US = '$_baseUrl/contact-us';
//
//   static const String REGISTER = '$_baseUrl/auth/register';
//   static const String LOGIN = '$_baseUrl/auth/login';
//   static const String CHANGE_PASSWORD = '$_baseUrl/auth/user-password-update';
//   static const String LOGOUT = '$_baseUrl/auth/logout';
//   static const String SEND_CODE = '$_baseUrl/auth/sent-code-for-reset-password';
//   static const String VERIFY_CODE = '$_baseUrl/auth/check-code';
//   static const String RESET_PASSWORD = '$_baseUrl/auth/check-code';
//
//
//
//
//   static const String SECTIONS = '$_baseUrl/al-mokhalis/categories?search=';
//   static const String JOBS = '$_baseUrl/al-mokhalis/all-works?';
//   static const String APPLY_JOB = '$_baseUrl/al-mokhalis/work-request';
//   static const String ADD_JOB = '$_baseUrl/al-mokhalis/add-work';
//   static const String JOB_REQUEST = '$_baseUrl/al-mokhalis/work-request-for-employer';
//
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
    return {'X-Client-Language': language};
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
//   static Map<String, String> adminHeader(
//       {required String token, required String language}) {
//     return {
//       'Accept': 'application/json',
//       'Authorization': token,
//       'X-Client-Language': language
//     };
//   }
//
//   static String get baseUrl => baseUrl;
//
//   static Map<String, String> getHeader(
//       {required String token, required String appLanguage}) {
//     return {'Authorization': token, 'X-Client-Language': appLanguage};
//   }
}
