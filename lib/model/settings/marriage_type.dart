class MarriageType {
  bool? status;
  String? msg;
  Result? result;

  MarriageType({this.status, this.msg, this.result});

  MarriageType.fromJson(Map<String, dynamic> json) {
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
  List<MarriageTypeData>? marriageType;

  Result({this.marriageType});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['marriage_type'] != null) {
      marriageType = <MarriageTypeData>[];
      json['marriage_type'].forEach((v) {
        marriageType!.add(MarriageTypeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (marriageType != null) {
      data['marriage_type'] =
          marriageType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MarriageTypeData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  MarriageTypeData({this.id, this.name, this.createdAt, this.updatedAt});

  MarriageTypeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
