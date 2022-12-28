// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/models/api_model/api_model.dart';
import '../global/widgets/loader.dart';
import '../screens/visionboard/drawer/privacy_settings/feedBack_successful.dart/feedBack_success_animation.dart';

class FeedbackProvider with ChangeNotifier {
  //

  Future feedBack({ 
    required String email,
    required String message,   
    required BuildContext context,
  }) async {
     Loader.show(context,
        progressIndicator: const CircularProgressIndicator(
          color: Color(0xffDEB988),
        ));
    Map<String, dynamic> params = {};

    params['email'] = email;
    params['message'] = message;

    var apiURL = AppConstants.baseURL + "/api/user/feedback";
    var postResponse = await ApiModel.post(params, apiURL);
    print("contact us full API URL ===>>> $postResponse");
    print("login API response ===>>> $postResponse");

     //
    if (postResponse['statuscode'] == 200) {
      Loader.hide();
      Navigator.push( context, MaterialPageRoute(builder: (context) =>  FeedBackScreenAnimated()),
  );
      print(postResponse['msg']);
      // goPage(context, const Successful());
    } else {
       Loader.hide();
      var snackBar = SnackBar(
        width: double.infinity,
             padding: const EdgeInsets.only(top:30),
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: 'Oh snap !',
                message:
                    'Somthing went wrong',
                contentType: ContentType.failure,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
