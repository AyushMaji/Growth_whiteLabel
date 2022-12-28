class AchieveIdealLife {
  String? msg;
  int? statuscode;

  AchieveIdealLife({this.msg, this.statuscode});

  AchieveIdealLife.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statuscode = json['statuscode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['statuscode'] = statuscode;
    return data;
  }
}
