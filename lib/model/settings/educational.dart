class Educational {
  bool? status;
  String? msg;
  Result? result;

  Educational({this.status, this.msg, this.result});

  Educational.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  List<EducationalData>? educational;

  Result({this.educational});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['educational'] != null) {
      educational = <EducationalData>[];
      json['educational'].forEach((v) {
        educational!.add(EducationalData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (educational != null) {
      data['educational'] = educational!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EducationalData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  EducationalData({this.id, this.name, this.createdAt, this.updatedAt});

  EducationalData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
