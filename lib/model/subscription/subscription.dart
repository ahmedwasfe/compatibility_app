import 'package:compatibility_app/model/pagination.dart';

class Subscription {
  bool? status;
  String? msg;
  Result? result;

  Subscription({this.status, this.msg, this.result});

  Subscription.fromJson(Map<String, dynamic> json) {
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
  List<SubscriptionData>? subscription;
  Pagination? pagination;

  Result({this.subscription, this.pagination});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['subscription'] != null) {
      subscription = <SubscriptionData>[];
      json['subscription'].forEach((v) {
        subscription!.add(new SubscriptionData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subscription != null) {
      data['subscription'] = this.subscription!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class SubscriptionData {
  int? id;
  String? name;
  String? time;
  String? price;
  String? createdAt;
  String? updatedAt;

  SubscriptionData(
      {this.id,
        this.name,
        this.time,
        this.price,
        this.createdAt,
        this.updatedAt});

  SubscriptionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    time = json['time'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['time'] = this.time;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
