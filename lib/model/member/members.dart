import 'package:compatibility_app/model/pagination.dart';
import 'package:compatibility_app/model/settings/cities.dart';
import 'package:compatibility_app/model/settings/countries.dart';
import 'package:compatibility_app/model/user.dart';

class Memebers {
  bool? status;
  String? msg;
  Result? result;

  Memebers({this.status, this.msg, this.result});

  Memebers.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  List<MemeberData>? users;
  Pagination? pagination;

  Result({this.users, this.pagination});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <MemeberData>[];
      json['users'].forEach((v) {
        users!.add(new MemeberData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class MemeberData {
  int? id;
  String? uuid;
  String? status;
  String? age;
  String? childrenNum;
  String? weight;
  String? height;
  String? type;
  String? isSmoking;
  String? isBeard;
  String? job;
  String? email;
  String? username;
  String? fullName;
  String? mobile;
  String? bio;
  String? smsCode;
  int? smsVerify;
  dynamic termStatus;
  String? lifePartnerBio;
  CommonModel? marriageTypeId;
  CommonModel? skin;
  CommonModel? physique;
  CommonModel? religiousCommitment;
  CommonModel? prayer;
  CommonModel? educational;
  CommonModel? financial;
  CommonModel? educationField;
  CountryData? nationality;
  CountryData? country;
  CityData? city;
  String? deviceType;
  String? fcmToken;
  List<CustomerAllowPhoto>? customerAllowPhoto;

  MemeberData(
      {this.id,
        this.uuid,
        this.status,
        this.age,
        this.childrenNum,
        this.weight,
        this.height,
        this.type,
        this.isSmoking,
        this.isBeard,
        this.job,
        this.email,
        this.username,
        this.fullName,
        this.mobile,
        this.bio,
        this.smsCode,
        this.smsVerify,
        this.termStatus,
        this.lifePartnerBio,
        this.marriageTypeId,
        this.skin,
        this.physique,
        this.religiousCommitment,
        this.prayer,
        this.educational,
        this.financial,
        this.educationField,
        this.nationality,
        this.country,
        this.city,
        this.deviceType,
        this.fcmToken,
        this.customerAllowPhoto});

  MemeberData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    status = json['status'];
    age = json['age'];
    childrenNum = json['children_num'];
    weight = json['weight'];
    height = json['height'];
    type = json['type'];
    isSmoking = json['is_smoking'];
    isBeard = json['is_beard'];
    job = json['job'];
    email = json['email'];
    username = json['username'];
    fullName = json['full_name'];
    mobile = json['mobile'];
    bio = json['bio'];
    smsCode = json['sms_code'];
    smsVerify = json['sms_verify'];
    termStatus = json['term_status'];
    lifePartnerBio = json['life_partner_bio'];
    marriageTypeId = json['marriage_type_id'] != null
        ? new CommonModel.fromJson(json['marriage_type_id'])
        : null;
    skin =
    json['skin'] != null ? new CommonModel.fromJson(json['skin']) : null;
    physique = json['physique'] != null
        ? new CommonModel.fromJson(json['physique'])
        : null;
    religiousCommitment = json['religious_commitment'] != null
        ? new CommonModel.fromJson(json['religious_commitment'])
        : null;
    prayer = json['prayer'] != null
        ? new CommonModel.fromJson(json['prayer'])
        : null;
    educational = json['educational'] != null
        ? new CommonModel.fromJson(json['educational'])
        : null;
    financial = json['financial'] != null
        ? new CommonModel.fromJson(json['financial'])
        : null;
    educationField = json['education_field'] != null
        ? new CommonModel.fromJson(json['education_field'])
        : null;
    nationality = json['nationality'] != null
        ? new CountryData.fromJson(json['nationality'])
        : null;
    country = json['country'] != null
        ? new CountryData.fromJson(json['country'])
        : null;
    city = json['city'] != null ? new CityData.fromJson(json['city']) : null;
    deviceType = json['device_type'];
    fcmToken = json['fcm_token'];
    if (json['customer_allow_photo'] != null) {
      customerAllowPhoto = <CustomerAllowPhoto>[];
      json['customer_allow_photo'].forEach((v) {
        customerAllowPhoto!.add(new CustomerAllowPhoto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['status'] = this.status;
    data['age'] = this.age;
    data['children_num'] = this.childrenNum;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['type'] = this.type;
    data['is_smoking'] = this.isSmoking;
    data['is_beard'] = this.isBeard;
    data['job'] = this.job;
    data['email'] = this.email;
    data['username'] = this.username;
    data['full_name'] = this.fullName;
    data['mobile'] = this.mobile;
    data['bio'] = this.bio;
    data['sms_code'] = this.smsCode;
    data['sms_verify'] = this.smsVerify;
    data['term_status'] = this.termStatus;
    data['life_partner_bio'] = this.lifePartnerBio;
    if (this.marriageTypeId != null) {
      data['marriage_type_id'] = this.marriageTypeId!.toJson();
    }
    if (this.skin != null) {
      data['skin'] = this.skin!.toJson();
    }
    if (this.physique != null) {
      data['physique'] = this.physique!.toJson();
    }
    if (this.religiousCommitment != null) {
      data['religious_commitment'] = this.religiousCommitment!.toJson();
    }
    if (this.prayer != null) {
      data['prayer'] = this.prayer!.toJson();
    }
    if (this.educational != null) {
      data['educational'] = this.educational!.toJson();
    }
    if (this.financial != null) {
      data['financial'] = this.financial!.toJson();
    }
    if (this.educationField != null) {
      data['education_field'] = this.educationField!.toJson();
    }
    if (this.nationality != null) {
      data['nationality'] = this.nationality!.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['device_type'] = this.deviceType;
    data['fcm_token'] = this.fcmToken;
    if (this.customerAllowPhoto != null) {
      data['customer_allow_photo'] =
          this.customerAllowPhoto!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
