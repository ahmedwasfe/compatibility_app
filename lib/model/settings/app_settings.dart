class AppSettings {
  bool? status;
  String? msg;
  Result? result;

  AppSettings({this.status, this.msg, this.result});

  AppSettings.fromJson(Map<String, dynamic> json) {
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
  AboutUs? aboutUs;
  AboutUs? condition;
  Policy? policy;
  Setting? setting;

  Result({this.aboutUs, this.condition, this.policy, this.setting});

  Result.fromJson(Map<String, dynamic> json) {
    aboutUs = json['about_us'] != null
        ? new AboutUs.fromJson(json['about_us'])
        : null;
    condition = json['condition'] != null
        ? new AboutUs.fromJson(json['condition'])
        : null;
    policy =
    json['policy'] != null ? new Policy.fromJson(json['policy']) : null;
    setting =
    json['setting'] != null ? new Setting.fromJson(json['setting']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aboutUs != null) {
      data['about_us'] = this.aboutUs!.toJson();
    }
    if (this.condition != null) {
      data['condition'] = this.condition!.toJson();
    }
    if (this.policy != null) {
      data['policy'] = this.policy!.toJson();
    }
    if (this.setting != null) {
      data['setting'] = this.setting!.toJson();
    }
    return data;
  }
}

class AboutUs {
  int? id;
  String? title;
  String? type;
  String? description;
  Null? image;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;
  String? name;

  AboutUs(
      {this.id,
        this.title,
        this.type,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.imageUrl,
        this.name});

  AboutUs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    data['name'] = this.name;
    return data;
  }
}

class Policy {
  int? id;
  String? title;
  String? type;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;
  String? name;

  Policy(
      {this.id,
        this.title,
        this.type,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.imageUrl,
        this.name});

  Policy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    data['name'] = this.name;
    return data;
  }
}

class Setting {
  int? id;
  String? websiteName;
  String? email;
  String? address1;
  String? address2;
  String? seoKeywords;
  String? seoDescription;
  String? phone;
  String? mobile1;
  String? mobile2;
  String? facebook;
  String? instagram;
  String? whatsapp;
  String? twitter;
  String? linkedIn;
  String? logo;
  String? favicon;
  Null? createdAt;
  String? updatedAt;
  String? logoUrl;
  String? faviconUrl;

  Setting(
      {this.id,
        this.websiteName,
        this.email,
        this.address1,
        this.address2,
        this.seoKeywords,
        this.seoDescription,
        this.phone,
        this.mobile1,
        this.mobile2,
        this.facebook,
        this.instagram,
        this.whatsapp,
        this.twitter,
        this.linkedIn,
        this.logo,
        this.favicon,
        this.createdAt,
        this.updatedAt,
        this.logoUrl,
        this.faviconUrl});

  Setting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    websiteName = json['website_name'];
    email = json['email'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    seoKeywords = json['seo_keywords'];
    seoDescription = json['seo_description'];
    phone = json['phone'];
    mobile1 = json['mobile_1'];
    mobile2 = json['mobile_2'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    whatsapp = json['whatsapp'];
    twitter = json['twitter'];
    linkedIn = json['linked_in'];
    logo = json['logo'];
    favicon = json['favicon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    logoUrl = json['logo_url'];
    faviconUrl = json['favicon_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['website_name'] = this.websiteName;
    data['email'] = this.email;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['seo_keywords'] = this.seoKeywords;
    data['seo_description'] = this.seoDescription;
    data['phone'] = this.phone;
    data['mobile_1'] = this.mobile1;
    data['mobile_2'] = this.mobile2;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['whatsapp'] = this.whatsapp;
    data['twitter'] = this.twitter;
    data['linked_in'] = this.linkedIn;
    data['logo'] = this.logo;
    data['favicon'] = this.favicon;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['logo_url'] = this.logoUrl;
    data['favicon_url'] = this.faviconUrl;
    return data;
  }
}