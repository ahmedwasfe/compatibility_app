class Prayer {
  bool? status;
  String? msg;
  Result? result;

  Prayer({this.status, this.msg, this.result});

  Prayer.fromJson(Map<String, dynamic> json) {
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
  List<PrayerData>? prayer;

  Result({this.prayer});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['prayer'] != null) {
      prayer = <PrayerData>[];
      json['prayer'].forEach((v) {
        prayer!.add(new PrayerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.prayer != null) {
      data['prayer'] = this.prayer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrayerData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  PrayerData({this.id, this.name, this.createdAt, this.updatedAt});

  PrayerData.fromJson(Map<String, dynamic> json) {
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
