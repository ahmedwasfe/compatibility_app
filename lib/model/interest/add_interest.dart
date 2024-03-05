class AddInterest {
  bool? status;
  String? msg;
  dynamic result;

  AddInterest({this.status, this.msg, this.result});

  AddInterest.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['result'] = this.result;
    return data;
  }
}
