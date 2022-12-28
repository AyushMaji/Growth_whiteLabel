// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/models/api_model/api_model.dart';
import 'package:olga/screens/visionboard/common_screens/successful.dart';

class CommonProvider with ChangeNotifier {
  //

  Future contactUs({ 
     required String title,
    required String firstName,
    required String lastName,
    required String email,
    required String message,   
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};

    params['title'] = title;
    params['first_name'] = firstName;
    params['last_name'] = lastName;
    params['email'] = email;
    params['message'] = message;
    //params['token'] = message;

    var apiURL = "${AppConstants.baseURL}/api/user/contact/message/store";
    var postResponse = await ApiModel.post(params, apiURL);
    print("contact us full API URL ===>>> $postResponse");
    print("login API response ===>>> $postResponse");

     //
    if (postResponse['statuscode'] == 200) {
      showToast(postResponse['msg'].toString(), context);
      print(postResponse['msg']);
      goPage(context, const Successful());
    } else {
      showToast(postResponse['msg'].toString(), context);
    }

    
  }
}
