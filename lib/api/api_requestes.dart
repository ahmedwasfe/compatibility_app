// import 'dart:convert';
// import 'dart:developer';
// import 'dart:math';
// import 'package:compatibility_app/api/api_helper.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:compatibility_app/api/api_helper.dart';
import 'package:compatibility_app/model/auth/register/register.dart';
import 'package:compatibility_app/model/settings/cities.dart';
import 'package:compatibility_app/model/settings/countries.dart';
import 'package:compatibility_app/model/settings/education_field.dart';
import 'package:compatibility_app/model/settings/educational.dart';
import 'package:compatibility_app/model/settings/financial.dart';
import 'package:compatibility_app/model/settings/physique.dart';
import 'package:compatibility_app/model/settings/prayer.dart';
import 'package:compatibility_app/model/settings/religious_commitment.dart';
import 'package:compatibility_app/model/settings/skin.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/settings/marriage_type.dart';
//
class ApiRequestes {
  static final _client = http.Client();

  static Future<Countries?> getCountries() async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.COUNTRIES),
    headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      Countries countries = Countries.fromJson(body);
      // log('SUCCESS getCountries: ${jsonEncode(countries)}');
      return countries;
    }else {
      log('ERROR getCountries: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Cities?> getCities(int countryId) async {
    http.Response response = await _client.get(Uri.parse('${ApiHelper.CITIES}?country_id=$countryId'),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      Cities city = Cities.fromJson(body);
      // log('SUCCESS getCities: ${jsonEncode(city)}');
      return city;
    }else {
      log('ERROR getCities: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<MarriageType?> getMarriageType() async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.MARRIAGE_TYPE),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      MarriageType type = MarriageType.fromJson(body);
      // log('SUCCESS getMarriageType: ${jsonEncode(type)}');
      return type;
    }else {
      log('ERROR getMarriageType: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Skin?> getSkin() async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.SKIN),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      Skin skin = Skin.fromJson(body);
      // log('SUCCESS getSkin: ${jsonEncode(skin)}');
      return skin;
    }else {
      log('ERROR getSkin: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Physique?> getPhysique() async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.PHYSIQUE),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      Physique physique = Physique.fromJson(body);
      // log('SUCCESS getPhysique: ${jsonEncode(physique)}');
      return physique;
    }else {
      log('ERROR getPhysique: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<ReligiousCommitment?> getReligiousCommitment() async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.RELIGIOUS_COMMITMENT),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      ReligiousCommitment religiousCommitment = ReligiousCommitment.fromJson(body);
      // log('SUCCESS getReligiousCommitment: ${jsonEncode(religiousCommitment)}');
      return religiousCommitment;
    }else {
      log('ERROR getReligiousCommitment: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Prayer?> getPrayer() async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.PRAYER),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      Prayer prayer = Prayer.fromJson(body);
      // log('SUCCESS getPrayer: ${jsonEncode(prayer)}');
      return prayer;
    }else {
      log('ERROR getPrayer: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Educational?> getEducational() async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.EDUCATTIONAL),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      Educational educational = Educational.fromJson(body);
      log('SUCCESS getEducational: ${jsonEncode(educational)}');
      return educational;
    }else {
      log('ERROR getEducational: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Financial?> getFinancial() async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.FINANCIAL),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      Financial financial = Financial.fromJson(body);
      log('SUCCESS getFinancial: ${jsonEncode(financial)}');
      return financial;
    }else {
      log('ERROR getFinancial: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<EducationField?> getEducationField() async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.EDUCATION_FIELD),
        headers: ApiHelper.langHeader(language: AppHelper.getAppLanguage()));

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      EducationField educationField = EducationField.fromJson(body);
      log('SUCCESS getEducationField: ${jsonEncode(educationField)}');
      return educationField;
    }else {
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
        body:
        jsonEncode(<String, dynamic>{'username': username, 'password': password}),
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
    }}

 static Future<Auth?> register({
    required String status,
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
    required String bio
}) async {
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
        },
        encoding: Encoding.getByName('utf-8'));

    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      Auth auth = Auth.fromJson(body);
      log('SUCCESS register: ${jsonEncode(auth)}');
      return auth;
    }else {
      log('ERROR register: ${jsonDecode(response.body)}');
      return null;;
    }
 }

}
