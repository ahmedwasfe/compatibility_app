class DeleteNotifactions {
  bool? status;
  String? msg;
  List<dynamic>? result;

  DeleteNotifactions({this.status, this.msg, this.result});

  DeleteNotifactions.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['result'] != null) {
      result = <Null>[];
      json['result'].forEach((v) {
        result!.add(new Object() as Null);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}