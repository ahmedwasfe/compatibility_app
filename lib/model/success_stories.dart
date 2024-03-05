import 'package:compatibility_app/model/post/blog.dart';
import 'package:compatibility_app/model/settings/countries.dart';
import 'package:compatibility_app/model/user.dart';

class SuccessStories {
  bool? status;
  String? msg;
  Result? result;

  SuccessStories({this.status, this.msg, this.result});

  SuccessStories.fromJson(Map<String, dynamic> json) {
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
  List<SuccessStoriesUsers>? users;
  Pagination? pagination;

  Result({this.users, this.pagination});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <SuccessStoriesUsers>[];
      json['users'].forEach((v) {
        users!.add(new SuccessStoriesUsers.fromJson(v));
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

class SuccessStoriesUsers {
  int? id;
  String? image;
  String? title;
  String? description;
  CountryData? countryId;
  String? manImage;
  String? manName;
  String? manAge;
  String? femaleImage;
  String? manText;
  String? femaleName;
  String? femaleAge;
  String? femaleText;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;
  String? femaleImageUrl;
  String? maleImageUrl;

  SuccessStoriesUsers(
      {this.id,
        this.image,
        this.title,
        this.description,
        this.countryId,
        this.manImage,
        this.manName,
        this.manAge,
        this.femaleImage,
        this.manText,
        this.femaleName,
        this.femaleAge,
        this.femaleText,
        this.createdAt,
        this.updatedAt,
        this.imageUrl,
        this.femaleImageUrl,
        this.maleImageUrl});

  SuccessStoriesUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    countryId = json['country_id'] != null
        ? new CountryData.fromJson(json['country_id'])
        : null;
    manImage = json['man_image'];
    manName = json['man_name'];
    manAge = json['man_age'];
    femaleImage = json['female_image'];
    manText = json['man_text'];
    femaleName = json['female_name'];
    femaleAge = json['female_age'];
    femaleText = json['female_text'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
    femaleImageUrl = json['female_image_url'];
    maleImageUrl = json['male_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.countryId != null) {
      data['country_id'] = this.countryId!.toJson();
    }
    data['man_image'] = this.manImage;
    data['man_name'] = this.manName;
    data['man_age'] = this.manAge;
    data['female_image'] = this.femaleImage;
    data['man_text'] = this.manText;
    data['female_name'] = this.femaleName;
    data['female_age'] = this.femaleAge;
    data['female_text'] = this.femaleText;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    data['female_image_url'] = this.femaleImageUrl;
    data['male_image_url'] = this.maleImageUrl;
    return data;
  }
}



