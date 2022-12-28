

import 'dart:developer';
import 'package:flutter/material.dart';
import '../global/constants/app_constants.dart';
import '../models/api_model/api_model.dart';

class LastRouteProvider with ChangeNotifier {

  Future saveLastRoute({
    required String lastRoute,
  }) async {
   Map<String, dynamic> params = {};
    params['user_type'] = lastRoute;

    var url = AppConstants.baseURL + AppConstants.saveLastRoute;
    var response = await ApiModel.post(params, url);
    log(" This is register url ===>>> $url \n This is response ===>>> $response ");
    log(" ============ The End ============ ");
  
    notifyListeners();
  }


  //
  Future getLastRoute() async {
  
    var url = AppConstants.baseURL + AppConstants.getLastRoute;
    var response = await ApiModel.get(url);
    log(" This is register url ===>>> $url \n This is response ===>>> $response ");
    log(" ============ The End ============ ");

  }

}