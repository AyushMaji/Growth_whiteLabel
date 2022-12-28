// ignore_for_file: avoid_print
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/models/api_model/api_model.dart';
import 'package:olga/models/data_model/create_goal_model.dart';
import 'package:olga/models/data_model/upload_image_model.dart';
import 'package:olga/provider/profile_provider.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/provider/visionboard_provider.dart';
import 'package:olga/screens/registration/completed_screen.dart';
import 'package:olga/screens/registration/imcomplete_profile.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global/widgets/loader.dart';
import '../models/data_model/get_goals_model.dart';
import '../screens/registration/one_area/goal/upload_photo.dart';
//import 'package:olga/provider/profile_provider.dart';

class GoalPlanningProvider with ChangeNotifier {
  //* ============ getGoalsModel ============ */
  GetGoalsModel getGoalsModel = GetGoalsModel();
  Future getAllGoalCategories() async {
    var apiURL = AppConstants.baseURL + AppConstants.goalCategoriesURI;
    var getResponse = await ApiModel.get(apiURL);
    getGoalsModel = GetGoalsModel.fromJson(getResponse);

    print("category api url ===>>> $apiURL");
    print("category api response ===>>> $getResponse");
    print("category api model response ===>>> $getGoalsModel");
  }

  //* ============ |> create a Goal <| ============ */
  CreateGoalModel _createGoalDataModel = CreateGoalModel();
  CreateGoalModel get createGoalDataModel => _createGoalDataModel;
  Future createaGoal({
    required String happyLifeSurveyId,
    required String goalCategory,
    required String goal,
    required String dailyAffirmation,
    required String promiseToAchieveGoal,
    required String firstStepToAchieveGoal,
    required String secondStepToAchieveGoal,
    required String thirdStepToAchieveGoal,
    required String fourthStepToAchieveGoal,
    required String fifthStepToAchieveGoal,
    required String goalStartDate,
    required String goalEndDate,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    params["happy_life_survey_id"] = happyLifeSurveyId;
    params['goal_category_id'] = goalCategory;
    params['goal'] = goal;
    params['daily_affirmation'] = dailyAffirmation;
    params['promise_to_achieve_goal'] = promiseToAchieveGoal;
    params['first_step_to_achieve_goal'] = firstStepToAchieveGoal;
    params['second_step_to_achieve_goal'] = secondStepToAchieveGoal;
    params['third_step_to_achieve_goal'] = thirdStepToAchieveGoal;
    params['fourth_step_to_achieve_goal'] = fourthStepToAchieveGoal;
    params['fifth_step_to_achieve_goal'] = fifthStepToAchieveGoal;
    params['goal_start_date'] = goalStartDate;
    params['goal_end_date'] = goalEndDate;

    var apiURL = AppConstants.baseURL + AppConstants.creaaGoalURI;
    var postResponse = await ApiModel.post(params, apiURL);

    print("goal data params details ===>>> $params");
    print("goal adding URL ===>>> $apiURL");
    print("goal adding api response ===>>> $postResponse");
    print(" ============ \n${_createGoalDataModel.statuscode}\n ============ ");
    //profile settings checking
    ProfileProvider profileData =
        Provider.of<ProfileProvider>(context, listen: false);

    if (postResponse['statuscode'] == 200) {
      showToast(postResponse['msg'].toString(), context);
      print(postResponse['msg']);
      _createGoalDataModel = CreateGoalModel.fromJson(postResponse);
      profileData.viewUserProfileDetails();
      print(" ============ \n$_createGoalDataModel\n ============ ");
      goPageWithName(context, UploadPhoto.id);
      notifyListeners();
    } else {
      showToast(postResponse['msg'].toString(), context);
      notifyListeners();
    }
  }

  //* ============ |> uploadGoalImage <| ============ */
  UploadImageModel _uploadImageModel = UploadImageModel();
  UploadImageModel get uploadImageData => _uploadImageModel;
  Future uploadGoalImage({
    required XFile image,
    required BuildContext context,
  }) async {
    Loader.show(context,
        progressIndicator: const CircularProgressIndicator(
          color: Color(0xffDEB988),
        ));
    Map<String, dynamic> params = {};
    String fileName = image.path;
    print("this is file name ===>>> $fileName");
    var imageSend = await MultipartFile.fromFile(fileName, filename: fileName);
    params['image'] = imageSend;
    params['goal_id'] = _createGoalDataModel.data?.id;

    var apiURL = AppConstants.baseURL + AppConstants.uploadGoalImageURI;
    var postResponse = await ApiModel.postFormData(params, apiURL);
    _uploadImageModel = UploadImageModel.fromJson(postResponse);

    print("sending profile details URL ===>>> $apiURL");
    print("getting update image API response ===>>> $postResponse");
    print(" ======== ${_uploadImageModel.data?.goalPlanning?.image} ======== ");
    //profile settings checking
    ProfileProvider profileData =
        Provider.of<ProfileProvider>(context, listen: false);
    StorageProvider storeProvider =
        Provider.of<StorageProvider>(context, listen: false);

    profileData.viewUserProfileDetails();

    if (postResponse['statuscode'] == 200) {
      Loader.hide();
      showToast(postResponse['msg'].toString(), context);
      dynamic firstNameController =
          profileData.profileModel.data?.userDetails?.firstName;
      dynamic lastNameController =
          profileData.profileModel.data?.userDetails?.lastName;
      dynamic contacEmailtController =
          profileData.profileModel.data?.userDetails?.email;
      dynamic dobController =
          profileData.profileModel.data?.userDetails?.dateOfBirth;
      dynamic countryController =
          profileData.profileModel.data?.userDetails?.countryOfResidence;
      dynamic preferedlangController =
          profileData.profileModel.data?.userDetails?.prefferedLanguage;
      dynamic phoneController =
          profileData.profileModel.data?.userDetails?.phoneNumber;

      print('firstNameController: $firstNameController');
      print('lastNameController: $lastNameController');
      print('contactEmailController: $contacEmailtController');
      print('dobController: $dobController');
      print('countryController: $countryController');
      print('preferedlangController: $preferedlangController');
      print('phoneController: $phoneController');

      //  showToast(postResponse['msg'].toString(), context);
      print(postResponse['msg']);
      //
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove("response1");
      await prefs.remove("response2");
      await prefs.remove("response3");
      await prefs.remove("response4");

      await prefs.remove("benefits");
      await prefs.remove("price");
      await prefs.remove("importantYourGoal");
      await prefs.remove("worthYourEffort");
      await prefs.remove("believeYouCan");
      await prefs.remove("skillsSupportSend");

      final storeProvider = Provider.of<StorageProvider>(context, listen: false);

      //
      print("final selected index ===>>> ${storeProvider.skillsSupportIndex}");
      print(
          "final skillsSupportWordList selected word ===>>> ${storeProvider.skillsSupportWordList}");
      print("final selected ===>>> ${storeProvider.skillsDevelopIndex}");
      print(
          "final world list selected ===>>> ${storeProvider.skillsDeveloptWordList}");
      //

      storeProvider.updateResponse1(0);
      storeProvider.updateResponse2(0);
      storeProvider.updateResponse3(0);
      storeProvider.updateResponse4(0);
      storeProvider.updateBeneefits('');
      storeProvider.updatePrice('');

      storeProvider.changeImportantYourGoal(0);
      storeProvider.changeWorthYourEffort(0);
      storeProvider.changeBelieveYouCan(0);

      storeProvider.skillsSupportIndex.clear();
      storeProvider.skillsSupportWordList.clear();
      storeProvider.updateSkillsSupportSend('');

      storeProvider.skillsDevelopIndex.clear();
      storeProvider.skillsDeveloptWordList.clear();
      storeProvider.updateSkillsDevelopSend('');

      storeProvider.clearSafetyNet();

      if (firstNameController == null ||
          lastNameController == null ||
          contacEmailtController == null ||
          dobController == null ||
          countryController == null ||
          preferedlangController == null ||
          phoneController == null) {
        //goPage(context, const PersonalSettings());
        goPageWithName(context, IncompleteProfileScreen.id);
      } else {
        Loader.hide();
        goPageWithName(context, Completed.id);
        log(postResponse['msg'].toString());
      }
      //goPage(context, const Completed());
      Loader.hide();
      print(postResponse['msg']);
      log(postResponse['msg'].toString());
      notifyListeners();
    }else if (postResponse['statuscode'] == 400) {
      Loader.hide();
      showToast(postResponse['msg'].toString(), context);
      log(postResponse['msg'].toString());
    } else {
      Loader.hide();
      showToast(postResponse['msg'].toString(), context);
      log(postResponse['msg'].toString());
      notifyListeners();
    }
  }

  //
  //* ============ |> uploadImageFromEditScreen <| ============ */
  Future uploadImageFromEditScreen({
    required XFile image,
    required int goalId,
    required BuildContext context,
  }) async {
    Loader.show(context,
        progressIndicator: const CircularProgressIndicator(
          color: Color(0xffDEB988),
        ));
    Map<String, dynamic> params = {};
    String fileName = image.path;
    print("this is file name ===>>> $fileName");
    var imageSend = await MultipartFile.fromFile(fileName, filename: fileName);
    params['image'] = imageSend;
    params['goal_id'] = goalId;

    var apiURL = AppConstants.baseURL + AppConstants.uploadGoalImageURI;
    var postResponse = await ApiModel.postFormData(params, apiURL);
    _uploadImageModel = UploadImageModel.fromJson(postResponse);

    print("sending profile details URL ===>>> $apiURL");
    print("getting update image API response ===>>> $postResponse");
    print(" ======== ${_uploadImageModel.data?.goalPlanning?.image} ======== ");
    
      if (postResponse['statuscode'] == 200) {
       Loader.hide();
       showToast(_uploadImageModel.msg.toString(), context);
  
      } else {
        Loader.hide();
         showToast(_uploadImageModel.msg.toString(), context);
   
        log(postResponse['msg'].toString());
      }
  }



  //

  //* ============ |> updateGoal <| ============ */
  Future updateGoal({
    required int goalId,
    //required int happyLifeSurveyId,
    required String goal,
    required String dailyAffirmation,
    required String promiseToAchieveGoal,
    required String firstStepToAchieveGoal,
    required String secondStepToAchieveGoal,
    required String thirdStepToAchieveGoal,
    required String fourthStepToAchieveGoal,
    required String fifthStepToAchieveGoal,
    required String goalStartDate,
    required String goalEndDate,
    required String howImportantIsGoal,
    required String worthEffortToAchieve,
    required String canIachieveIt,
    required String skillsQualitiesHave,
    required String skillsQualitiesNeedToDevelop,
    required BuildContext context,
  }) async {
    Loader.show(context,progressIndicator: const CircularProgressIndicator(color: Color(0xffDEB988),));
    Map<String, dynamic> params = {};
    params['goal_id'] = goalId;
    //params['happy_life_survey_id'] = happyLifeSurveyId;
    params['goal'] = goal;
    params['daily_affirmation'] = dailyAffirmation;
    params['promise_to_achieve_goal'] = promiseToAchieveGoal;

    params['first_step_to_achieve_goal'] = firstStepToAchieveGoal;
    params['second_step_to_achieve_goal'] = secondStepToAchieveGoal;
    params['third_step_to_achieve_goal'] = thirdStepToAchieveGoal;
    params['fourth_step_to_achieve_goal'] = fourthStepToAchieveGoal;
    params['fifth_step_to_achieve_goal'] = fifthStepToAchieveGoal;

    params['goal_start_date'] = goalStartDate;
    params['goal_end_date'] = goalEndDate;

    params['how_important_is_goal'] = howImportantIsGoal;
    params['worth_effort_to_achieve'] = worthEffortToAchieve;
    params['can_you_achieve_it'] = canIachieveIt;

    params["qualities_to_support_goal"] = skillsQualitiesHave;
    params["qualities_to_develop_to_achieve_goal"] =
        skillsQualitiesNeedToDevelop;

    var apiURL = AppConstants.baseURL + AppConstants.editGoalURI;
    var postResponse = await ApiModel.postFormData(params, apiURL);

    print("sending profile details URL ===>>> $apiURL");
    print("getting update image API response ===>>> $postResponse");
    print("getting params ===>>> $params");
    print("           ======== ");
    final visionboardProvider =
        Provider.of<VisionboardProvider>(context, listen: false);
      //  await visionboardProvider.viewGoalDetails();
    print(" ========           ");

    if (postResponse['statuscode'] == 200) {
    //  showToast(postResponse['msg'].toString(), context);
    Loader.hide();
     Get.snackbar(
                  'Successful',
                  postResponse['msg'].toString(),
                  snackPosition: SnackPosition.TOP,
                  colorText:Colors.white,
                  backgroundColor: Colors.green,
      );
      await visionboardProvider.viewGoalDetails();
      print(postResponse['msg']);
      final storeValues = Provider.of<StorageProvider>(context, listen: false);
      storeValues.changeImportantYourGoal(0);
      storeValues.changeWorthYourEffort(0);
      storeValues.changeBelieveYouCan(0);
      notifyListeners();
    } else {
    //  showToast(postResponse['msg'].toString(), context);
    Loader.hide();
     Get.snackbar(
                      'Error',
                      postResponse['msg'].toString(),
                      snackPosition: SnackPosition.TOP,
                      colorText:Colors.white,
                       backgroundColor: Color.fromARGB(190, 244, 67, 54),
                  );
      notifyListeners();
    }
  }

  //* ============ |> deleteGoal <| ============ */
  Future deleteGoal({
    required int id,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    params['goal_id'] = id;

    var apiURL = AppConstants.baseURL + AppConstants.editGoalURI;
    var postResponse = await ApiModel.postFormData(params, apiURL);

    print("sending profile details URL ===>>> $apiURL");
    print("getting update image API response ===>>> $postResponse");
    print(" ========  ======== ");

    if (postResponse['statuscode'] == 200) {
      showToast(postResponse['msg'].toString(), context);
      print(postResponse['msg']);
      notifyListeners();
    } else {
      showToast(postResponse['msg'].toString(), context);
      notifyListeners();
    }
  }
}
