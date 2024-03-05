import 'package:compatibility_app/model/settings/cities.dart';
import 'package:compatibility_app/model/settings/countries.dart';

class User {
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
  dynamic smsCode;
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

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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

class CommonModel {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  CommonModel({this.id, this.name, this.createdAt, this.updatedAt});

  CommonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CustomerAllowPhoto {
  int? id;
  int? isAllowShowPhoto;
  String? imageUrl;
  Customer? customer;
  Customer? auth;

  CustomerAllowPhoto(
      {this.id,
        this.isAllowShowPhoto,
        this.imageUrl,
        this.customer,
        this.auth});

  CustomerAllowPhoto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isAllowShowPhoto = json['is_allow_show_photo'];
    imageUrl = json['image_url'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    auth = json['auth'] != null ? new Customer.fromJson(json['auth']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_allow_show_photo'] = this.isAllowShowPhoto;
    data['image_url'] = this.imageUrl;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.auth != null) {
      data['auth'] = this.auth!.toJson();
    }
    return data;
  }
}

class Customer {
  int? id;
  String? uuid;
  String? status;
  String? marriageTypeId;
  String? age;
  String? childrenNum;
  String? weight;
  String? height;
  String? skinId;
  String? physiqueId;
  String? religiousCommitmentId;
  String? prayerId;
  String? type;
  String? isSmoking;
  String? isBeard;
  String? educationalId;
  String? financialId;
  String? educationFieldId;
  String? job;
  String? lifePartnerBio;
  String? nationalityId;
  String? countryId;
  String? cityId;
  String? email;
  String? username;
  String? password;
  String? fullName;
  String? mobile;
  String? bio;
  String? smsCode;
  String? smsVerify;
  dynamic termStatus;
  String? createdAt;
  String? updatedAt;
  String? image;
  dynamic isAllowShowPhoto;
  String? fcmToken;
  String? deviceType;
  String? imageUrl;

  Customer(
      {this.id,
        this.uuid,
        this.status,
        this.marriageTypeId,
        this.age,
        this.childrenNum,
        this.weight,
        this.height,
        this.skinId,
        this.physiqueId,
        this.religiousCommitmentId,
        this.prayerId,
        this.type,
        this.isSmoking,
        this.isBeard,
        this.educationalId,
        this.financialId,
        this.educationFieldId,
        this.job,
        this.lifePartnerBio,
        this.nationalityId,
        this.countryId,
        this.cityId,
        this.email,
        this.username,
        this.password,
        this.fullName,
        this.mobile,
        this.bio,
        this.smsCode,
        this.smsVerify,
        this.termStatus,
        this.createdAt,
        this.updatedAt,
        this.image,
        this.isAllowShowPhoto,
        this.fcmToken,
        this.deviceType,
        this.imageUrl});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    status = json['status'];
    marriageTypeId = json['marriage_type_id'];
    age = json['age'];
    childrenNum = json['children_num'];
    weight = json['weight'];
    height = json['height'];
    skinId = json['skin_id'];
    physiqueId = json['physique_id'];
    religiousCommitmentId = json['religious_commitment_id'];
    prayerId = json['prayer_id'];
    type = json['type'];
    isSmoking = json['is_smoking'];
    isBeard = json['is_beard'];
    educationalId = json['educational_id'];
    financialId = json['financial_id'];
    educationFieldId = json['education_field_id'];
    job = json['job'];
    lifePartnerBio = json['life_partner_bio'];
    nationalityId = json['nationality_id'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    fullName = json['full_name'];
    mobile = json['mobile'];
    bio = json['bio'];
    smsCode = json['sms_code'];
    smsVerify = json['sms_verify'];
    termStatus = json['term_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    isAllowShowPhoto = json['is_allow_show_photo'];
    fcmToken = json['fcm_token'];
    deviceType = json['device_type'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['status'] = this.status;
    data['marriage_type_id'] = this.marriageTypeId;
    data['age'] = this.age;
    data['children_num'] = this.childrenNum;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['skin_id'] = this.skinId;
    data['physique_id'] = this.physiqueId;
    data['religious_commitment_id'] = this.religiousCommitmentId;
    data['prayer_id'] = this.prayerId;
    data['type'] = this.type;
    data['is_smoking'] = this.isSmoking;
    data['is_beard'] = this.isBeard;
    data['educational_id'] = this.educationalId;
    data['financial_id'] = this.financialId;
    data['education_field_id'] = this.educationFieldId;
    data['job'] = this.job;
    data['life_partner_bio'] = this.lifePartnerBio;
    data['nationality_id'] = this.nationalityId;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    data['full_name'] = this.fullName;
    data['mobile'] = this.mobile;
    data['bio'] = this.bio;
    data['sms_code'] = this.smsCode;
    data['sms_verify'] = this.smsVerify;
    data['term_status'] = this.termStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    data['is_allow_show_photo'] = this.isAllowShowPhoto;
    data['fcm_token'] = this.fcmToken;
    data['device_type'] = this.deviceType;
    data['image_url'] = this.imageUrl;
    return data;
  }
}