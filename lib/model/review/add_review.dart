class AddReview {
  bool? status;
  String? msg;
  Result? result;

  AddReview({this.status, this.msg, this.result});

  AddReview.fromJson(Map<String, dynamic> json) {
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
  Review? review;

  Result({this.review});

  Result.fromJson(Map<String, dynamic> json) {
    review =
    json['review'] != null ? new Review.fromJson(json['review']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.review != null) {
      data['review'] = this.review!.toJson();
    }
    return data;
  }
}

class Review {
  String? rate;
  Customer? customer;

  Review({this.rate, this.customer});

  Review.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
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
  String? isAllowShowPhoto;
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
