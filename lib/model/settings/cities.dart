class Cities {
  bool? status;
  String? msg;
  Result? result;

  Cities({this.status, this.msg, this.result});

  Cities.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  List<CityData>? cities;

  Result({this.cities});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['city'] != null) {
      cities = <CityData>[];
      json['city'].forEach((v) {
        cities!.add(CityData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.cities != null) {
      data['city'] = this.cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityData {
  int? id;
  String? name;
  String? countryId;
  String? createdAt;
  String? updatedAt;

  CityData({this.id, this.name, this.countryId, this.createdAt, this.updatedAt});

  CityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
