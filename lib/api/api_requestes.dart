// import 'dart:convert';
// import 'dart:developer';
// import 'dart:math';
// import 'package:compatibility_app/api/api_helper.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// class ApiRequestes {
//   static final _client = http.Client();
//
//   static Future<Boarding?> getBoardings({required String language}) async {
//     http.Response response = await _client.get(Uri.parse(ApiHelper.BOARDING),
//         headers: ApiHelper.langHeader(language: language));
//     print('CODE: ${response.statusCode}');
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       print('BODY: ${response.body}');
//       Boarding boarding = Boarding.fromJson(body);
//       // print('SUCCESS getBoardings: ${jsonEncode(boarding)}');
//       return boarding;
//     } else {
//       print('ERROR getBoardings: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<Auth?> register({
//     required String language,
//     required String username,
//     required String phone,
//     required String email,
//     required int userType,
//     required String address,
//     required String password,
//     required String confirmPassword,
//   }) async {
//     print('NAME: $username');
//     print('EMAIL: $email');
//     http.Response response = await _client.post(Uri.parse(ApiHelper.REGISTER),
//         headers: ApiHelper.headers(language: language),
//         body: jsonEncode(<String, dynamic>{
//           'name': username,
//           'mobile': phone,
//           'email': email,
//           'address': address,
//           'user_type': userType,
//           'password': password,
//           'password_confirmation': confirmPassword,
//         }),
//         encoding: Encoding.getByName('utf-8'));
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       Auth auth = Auth.fromJson(body);
//       // print('SUCCESS registerAsTourists: ${jsonEncode(auth)}');
//       return auth;
//     } else {
//       print('ERROR registerAsTourists: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<Auth?> login(
//       {required String mobile, required String password}) async {
//     http.Response response = await _client.post(Uri.parse(ApiHelper.LOGIN),
//         headers: ApiHelper.headers(language: AppHelper.getAppLanguage()),
//         body: jsonEncode(
//             <String, dynamic>{'mobile': mobile, 'password': password}),
//         encoding: Encoding.getByName('utf-8'));
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       Auth auth = Auth.fromJson(body);
//       print('SUCCESS login: ${jsonEncode(auth)}');
//       return auth;
//     } else {
//       print('ERROR login: ${jsonDecode(response.body)}');
//       AppHelper.showToast(message: 'error_login'.tr, color: Colors.redAccent);
//       return null;
//     }
//   }
//
//   static Future<SendCode?> sendCode({required String email}) async {
//     http.Response response = await _client.post(Uri.parse(ApiHelper.SEND_CODE),
//     headers: ApiHelper.headers(language: AppHelper.getAppLanguage()),
//     body: jsonEncode(<String, dynamic> {
//       'email': email
//     }), encoding: Encoding.getByName('utf-8'));
//     if(response.statusCode == 200){
//       var body = jsonDecode(response.body);
//       SendCode sendCode = SendCode.fromJson(body);
//       print('SUCCESS sendCode: ${jsonEncode(sendCode)}');
//       return sendCode;
//     }else {
//       print('ERROR sendCode: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<VerifyCode?> verifyCode({required String code}) async {
//     http.Response response = await _client.post(Uri.parse(ApiHelper.VERIFY_CODE),
//         headers: ApiHelper.headers(language: AppHelper.getAppLanguage()),
//         body: jsonEncode(<String, dynamic> {
//           'verification_code': code
//         }), encoding: Encoding.getByName('utf-8'));
//     if(response.statusCode == 200){
//       var body = jsonDecode(response.body);
//       VerifyCode verifyCode = VerifyCode.fromJson(body);
//       print('SUCCESS verifyCode: ${jsonEncode(verifyCode)}');
//       return verifyCode;
//     }else {
//       print('ERROR verifyCode: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<ResetPassword?> resetPassword({required String code, required String newPassword, required String confirmPassword}) async {
//     http.Response response = await _client.post(Uri.parse(ApiHelper.RESET_PASSWORD),
//         headers: ApiHelper.headers(language: AppHelper.getAppLanguage()),
//     body: jsonEncode(<String, dynamic> {
//       'verification_code': code,
//       'password': code,
//       'password_confirmation': code
//     }),
//     encoding: Encoding.getByName('utf-8'));
//     if(response.statusCode == 200){
//       var body = jsonDecode(response.body);
//       ResetPassword password = ResetPassword.fromJson(body);
//       print('SUCCESS resetPassword: ${jsonEncode(password)}');
//       return password;
//     }else {
//       print('ERROR resetPassword: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<ChangePassword?> changePassword({
//     required String token,
//     required String language,
//     required String oldPassword,
//     required String newPassword,
//     required String confirmPassword
// }) async {
//     http.Response response = await _client.post(Uri.parse('${ApiHelper.CHANGE_PASSWORD}'),
//     headers: ApiHelper.allHeader(token: token, language: language),
//     body: jsonEncode(<String, dynamic> {
//       'old_password': oldPassword,
//       'new_password': newPassword,
//       'new_password_confirmation': confirmPassword,
//     }), encoding: Encoding.getByName('utf-8'));
//     print('STATUS CODE: ${response.statusCode}');
//     if(response.statusCode == 200 || response.statusCode == 201){
//       var body = jsonDecode(response.body);
//       ChangePassword password = ChangePassword.fromJson(body);
//       return password;
//     }else {
//       print('ERROR changePassword: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<Logout?> logout({required String token}) async {
//     http.Response response = await _client.post(Uri.parse(ApiHelper.LOGOUT),
//     headers: ApiHelper.tokenHeader(token: token));
//     if(response.statusCode == 200){
//       var body = jsonDecode(response.body);
//       Logout logout = Logout.fromJson(body);
//       return logout;
//     }else {
//       print('ERROR logout: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<Sections?> getSections(
//       {required String search,
//       required String token,
//       required String language}) async {
//     http.Response response = await _client.get(
//         Uri.parse('${ApiHelper.SECTIONS}$search'),
//         headers: ApiHelper.allHeader(token: token, language: language));
//
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       Sections sections = Sections.fromJson(body);
//       // print('SUUCESS getSections: ${jsonEncode(sections)}');
//       return sections;
//     } else {
//       print('ERROR getSections: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<Jobs?> getJobs({
//     required String token,
//     required String language,
//     required int sectionId,
//     required String search,
//     required int jobType,
//   }) async {
//     print('SECTION: $sectionId');
//     print('TYPE: $jobType');
//     print('SEARCH: $search');
//     http.Response response = await _client.get(
//         Uri.parse(
//             '${ApiHelper.JOBS}category_id=$sectionId&permit_type=$jobType&search=$search'),
//         headers: ApiHelper.getHeader(token: token, appLanguage: language));
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       Jobs jobs = Jobs.fromJson(body);
//       print('SUCCESS getJobs: ${jsonEncode(jobs)}');
//       return jobs;
//     } else {
//       print('ERROR getJobs: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<ApplyJob?> applyJob(
//       {required String token,
//       required String language,
//       required int userId,
//       required int jobId,
//       required String username,
//       required String phone,
//       required String description,
//       required String image}) async {
//     var request = http.MultipartRequest('POST', Uri.parse(ApiHelper.APPLY_JOB));
//     request.headers
//         .addAll(ApiHelper.allHeader(token: token, language: language));
//     request.files.add(await http.MultipartFile.fromPath('permit_image', image,
//         filename: image.split('/').last));
//     request.fields['user_id'] = userId.toString();
//     request.fields['work_id'] = jobId.toString();
//     request.fields['name'] = username;
//     request.fields['mobile'] = phone;
//     request.fields['work_description'] = description;
//
//     var response = await request.send();
//     var responseBody = await http.Response.fromStream(response);
//
//     print('CODE: ${responseBody.statusCode}');
//     if (responseBody.statusCode == 200 || responseBody.statusCode == 201) {
//       var body = jsonDecode(responseBody.body);
//       ApplyJob job = ApplyJob.fromJson(body);
//       print('SUCCESS applyJob: ${jsonEncode(job)}');
//       return job;
//     } else {
//       ErrorMessage message =
//           ErrorMessage.fromJson(jsonDecode(responseBody.body));
//       AppHelper.showToast(message: message.message!, color: Colors.redAccent);
//       print('ERROR applyJob: ${jsonDecode(responseBody.body)}');
//       return null;
//     }
//   }
//
//   static Future<AddJob?> addJob(
//       {required String token,
//       required String language,
//       required String title,
//       required int sectionId,
//       required String region,
//       required String duration,
//       required String description,
//       required int jobType,
//       required List<String> images}) async {
//     var request = http.MultipartRequest('POST', Uri.parse(ApiHelper.ADD_JOB));
//     request.headers
//         .addAll(ApiHelper.allHeader(token: token, language: language));
//     if(images.isNotEmpty){
//       for(int x = 0; x < images.length; x++){
//         request.files.add(await http.MultipartFile.fromPath('images[]', images[x],
//             filename: images[x].split('/').last));
//       }
//     }
//
//     request.fields['title_ar'] = title;
//     request.fields['title_il'] = title;
//     request.fields['title_en'] = title;
//     request.fields['category_id'] = sectionId.toString();
//     request.fields['region'] = region;
//     request.fields['duration'] = duration;
//     request.fields['description_ar'] = description;
//     request.fields['description_il'] = description;
//     request.fields['description_en'] = description;
//     request.fields['permit_type'] = jobType.toString();
//
//     var response = await request.send();
//     var responseBody = await http.Response.fromStream(response);
//
//     print('CODE: ${responseBody.statusCode}');
//     if (responseBody.statusCode == 200 || responseBody.statusCode == 201) {
//       var body = jsonDecode(responseBody.body);
//       AddJob job = AddJob.fromJson(body);
//       print('SUCCESS addJob: ${jsonEncode(job)}');
//       return job;
//     } else {
//       ErrorMessage message =
//           ErrorMessage.fromJson(jsonDecode(responseBody.body));
//       AppHelper.showToast(message: message.message!, color: Colors.redAccent);
//       print('ERROR addJob: ${jsonDecode(responseBody.body)}');
//       return null;
//     }
//   }
//
//   static Future<Terms?> getTerms({required String language}) async {
//     print('getTERMS $language');
//     http.Response response = await _client.get(Uri.parse(ApiHelper.TERMS),
//         headers: ApiHelper.langHeader(language: language));
//     print('CODE: ${response.statusCode}');
//     // print('BODY: ${response.body}');
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       Terms terms = Terms.fromJson(body);
//       // print('SUCCESS getTerms: ${jsonEncode(terms)}');
//       return terms;
//     } else {
//       print('ERROR getTerms: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<Privacy?> getPrivacy({required String language}) async {
//     http.Response response = await _client.get(Uri.parse(ApiHelper.PRIVACY),
//         headers: ApiHelper.langHeader(language: language));
//     print('CODE: ${response.statusCode}');
//     print('BODY: ${response.body}');
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       Privacy privacy = Privacy.fromJson(body);
//       // print('SUCCESS getPrivacy: ${jsonEncode(privacy)}');
//       return privacy;
//     } else {
//       print('ERROR getPrivacy: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<Faqs?> getFaqs({required String language}) async {
//     http.Response response = await _client.get(Uri.parse(ApiHelper.FAQS),
//         headers: ApiHelper.langHeader(language: language));
//     if (response.statusCode == 200) {
//       var body = jsonDecode(response.body);
//       Faqs faqs = Faqs.fromJson(body);
//       print('SUCCESS getFaqs: ${jsonEncode(faqs)}');
//       return faqs;
//     } else {
//       print('ERROR getFaqs: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<ContactUs?> contactUs(
//       {required String language,
//       required String name,
//       required String email,
//       required String address,
//       required String message}) async {
//     http.Response response = await _client.post(Uri.parse(ApiHelper.CONTACT_US),
//         headers: ApiHelper.headers(language: language),
//         body: jsonEncode(<String, dynamic>{
//           'name': name,
//           'email': email,
//           'address': address,
//           'message': message
//         }),encoding: Encoding.getByName('utf-8'));
//     if(response.statusCode == 200 || response.statusCode == 201){
//       var body = jsonDecode(response.body);
//       ContactUs contactUs = ContactUs.fromJson(body);
//       print('SUCCESS: contactUs: ${jsonEncode(contactUs)}');
//       return contactUs;
//     }else {
//       print('ERROR contcatUs: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
//
//   static Future<WorkerRequests?> getWorkerRequests({required String token, required String language}) async {
//     http.Response response = await _client.get(Uri.parse(ApiHelper.JOB_REQUEST),
//     headers: ApiHelper.allHeader(token: token, language: language));
//     print('CODE: ${response.statusCode}');
//     print('BODY: ${jsonDecode(response.body)}');
//     if(response.statusCode == 200){
//       var body = jsonDecode(response.body);
//       WorkerRequests requests = WorkerRequests.fromJson(body);
//       print('SUCCESS getWorkRequest: ${jsonEncode(requests)}');
//       return requests;
//     }else {
//       print('ERROR getWorkerRequests: ${jsonDecode(response.body)}');
//       return null;
//     }
//   }
// }
