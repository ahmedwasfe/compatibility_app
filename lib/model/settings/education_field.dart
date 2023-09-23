class EducationField {
  bool? status;
  String? msg;
  Result? result;

  EducationField({this.status, this.msg, this.result});

  EducationField.fromJson(Map<String, dynamic> json) {
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
  List<EducationFieldData>? educationField;

  Result({this.educationField});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['education_field'] != null) {
      educationField = <EducationFieldData>[];
      json['education_field'].forEach((v) {
        educationField!.add(EducationFieldData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (educationField != null) {
      data['education_field'] =
          educationField!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EducationFieldData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  EducationFieldData({this.id, this.name, this.createdAt, this.updatedAt});

  EducationFieldData.fromJson(Map<String, dynamic> json) {
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
