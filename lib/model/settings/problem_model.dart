class ProblemModel {
  bool? status;
  String? msg;
  Result? result;

  ProblemModel({this.status, this.msg, this.result});

  ProblemModel.fromJson(Map<String, dynamic> json) {
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
  int? customerId;
  String? subject;
  String? message;
  String? updatedAt;
  String? createdAt;
  int? id;

  Result(
      {this.customerId,
      this.subject,
      this.message,
      this.updatedAt,
      this.createdAt,
      this.id});

  Result.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    subject = json['subject'];
    message = json['message'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['subject'] = this.subject;
    data['message'] = this.message;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
