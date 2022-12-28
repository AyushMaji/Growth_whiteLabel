// ignore_for_file: avoid_print, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/models/api_model/api_model.dart';
import 'package:olga/models/data_model/achieve_ideal_life.dart';
import 'package:olga/screens/registration/choose_word.dart';
import 'package:olga/screens/registration/explain_selected_picture.dart';
import 'package:olga/screens/registration/one_area/one_area.dart';
import 'package:olga/screens/registration/one_word_result.dart';
import 'package:olga/screens/registration/quiz_result.dart';
import '../global/widgets/loader.dart';
import '../models/data_model/life_scale_rating_model.dart';

class QuesResProvider with ChangeNotifier {

  ///* ============|> lifeScaleValue <|============ */ 
  bool absoreTap = false;
  LifeScaleRatingModel lifeScaleRatingModel = LifeScaleRatingModel();
  Future lifeScaleValue({
    required int scale,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    params['scale'] = scale;

    var apiURL = AppConstants.baseURL + AppConstants.scalRatingURI;
    var postResponse = await ApiModel.post(params, apiURL);
    lifeScaleRatingModel = LifeScaleRatingModel.fromJson(postResponse);
    print("scale value url ===>>> $apiURL");
    print("getting scale value api response ===>>> $postResponse");
    print(lifeScaleRatingModel.msg);
    //
    if (postResponse['statuscode'] == 200) {
      //showToast('Response saved successfully!', context);
      //showToast(postResponse['msg'].toString(), context);
      notifyListeners();
    } else {
      showToast(postResponse['msg'].toString(), context);
      notifyListeners();
    }
  }

  ///* ============|> shortQuizResponse <|============ */ 
  Future quizResponse({
    required String option1,
    required String option2,
    required String option3,
    required String option4,
    required String option5,
    required String option6,
    required String option7,
    required BuildContext context,
  }) async {
    Loader.show(context, progressIndicator: CircularProgressIndicator(
          color: Color(0xffDEB988),
        ));
    Map<String, dynamic> params = {};
    params['option1'] = option1;
    params['option2'] = option2;
    params['option3'] = option3;
    params['option4'] = option4;
    params['option5'] = option5;
    params['option6'] = option6;
    params['option7'] = option7;

    var apiURL = AppConstants.baseURL + AppConstants.quizResponseURI;
    var postResponse = await ApiModel.post(params, apiURL);

    print("profile details URL ===>>> $apiURL");
    print("getting update image API response ===>>> $postResponse");
    //
    if (postResponse['statuscode'] == 200) {
      Loader.hide();
      // showToast(postResponse['msg'].toString(), context);
      print(postResponse['msg']);
      goPageWithName(context, QuizResult.id);
      notifyListeners();
    } else {
      Loader.hide();
      showToast(postResponse['msg'].toString(), context);
      notifyListeners();
    }
  }

  ///* ============|> pictureResponse <|============ */ 
  Future pictureResponse({
    required int pictureId,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    params['picture_id'] = pictureId;

    var apiURL = AppConstants.baseURL + AppConstants.pictureResponseURI;
    var postResponse = await ApiModel.post(params, apiURL);

    print("pictureResponse details URL ===>>> $apiURL");
    print("getting update image API response ===>>> $postResponse");
    //
    if (postResponse['statuscode'] == 200) {
     // showToast(postResponse['msg'].toString(), context);
      print(postResponse['msg']);
      goPageWithName(context, ChooseWord.id);
      notifyListeners();
    } else {
      showToast(postResponse['msg'].toString(), context);
      notifyListeners();
    }
  }

  ///* ============|> wordLoveLifeResponse <|============ */ 
  Future wordLoveLifeRespose({
    required int wordId,
    required BuildContext context,
  }) async {
    Loader.show(context,
        progressIndicator: CircularProgressIndicator(
          color: Color(0xffDEB988),
        ));
    Map<String, dynamic> params = {};
    params['word_id'] = wordId;

    String apiURL = AppConstants.baseURL + AppConstants.wordLoveLifeURI;
    var response = await ApiModel.post(params, apiURL);
    //
    if (response['statuscode'] == 200) {
      Loader.hide();
      //showToast(response['msg'].toString(), context);
      goPageWithName(context, ExplainSelectedPicture.id);
      notifyListeners();
    } else {
      Loader.hide();
      showToast(response['msg'].toString(), context);
      notifyListeners();
    }
  }

  ///* ============|> viewPctureWordResponse <|============ */ 
  Future viewPctureResponse({
    required String pictureResponse,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    params['response'] = pictureResponse;

    String apiURL = AppConstants.baseURL + AppConstants.viewPictureResURI;
    var response = await ApiModel.post(params, apiURL);
    //
    if (response['statuscode'] == 200) {
      //showToast(response['msg'].toString(), context);
      //goPageWithName(context, SelectOneWord.id);
      notifyListeners();
    } else {
      showToast(response['msg'].toString(), context);
      notifyListeners();
    }
  }

  ///* ============|> oneWordBestCapture <|============ */ 
  Future oneWordBestCapture({
    required int wordId,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    params['word_id'] = wordId;

    String apiURL = AppConstants.baseURL + AppConstants.oneWordBestCaptureURI;
    var response = await ApiModel.post(params, apiURL);
    //
    if (response['statuscode'] == 200) {
     // showToast(response['msg'].toString(), context);
      goPageWithName(context, OneWordResult.id);
      notifyListeners();
    } else {
      showToast(response['msg'].toString(), context);
      notifyListeners();
    }
  }

  ///* ============|> achiveIdealLife <|============ */ 
  AchieveIdealLife achieveIdealLife = AchieveIdealLife();
  Future achiveIdealLife({
    required int scalevale,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    params['scale'] = scalevale;
    String apiURL = AppConstants.baseURL + AppConstants.achieveIdealLifeURI;
    var response = await ApiModel.post(params, apiURL);
    //
    if (response['statuscode'] == 200) {
      //showToast(response['msg'].toString(), context);
      achieveIdealLife = AchieveIdealLife.fromJson(response);
     // showToast("Response saved successfully!", context);
      notifyListeners();
    } else {
      showToast(response['msg'].toString(), context);
      notifyListeners();
    }
  }

  ///* ============|> lifeWheelSurvey <|============ */ 
  Future lifeWheelSurvey({
    required String friendsRating,
    required String familyRating,
    required String romanceIntimacyRating,
    required String financesRating,
    required String physicalHealthRating,
    required String hobbiesRating,
    required String emotionalHealthRating,
    required String careerRating,
    required String spiritualityRating,
    required String livingEnvironmentRating,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    params['friends_rating'] = friendsRating;
    params['family_rating'] = familyRating;
    params['romance_intimacy_rating'] = romanceIntimacyRating;
    params['finances_rating'] = financesRating;
    params['physical_health_rating'] = physicalHealthRating;
    params['hobbies_rating'] = hobbiesRating;
    params['emotional_health_rating'] = friendsRating;
    params['career_rating'] = friendsRating;
    params['spirituality_rating'] = friendsRating;
    params['living_environment_rating'] = friendsRating;
    String apiURL = AppConstants.baseURL + AppConstants.wheelResponseURI;
    var response = await ApiModel.post(params, apiURL);
    //
    if (response['statuscode'] == 200) {
      //showToast(response['msg'].toString(), context);
     // showToast("Response saved successfully!", context);
      goPageWithName(context, OneArea.id);
      notifyListeners();
    } else {
      showToast(response['msg'].toString(), context);
      notifyListeners();
    }
  }
}
