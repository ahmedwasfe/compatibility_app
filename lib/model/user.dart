class User {
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
  String? isBeard;
  String? isSmoking;
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
  dynamic smsVerify;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.uuid,
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
        this.isBeard,
        this.isSmoking,
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
        this.smsVerify,
        this.updatedAt,
        this.createdAt,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
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
    isBeard = json['is_beard'];
    isSmoking = json['is_smoking'];
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
    smsVerify = json['sms_verify'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = uuid;
    data['status'] = status;
    data['marriage_type_id'] = marriageTypeId;
    data['age'] = age;
    data['children_num'] = childrenNum;
    data['weight'] = weight;
    data['height'] = height;
    data['skin_id'] = skinId;
    data['physique_id'] = physiqueId;
    data['religious_commitment_id'] = religiousCommitmentId;
    data['prayer_id'] = prayerId;
    data['type'] = type;
    data['is_beard'] = isBeard;
    data['is_smoking'] = isSmoking;
    data['educational_id'] = educationalId;
    data['financial_id'] = financialId;
    data['education_field_id'] = educationFieldId;
    data['job'] = job;
    data['life_partner_bio'] = lifePartnerBio;
    data['nationality_id'] = nationalityId;
    data['country_id'] = countryId;
    data['city_id'] = cityId;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    data['full_name'] = fullName;
    data['mobile'] = mobile;
    data['bio'] = bio;
    data['sms_verify'] = smsVerify;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}