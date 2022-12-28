class AffirmationModel {
  String? msg;
  int? statuscode;
  List<Data>? data;

  AffirmationModel({this.msg, this.statuscode, this.data});

  AffirmationModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statuscode = json['statuscode'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['msg'] = msg;
    data['statuscode'] = statuscode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? affirmation;
  String? createdAt;
  String? updatedAt;

  Data({this.affirmation, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    affirmation = json['affirmation'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['affirmation'] = affirmation;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}