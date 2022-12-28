// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/models/api_model/api_model.dart';

class QuestionMaster with ChangeNotifier {
  //--------------------> goalPlanning
  Future goalPlanning({
    required String response,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    params['response'] = response;

    var apiURL = AppConstants.baseURL + AppConstants.describeYourGoalURI;
    var postResponse = await ApiModel.get(apiURL);

    print("profile details URL ===>>> $apiURL");
    print("getting update image API response ===>>> $postResponse");
    //
    if (postResponse['statuscode'] == 200) {
     //(postResponse['msg'].toString(), context);
      print(postResponse['msg']);
      //goPage(context, const FitnessScreen());
      notifyListeners();
    } else {
      showToast(postResponse['msg'].toString(), context);
      notifyListeners();
    }
  }
}
