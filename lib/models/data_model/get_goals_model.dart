class GetGoalsModel {
  String? msg;
  int? statuscode;
  Data? data;

  GetGoalsModel({this.msg, this.statuscode, this.data});

  GetGoalsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statuscode = json['statuscode'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['statuscode'] = statuscode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<GoalCategories>? goalCategories;

  Data({this.goalCategories});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['goal_categories'] != null) {
      goalCategories = <GoalCategories>[];
      json['goal_categories'].forEach((v) {
        goalCategories!.add( GoalCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (goalCategories != null) {
      data['goal_categories'] =
          goalCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GoalCategories {
  int? id;
  String? category;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  GoalCategories(
      {this.id, this.category, this.createdAt, this.updatedAt, this.deletedAt});

  GoalCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
