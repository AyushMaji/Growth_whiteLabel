class GoalDataModel {
  String? msg;
  int? statuscode;
  Data? data;

  GoalDataModel({this.msg, this.statuscode, this.data});

  GoalDataModel.fromJson(Map<String, dynamic> json) {
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
  List<Goals>? goals;

  Data({this.goals});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['goals'] != null) {
      goals = <Goals>[];
      json['goals'].forEach((v) {
        goals!.add( Goals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (goals != null) {
      data['goals'] = goals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Goals {
  int? id;
  String? userId;
  String? response1;
  String? response2;
  String? response3;
  String? response4;
  String? goalCategoryId;
  String? achieveGoal;
  String? priceUnachieveGoal;
  String? howImportantIsGoal;
  String? worthEffortToAchieve;
  String? canYouAchieveIt;
  String? qualitiesToSupportGoal;
  String? qualitiesToDevelopToAchieveGoal;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? happyLifeSurveyId;
  String? goalCategory;
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

  Goals(
      {this.id,
      this.userId,
      this.response1,
      this.response2,
      this.response3,
      this.response4,
      this.goalCategoryId,
      this.achieveGoal,
      this.priceUnachieveGoal,
      this.howImportantIsGoal,
      this.worthEffortToAchieve,
      this.canYouAchieveIt,
      this.qualitiesToSupportGoal,
      this.qualitiesToDevelopToAchieveGoal,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.happyLifeSurveyId,
      this.goalCategory,
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
      this.image});

  Goals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    response1 = json['response1'];
    response2 = json['response2'];
    response3 = json['response3'];
    response4 = json['response4'];
    goalCategoryId = json['goal_category_id'];
    achieveGoal = json['achieve_goal'];
    priceUnachieveGoal = json['price_unachieve_goal'];
    howImportantIsGoal = json['how_important_is_goal'];
    worthEffortToAchieve = json['worth_effort_to_achieve'];
    canYouAchieveIt = json['can_you_achieve_it'];
    qualitiesToSupportGoal = json['qualities_to_support_goal'];
    qualitiesToDevelopToAchieveGoal = json['qualities_to_develop_to_achieve_goal'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    happyLifeSurveyId = json['happy_life_survey_id'];
    goalCategory = json['goal_category'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['response1'] = response1;
    data['response2'] = response2;
    data['response3'] = response3;
    data['response4'] = response4;
    data['goal_category_id'] = goalCategoryId;
    data['achieve_goal'] = achieveGoal;
    data['price_unachieve_goal'] = priceUnachieveGoal;
    data['how_important_is_goal'] = howImportantIsGoal;
    data['worth_effort_to_achieve'] = worthEffortToAchieve;
    data['can_you_achieve_it'] = canYouAchieveIt;
    data['qualities_to_support_goal'] = qualitiesToSupportGoal;
    data['qualities_to_develop_to_achieve_goal'] = qualitiesToDevelopToAchieveGoal;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['happy_life_survey_id'] = happyLifeSurveyId;
    data['goal_category'] = goalCategory;
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
    return data;
  }
}
