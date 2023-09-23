class ReligiousCommitment {
  bool? status;
  String? msg;
  Result? result;

  ReligiousCommitment({this.status, this.msg, this.result});

  ReligiousCommitment.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['msg'] = msg;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  List<ReligiousCommitmentData>? religiousCommitment;

  Result({this.religiousCommitment});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['religious_commitment'] != null) {
      religiousCommitment = <ReligiousCommitmentData>[];
      json['religious_commitment'].forEach((v) {
        religiousCommitment!.add(new ReligiousCommitmentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (religiousCommitment != null) {
      data['religious_commitment'] =
          religiousCommitment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReligiousCommitmentData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  ReligiousCommitmentData({this.id, this.name, this.createdAt, this.updatedAt});

  ReligiousCommitmentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
