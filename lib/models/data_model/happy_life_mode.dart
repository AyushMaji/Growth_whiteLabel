class HappyLifeModel {
  String? msg;
  int? statuscode;
  Data? data;

  HappyLifeModel({this.msg, this.statuscode, this.data});

  HappyLifeModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statuscode = json['statuscode'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['msg'] = msg;
    data['statuscode'] = statuscode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  HappyLifeSurvey? happyLifeSurvey;

  Data({this.happyLifeSurvey});

  Data.fromJson(Map<String, dynamic> json) {
    happyLifeSurvey = json['happy_life_survey'] != null
        ?  HappyLifeSurvey.fromJson(json['happy_life_survey'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (happyLifeSurvey != null) {
      data['happy_life_survey'] = happyLifeSurvey!.toJson();
    }
    return data;
  }
}

class HappyLifeSurvey {
  String? happyWithWeight;
  String? happyWithFitness;
  String? feelHealthy;
  String? achieveGoal;
  String? priceUnachieveGoal;
  String? howImportantIsGoal;
  String? canYouAchieveIt;
  String? qualitiesToSupportGoal;
  String? qualitiesToDevelopToAchieveGoal;
  String? worthEffortToAchieve;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  HappyLifeSurvey(
      {this.happyWithWeight,
      this.happyWithFitness,
      this.feelHealthy,
      this.achieveGoal,
      this.priceUnachieveGoal,
      this.howImportantIsGoal,
      this.canYouAchieveIt,
      this.qualitiesToSupportGoal,
      this.qualitiesToDevelopToAchieveGoal,
      this.worthEffortToAchieve,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id});

  HappyLifeSurvey.fromJson(Map<String, dynamic> json) {
    happyWithWeight = json['happy_with_weight'];
    happyWithFitness = json['happy_with_fitness'];
    feelHealthy = json['feel_healthy'];
    achieveGoal = json['achieve_goal'];
    priceUnachieveGoal = json['price_unachieve_goal'];
    howImportantIsGoal = json['how_important_is_goal'];
    canYouAchieveIt = json['can_you_achieve_it'];
    qualitiesToSupportGoal = json['qualities_to_support_goal'];
    qualitiesToDevelopToAchieveGoal = json['qualities_to_develop_to_achieve_goal'];
    worthEffortToAchieve = json['worth_effort_to_achieve'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['happy_with_weight'] = happyWithWeight;
    data['happy_with_fitness'] = happyWithFitness;
    data['feel_healthy'] = feelHealthy;
    data['achieve_goal'] = achieveGoal;
    data['price_unachieve_goal'] = priceUnachieveGoal;
    data['how_important_is_goal'] = howImportantIsGoal;
    data['can_you_achieve_it'] = canYouAchieveIt;
    data['qualities_to_support_goal'] = qualitiesToSupportGoal;
    data['qualities_to_develop_to_achieve_goal'] = qualitiesToDevelopToAchieveGoal;
    data['worth_effort_to_achieve'] = worthEffortToAchieve;
    data['user_id'] = userId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
