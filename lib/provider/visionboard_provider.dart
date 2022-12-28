// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/models/api_model/api_model.dart';
import 'package:olga/models/data_model/affirmation_model.dart';
import 'package:olga/models/data_model/goal_data_model.dart';
import '../global/methods/methods.dart';
import '../screens/visionboard/visionboard.dart';

class VisionboardProvider with ChangeNotifier{

  GoalDataModel goalData = GoalDataModel();
  GoalDataModel get storeGoalData => goalData;
  Future<void> viewGoalDetails() async {
    var apiURL = AppConstants.baseURL + AppConstants.myGoalURI;
    var getResponse = await ApiModel.get(apiURL);

    if(getResponse['statuscode']==200){
    //
    }
    goalData = GoalDataModel.fromJson(getResponse);

    print("goal details URL ===>>> $apiURL");
    print("getting goal details API response ===>>> $getResponse");
    print("getting user model response ===>>> $goalData");
    notifyListeners();
  }

  Future deleteGoal({required int goalID, required BuildContext context}) async{
    Map<String, dynamic> params = {};
    params["goal_id"] = goalID; 
    var apiURL = AppConstants.baseURL + AppConstants.deleteGoalURI;
    var postResponse = await ApiModel.post(params, apiURL);
    print(params);

    if (postResponse['statuscode'] == 200) {
     // showToast(postResponse['msg'].toString(), context);
      print(postResponse['msg']);
      print(" ============ \n \n ============ ");
      goPageAndRemove(context, VisionBoard.id);
      notifyListeners();
    } else {
      showToast(postResponse['msg'].toString(), context);
      notifyListeners();
    }
  }

  //
  AffirmationModel dailyAffirmations = AffirmationModel();
  Future<void> viewDailyAffirmations() async {
    var apiURL = AppConstants.baseURL + AppConstants.myDailyAffirmationURI;
    var getResponse = await ApiModel.get(apiURL);
    dailyAffirmations = AffirmationModel.fromJson(getResponse);

    print("dailyAffirmations details URL ===>>> $apiURL");
    print("getting dailyAffirmations details API response ===>>> $getResponse");
    print("getting user model response ===>>> $goalData");
    notifyListeners();
  }

}