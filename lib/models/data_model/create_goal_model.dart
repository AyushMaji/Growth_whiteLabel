class CreateGoalModel {
  String? msg;
  int? statuscode;
  Data? data;

  CreateGoalModel({this.msg, this.statuscode, this.data});

  CreateGoalModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statuscode = json['statuscode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['statuscode'] = this.statuscode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? happyLifeSurveyId;
  String? goal;
  String? goalCategory;
  String? dailyAffirmation;
  String? promiseToAchieveGoal;
  String? firstStepToAchieveGoal;
  String? secondStepToAchieveGoal;
  String? thirdStepToAchieveGoal;
  String? fourthStepToAchieveGoal;
  String? fifthStepToAchieveGoal;
  String? goalStartDate;
  String? goalEndDate;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.happyLifeSurveyId,
      this.goal,
      this.goalCategory,
      this.dailyAffirmation,
      this.promiseToAchieveGoal,
      this.firstStepToAchieveGoal,
      this.secondStepToAchieveGoal,
      this.thirdStepToAchieveGoal,
      this.fourthStepToAchieveGoal,
      this.fifthStepToAchieveGoal,
      this.goalStartDate,
      this.goalEndDate,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    happyLifeSurveyId = json['happy_life_survey_id'];
    goal = json['goal'];
    goalCategory = json['goal_category'];
    dailyAffirmation = json['daily_affirmation'];
    promiseToAchieveGoal = json['promise_to_achieve_goal'];
    firstStepToAchieveGoal = json['first_step_to_achieve_goal'];
    secondStepToAchieveGoal = json['second_step_to_achieve_goal'];
    thirdStepToAchieveGoal = json['third_step_to_achieve_goal'];
    fourthStepToAchieveGoal = json['fourth_step_to_achieve_goal'];
    fifthStepToAchieveGoal = json['fifth_step_to_achieve_goal'];
    goalStartDate = json['goal_start_date'];
    goalEndDate = json['goal_end_date'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['happy_life_survey_id'] = this.happyLifeSurveyId;
    data['goal'] = this.goal;
    data['goal_category'] = this.goalCategory;
    data['daily_affirmation'] = this.dailyAffirmation;
    data['promise_to_achieve_goal'] = this.promiseToAchieveGoal;
    data['first_step_to_achieve_goal'] = this.firstStepToAchieveGoal;
    data['second_step_to_achieve_goal'] = this.secondStepToAchieveGoal;
    data['third_step_to_achieve_goal'] = this.thirdStepToAchieveGoal;
    data['fourth_step_to_achieve_goal'] = this.fourthStepToAchieveGoal;
    data['fifth_step_to_achieve_goal'] = this.fifthStepToAchieveGoal;
    data['goal_start_date'] = this.goalStartDate;
    data['goal_end_date'] = this.goalEndDate;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
