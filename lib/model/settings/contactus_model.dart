class ContactusModel {
  bool? status;
  String? msg;
  Result? result;

  ContactusModel({this.status, this.msg, this.result});

  ContactusModel.fromJson(Map<String, dynamic> json) {
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
  String? email;
  String? message;
  String? mobile;
  int? isReply;
  String? name;
  String? updatedAt;
  String? createdAt;
  int? id;

  Result(
      {this.email,
        this.message,
        this.mobile,
        this.isReply,
        this.name,
        this.updatedAt,
        this.createdAt,
        this.id});

  Result.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    message = json['message'];
    mobile = json['mobile'];
    isReply = json['is_reply'];
    name = json['name'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['message'] = this.message;
    data['mobile'] = this.mobile;
    data['is_reply'] = this.isReply;
    data['name'] = this.name;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}