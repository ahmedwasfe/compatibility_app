import 'package:compatibility_app/model/pagination.dart';

class Sliders {
  bool? status;
  String? msg;
  Result? result;

  Sliders({this.status, this.msg, this.result});

  Sliders.fromJson(Map<String, dynamic> json) {
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
  List<SliderData>? sliders;
  Pagination? pagination;

  Result({this.sliders, this.pagination});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <SliderData>[];
      json['sliders'].forEach((v) {
        sliders!.add(new SliderData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sliders != null) {
      data['sliders'] = this.sliders!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class SliderData {
  int? id;
  String? image;
  String? link;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  SliderData(
      {this.id,
        this.image,
        this.link,
        this.createdAt,
        this.updatedAt,
        this.imageUrl});

  SliderData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    link = json['link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['link'] = this.link;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    return data;
  }
}

