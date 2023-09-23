class Financial {
  bool? status;
  String? msg;
  Result? result;

  Financial({this.status, this.msg, this.result});

  Financial.fromJson(Map<String, dynamic> json) {
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
  List<FinancialData>? financial;

  Result({this.financial});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['financial'] != null) {
      financial = <FinancialData>[];
      json['financial'].forEach((v) {
        financial!.add(FinancialData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (financial != null) {
      data['financial'] = financial!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FinancialData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  FinancialData({this.id, this.name, this.createdAt, this.updatedAt});

  FinancialData.fromJson(Map<String, dynamic> json) {
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
