import 'package:compatibility_app/model/pagination.dart';

class Notifications {
  bool? status;
  String? msg;
  Result? result;

  Notifications({this.status, this.msg, this.result});

  Notifications.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['msg'] = msg;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  List<NotificationData>? notification;
  Pagination? pagination;

  Result({this.notification, this.pagination});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['notification'] != null) {
      notification = <NotificationData>[];
      json['notification'].forEach((v) {
        notification!.add(NotificationData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (notification != null) {
      data['notification'] = notification!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class NotificationData {
  String? id;
  String? notificationImageUrl;
  String? notificationText;
  String? type;
  int? customerId;
  dynamic authId;
  int? isRead;
  String? time;
  String? date;

  NotificationData(
      {this.id,
        this.notificationImageUrl,
        this.notificationText,
        this.type,
        this.customerId,
        this.authId,
        this.isRead,
        this.time,
        this.date});

  NotificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notificationImageUrl = json['notification_image_url'];
    notificationText = json['notification_text'];
    type = json['type'];
    customerId = json['customer_id'];
    authId = json['auth_id'];
    isRead = json['is_read'];
    time = json['time'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['notification_image_url'] = notificationImageUrl;
    data['notification_text'] = notificationText;
    data['type'] = type;
    data['customer_id'] = customerId;
    data['auth_id'] = authId;
    data['is_read'] = isRead;
    data['time'] = time;
    data['date'] = date;
    return data;
  }
}

