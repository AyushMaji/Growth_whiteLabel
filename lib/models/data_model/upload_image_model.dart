class UploadImageModel {
  String? msg;
  int? statuscode;
  Data? data;

  UploadImageModel({this.msg, this.statuscode, this.data});

  UploadImageModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statuscode = json['statuscode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
  GoalPlanning? goalPlanning;

  Data({this.goalPlanning});

  Data.fromJson(Map<String, dynamic> json) {
    goalPlanning = json['goal_planning'] != null
        ? GoalPlanning.fromJson(json['goal_planning'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (goalPlanning != null) {
      data['goal_planning'] = goalPlanning!.toJson();
    }
    return data;
  }
}

class GoalPlanning {
  int? id;
  String? userId;
  String? goal;
  String? dailyAffirmation;
  String? promiseToAchieveGoal;
  String? firstStepToAchieveGoal;
  String? secondStepToAchieveGoal;
  String? thirdStepToAchieveGoal;
  String? fourthStepToAchieveGoal;
  String? fifthStepToAchieveGoal;
  String? goalStartDate;
  String? goalEndDate;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  GoalPlanning({
    this.id,
    this.userId,
    this.goal,
    this.dailyAffirmation,
    this.promiseToAchieveGoal,
    this.firstStepToAchieveGoal,
    this.secondStepToAchieveGoal,
    this.thirdStepToAchieveGoal,
    this.fourthStepToAchieveGoal,
    this.fifthStepToAchieveGoal,
    this.goalStartDate,
    this.goalEndDate,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  GoalPlanning.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    goal = json['goal'];
    dailyAffirmation = json['daily_affirmation'];
    promiseToAchieveGoal = json['promise_to_achieve_goal'];
    firstStepToAchieveGoal = json['first_step_to_achieve_goal'];
    secondStepToAchieveGoal = json['second_step_to_achieve_goal'];
    thirdStepToAchieveGoal = json['third_step_to_achieve_goal'];
    fourthStepToAchieveGoal = json['fourth_step_to_achieve_goal'];
    fifthStepToAchieveGoal = json['fifth_step_to_achieve_goal'];
    goalStartDate = json['goal_start_date'];
    goalEndDate = json['goal_end_date'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['goal'] = goal;
    data['daily_affirmation'] = dailyAffirmation;
    data['promise_to_achieve_goal'] = promiseToAchieveGoal;
    data['first_step_to_achieve_goal'] = firstStepToAchieveGoal;
    data['second_step_to_achieve_goal'] = secondStepToAchieveGoal;
    data['third_step_to_achieve_goal'] = thirdStepToAchieveGoal;
    data['fourth_step_to_achieve_goal'] = fourthStepToAchieveGoal;
    data['fifth_step_to_achieve_goal'] = fifthStepToAchieveGoal;
    data['goal_start_date'] = goalStartDate;
    data['goal_end_date'] = goalEndDate;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
