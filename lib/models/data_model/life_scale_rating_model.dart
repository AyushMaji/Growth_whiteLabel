class LifeScaleRatingModel {
  String? msg;
  int? statuscode;

  LifeScaleRatingModel({this.msg, this.statuscode});

  LifeScaleRatingModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statuscode = json['statuscode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['msg'] = msg;
    data['statuscode'] = statuscode;
    return data;
  }
}
