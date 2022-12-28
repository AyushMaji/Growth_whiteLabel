// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/models/api_model/api_model.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/data_model/happy_life_mode.dart';
import '../screens/registration/one_area/goal/goal_steps.dart';

class HappyLifeSurvey with ChangeNotifier {


  //* ============ happyLifeSurveyValues ============ */
  HappyLifeModel happyLifeModel = HappyLifeModel();
  String get happyLifeId =>  happyLifeModel.data?.happyLifeSurvey!.id.toString() ?? "1";
  Future happyLifeSurvey({
    required String response1,
    required String response2,
    required String response3,
    required String response4,
    required String categoryId,

    required String benefitAchiveGoal,
    required String priceUnchiveGoal,

    required String importantOfGoal,
    required String worthOfEffort,
    required String beliveCanDoIt,

    required String qualitiesYouHave,
    required String qualitiesNeedToDevelop,
    required BuildContext context,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> params = {};
    params['response1'] = response1; 
    params['response2'] = response2; 
    params['response3'] = response3; 
    params['response4'] = response4; 
    params['category_id'] = categoryId;

    params['achieve_goal'] = benefitAchiveGoal; 
    params['price_unachieve_goal'] = priceUnchiveGoal; 

    params['how_important_is_goal'] = importantOfGoal; 
    params['worth_effort_to_achieve'] = worthOfEffort; 
    params["can_you_achieve_it"] = beliveCanDoIt;

    params['qualities_to_support_goal'] = qualitiesYouHave; 
    params['qualities_to_develop_to_achieve_goal'] = qualitiesNeedToDevelop; 

    var apiURL = AppConstants.baseURL + AppConstants.happyLifeSurvey;
    var postResponse = await ApiModel.post(params, apiURL);
    print("==================");
    print(params);
    print("==================");
    //
    if (postResponse['statuscode'] == 200) {
      happyLifeModel = HappyLifeModel.fromJson(postResponse);
    //  showToast(postResponse['msg'].toString(), context);
    /*   print(postResponse['msg']);
      //
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
       print( "final selected index ===>>> ${storeProvider.skillsSupportIndex}");
       print("final skillsSupportWordList selected word ===>>> ${storeProvider.skillsSupportWordList}"); 
       print("final selected ===>>> ${storeProvider.skillsDevelopIndex}");
       print("final world list selected ===>>> ${storeProvider.skillsDeveloptWordList}"); 
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
 */

      goPageWithName(context, GoalSteps.id);
      notifyListeners();
    } else {
      showToast(postResponse['msg'].toString(), context);
      notifyListeners();
    }
  }

}
