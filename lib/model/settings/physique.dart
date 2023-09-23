class Physique {
  bool? status;
  String? msg;
  Result? result;

  Physique({this.status, this.msg, this.result});

  Physique.fromJson(Map<String, dynamic> json) {
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
  List<PhysiqueData>? physique;

  Result({this.physique});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['physique'] != null) {
      physique = <PhysiqueData>[];
      json['physique'].forEach((v) {
        physique!.add(new PhysiqueData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.physique != null) {
      data['physique'] = this.physique!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PhysiqueData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  PhysiqueData({this.id, this.name, this.createdAt, this.updatedAt});

  PhysiqueData.fromJson(Map<String, dynamic> json) {
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
