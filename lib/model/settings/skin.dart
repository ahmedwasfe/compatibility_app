class Skin {
  bool? status;
  String? msg;
  Result? result;

  Skin({this.status, this.msg, this.result});

  Skin.fromJson(Map<String, dynamic> json) {
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
  List<SkinData>? skin;

  Result({this.skin});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['skin'] != null) {
      skin = <SkinData>[];
      json['skin'].forEach((v) {
        skin!.add(new SkinData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.skin != null) {
      data['skin'] = this.skin!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SkinData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  SkinData({this.id, this.name, this.createdAt, this.updatedAt});

  SkinData.fromJson(Map<String, dynamic> json) {
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
