import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/screens/visionboard/drawer/payment/add_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageProvider with ChangeNotifier {
  SharedPreferences prefs;
  StorageProvider(this.prefs);
//!===================Text To speach =========================
  bool _isAudio = true;
  bool get isAudio => _isAudio;
  void changeAudio(isAudio) {
    _isAudio = isAudio;
    notifyListeners();
  }

  void audioSpeak(String audio) {
    final FlutterTts flutterTts = FlutterTts();
    speak(String text1) async {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(text1);
    }

    _isAudio == true ? speak(audio) : speak("");
    notifyListeners();
  }
//!============================================

  String _name = "";
  String get name => _name;
  //String get name => prefs.getString("user_name") ?? _name;
  void changeName(name) {
    //prefs.setString("user_name", name);
    _name = name;
    notifyListeners();
  }

  String _lastName = "";
  String get lastName => _lastName;
  void changeLastName(lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  //!========================
  String _chooseLang = "null";
  String get lang => _chooseLang;
  void changeLang(lang) {
    _chooseLang = lang;
    notifyListeners();
  }

  //!========================
  String _userType = "2";
  String get userType => _userType;
  void updateUserType(userType) {
    _userType = userType;
    prefs.setString("user_type", userType);
    notifyListeners();
  }

  //!========================
  String _email = "";
  String get email => _email;
  //String get email => prefs.getString("user_email") ?? _email;
  void updateUserEmail(email) {
    _email = email;
    //prefs.setString("user_email", userType);
    notifyListeners();
  }

  String _savedEmail = "";
  String get savedEmail => prefs.getString("saved_email") ?? _savedEmail;
  void updateSavedUserEmail(email) {
    _savedEmail = email;
    prefs.setString("saved_email", savedEmail);
    notifyListeners();
  }

  String _gender = "null";
  String get gender => _gender;
  void changeGenderl(gender) {
    _gender = gender;
    notifyListeners();
  }

  bool _genderSelected = false;
  bool get genderSelected => _genderSelected;
  void changeGenderlSelection(gender) {
    _genderSelected = gender;
    notifyListeners();
  }

  int _feelAboutLife = 0;
  int get feelAboutLife => _feelAboutLife;
  void addLifeFeelValue(feelAboutLife) {
    _feelAboutLife = feelAboutLife;
    notifyListeners();
  }

  //
  int _achiveGoalValue = 0;
  int get achiveGoalValue => _achiveGoalValue;
  void updateAchiveGoalValue(achiveGoalValue) {
    _achiveGoalValue = achiveGoalValue;
    notifyListeners();
  }

  //Quizes
  String _isHopeImportant = "null";
  String get hopeIsImpotant => _isHopeImportant;
  void changeHopeImportant(aggrement) {
    _isHopeImportant = aggrement;
    notifyListeners();
  }

  //Quizes score
  int _totalQuizScore = 0;
  int get totalQuizScore => _totalQuizScore;
  void updateQuizScore(totalScore) {
    _totalQuizScore = totalScore;
    notifyListeners();
  }

  //choose an image
  int _chooseOnePicture = 0;
  int get chooseOnePicture => _chooseOnePicture;
  void changeOnePicture(chooseOnePicture) {
    _chooseOnePicture = chooseOnePicture;
    notifyListeners();
  }

  //select one word
  int _selectOneWord = 0;
  int get selectOneWord => _selectOneWord;
  void addOneWordIndex(chooseOnePicture) {
    _selectOneWord = chooseOnePicture;
    notifyListeners();
  }

  // ==== Sharedpreferences start
  //Happy Life Scale value for 2nd wheel chart
  // one area which is will be set as a goal

  String _oneSelectedArea = "null";
  String get oneSelectedArea => _oneSelectedArea;
  void addOneSelectedAre(oneArea) {
    _oneSelectedArea = oneArea;
    prefs.setString("oneSelectedArea", oneSelectedArea);
    notifyListeners();
  }

  String _oneSelectedAreaId = "";
  String get oneSelectedAreaId => _oneSelectedAreaId;
  void updateSelectedAreId(oneAreaId) {
    _oneSelectedAreaId = oneAreaId;
    prefs.setString("oneSelectedAreaId", oneSelectedAreaId);
    notifyListeners();
  }

  //response 1
  int _response1 = 0;
  int get response1 => _response1;
  void updateResponse1(response1) {
    _response1 = response1;
    prefs.setInt("response1", response1);
    notifyListeners();
  }

  // response 2
  int _response2 = 0;
  int get response2 => _response2;
  void updateResponse2(response2) {
    _response2 = response2;
    prefs.setInt("response2", response2);
    notifyListeners();
  }

  // response 3
  int _response3 = 0;
  int get response3 => _response3;
  void updateResponse3(response3) {
    _response3 = response3;
    prefs.setInt("response3", response3);
    notifyListeners();
  }

  // response 4
  int _response4 = 0;
  int get response4 => _response4;
  void updateResponse4(response4) {
    _response4 = response4;
    prefs.setInt("response4", response4);
    notifyListeners();
  }

  //!===========================================================================
  // response 5
  int _response5 = 0;
  int get response5 => _response5;
  void updateResponse5(response5) {
    _response5 = response5;
    prefs.setInt("response5", response5);
    notifyListeners();
  }
  //!===========================================================================
  // response 6
  int _response6 = 0;
  int get response6 => _response6;
  void updateResponse6(response6) {
    _response6 = response6;
    prefs.setInt("response6", response6);
    notifyListeners();
  }
  //!===========================================================================
  // response 7
  int _response7 = 0;
  int get response7 => _response7;
  void updateResponse7(response7) {
    _response7 = response7;
    prefs.setInt("response7", response7);
    notifyListeners();
  }
  //!===========================================================================
  // response 8
  int _response8 = 0;
  int get response8 => _response8;
  void updateResponse8(response8) {
    _response8 = response8;
    prefs.setInt("response8", response8);
    notifyListeners();
  }
  //!===========================================================================
  // response 9
  int _response9 = 0;
  int get response9 => _response9;
  void updateResponse9(response9) {
    _response9 = response9;
    prefs.setInt("response9", response9);
    notifyListeners();
  }
  //!===========================================================================
  // response 10
  int _response10 = 0;
  int get response10 => _response10;
  void updateResponse10(response10) {
    _response10 = response10;
    prefs.setInt("response10", response10);
    notifyListeners();
  }

  //
  String _benefits = "null";
  String get benefits => _benefits;
  void updateBeneefits(benefits) {
    _benefits = benefits;
    prefs.setString("benefits", benefits);
    notifyListeners();
  }

  String _price = "null";
  String get price => _price;
  void updatePrice(price) {
    _price = price;
    prefs.setString("price", price);
    notifyListeners();
  }

  //
  int _importantYourGoal = 0;
  int get importantYourGoal => _importantYourGoal;
  void changeImportantYourGoal(importantYourGoal) {
    _importantYourGoal = importantYourGoal;
    prefs.setInt("importantYourGoal", importantYourGoal);
    notifyListeners();
  }

  int _worthYourEffort = 0;
  int get worthYourEffort => _worthYourEffort;
  void changeWorthYourEffort(worthYourEffort) {
    _worthYourEffort = worthYourEffort;
    prefs.setInt("worthYourEffort", worthYourEffort);
    notifyListeners();
  }

  int _believeYouCan = 0;
  int get believeYouCan => _believeYouCan;
  void changeBelieveYouCan(believeYouCan) {
    _believeYouCan = believeYouCan;
    prefs.setInt("believeYouCan", believeYouCan);
    notifyListeners();
  }
  //

  //* Skills & Qualities Already Have */

  //* =============== Skills Already have =============== */
  List _skillsSupportIndex = [];
  List get skillsSupportIndex => _skillsSupportIndex;
  void updateSkillsSupportIndex(skillsSupportIndex) {
    _skillsSupportIndex.add(skillsSupportIndex);
    notifyListeners();
  }

  List<String> _skillsSupportWordList = [];
  set adderSkillsSupportWord(List<String> list) {
    _skillsSupportWordList = [...list];
    notifyListeners();
  }

  List<String> get skillsSupportWordList => _skillsSupportWordList;
  void updateSkillsSupportWordList(skillsSupportWordList) {
    _skillsSupportWordList.add(skillsSupportWordList);
    notifyListeners();
  }

  // skills already have, ready to send the API
  String _skillsSupportSend = '';
  String get skillsSupportSend => _skillsSupportSend;
  void updateSkillsSupportSend(skillsSupportSend) {
    _skillsSupportSend = skillsSupportSend;
    prefs.setString("skillsSupportSend", skillsSupportSend);
    notifyListeners();
  }

  //* =============== Skills Need to Develop =============== */
  List _skillsDevelopIndex = [];
  List get skillsDevelopIndex => _skillsDevelopIndex;
  void updateSkillsDevelopIndex(skillsDevelopIndex) {
    _skillsDevelopIndex.add(skillsDevelopIndex);
    notifyListeners();
  }

  List<String> _skillsDevelopWordList = [];
  List<String> get skillsDeveloptWordList => _skillsDevelopWordList;
  void updateSkillsDevelopWordList(skillsDeveloptWordList) {
    _skillsDevelopWordList.add(skillsDeveloptWordList);
    notifyListeners();
  }

  // skills need to develop, ready to send the API
  String _skillsDevelopSend = '';
  String get skillsDevelopSend => _skillsDevelopSend;
  void updateSkillsDevelopSend(skillsDevelopSend) {
    _skillsDevelopSend = skillsDevelopSend;
    prefs.setString("skillsDevelopSend", skillsDevelopSend);
    notifyListeners();
  }

  //* ===============  =============== */

  //
  String _mindset = "null";
  String get mindset => _mindset;
  void changeMindsetl(mindset) {
    _mindset = mindset;
    prefs.setString("mindset", mindset);
    notifyListeners();
  }

  String _assurance = "null";
  String get assurance => _assurance;
  void changeAssurance(assurance) {
    _assurance = assurance;
    prefs.setString("assurance", assurance);
    notifyListeners();
  }
  //

  String _mainGoal = "null";
  String get mainGoal => _mainGoal;
  void changeMainGoal(mainGoal) {
    _mainGoal = mainGoal;
    prefs.setString("mainGoal", mainGoal);
    notifyListeners();
  }

  String _firstGoal = "null";
  String get firstGoal => _firstGoal;
  void changeFirstGoal(firstGoal) {
    _firstGoal = firstGoal;
    prefs.setString("firstGoal", firstGoal);
    notifyListeners();
  }

  String _secondGoal = "null";
  String get secondGoal => _secondGoal;
  void changeSecondGoal(secondGoal) {
    _secondGoal = secondGoal;
    prefs.setString("secondGoal", secondGoal);
    notifyListeners();
  }

  String _thirdGoal = "null";
  String get thirdGoal => _thirdGoal;
  void changeThirdGoal(thirdGoal) {
    _thirdGoal = thirdGoal;
    prefs.setString("thirdGoal", thirdGoal);
    notifyListeners();
  }

  String _fourthGoal = "null";
  String get fourthGoal => _fourthGoal;
  void changeFourthGoal(fourthGoal) {
    _fourthGoal = fourthGoal;
    prefs.setString("fourthGoal", fourthGoal);
    notifyListeners();
  }

  String _fifthGoal = "null";
  String get fifthGoal => _fifthGoal;
  void changeFifthGoal(fifthGoal) {
    _fifthGoal = fifthGoal;
    prefs.setString("fifthGoal", fifthGoal);
    notifyListeners();
  }

  //
  String _startDate = "null";
  String get startDate => _startDate;
  void changeStartDate(startDate) {
    _startDate = startDate;
    prefs.setString("startDate", startDate);

    notifyListeners();
  }

  String _endDate = "null";
  String get endDate => _endDate;
  void changeEndDate(endDate) {
    _endDate = endDate;
    prefs.setString("endDate", endDate);

    notifyListeners();
  }
  //

  int? _goalIndex;
  int get goalIndex => _goalIndex!;
  void updateGoalIndex(int index) {
    _goalIndex = index;
    notifyListeners();
  }

  //  XFile? image goal image ;
  XFile _goalImage = XFile('');
  XFile get goalImage => _goalImage;
  void changeGoalImage(userImage) {
    _goalImage = userImage;
    notifyListeners();
  }

  //  XFile? image user image;
  XFile _userImage = XFile(
      'https://raw.githubusercontent.com/muktabd/public-images/main/profile-placeholder.jpeg');
  XFile get userImage => _userImage;
  void changeUserImage(userImage) {
    _userImage = userImage;
    notifyListeners();
  }

  //wheel value
  String _friendsValue = "0";
  String get friendsValue => _friendsValue;
  void updateFriends(friendsValue) {
    _friendsValue = friendsValue;
    notifyListeners();
  }

  String _family = "0";
  String get familyValue => _family;
  void updateFamily(familyValue) {
    _family = familyValue;
    notifyListeners();
  }

  String _romance = "0";
  String get romance => _romance;
  void updateRomance(romance) {
    _romance = romance;
    notifyListeners();
  }

  String _finances = "0";
  String get finances => _finances;
  void updateFinances(finances) {
    _finances = finances;
    notifyListeners();
  }

  String _physicalHealth = "0";
  String get physicalHealth => _physicalHealth;
  void updatePhysicalHealth(physicalHealth) {
    _physicalHealth = physicalHealth;
    notifyListeners();
  }

  String _hobbies = "0";
  String get hobbies => _hobbies;
  void updateHobbies(hobbies) {
    _hobbies = hobbies;
    notifyListeners();
  }

  String _emotionalHealth = "0";
  String get emotionalHealth => _emotionalHealth;
  void updateEmotionalHealth(emotionalHealth) {
    _emotionalHealth = emotionalHealth;
    notifyListeners();
  }

  String _career = "0";
  String get career => _career;
  void updateCareer(career) {
    _career = career;
    notifyListeners();
  }

  String _spiritual = "0";
  String get spiritual => _spiritual;
  void updateSpiritual(spiritual) {
    _spiritual = spiritual;
    notifyListeners();
  }

  String _livingEnv = "0";
  String get livingEnv => _livingEnv;
  void updateLivingEnv(livingEnv) {
    _livingEnv = livingEnv;
    notifyListeners();
  }

  //

  //* ========= forgot password ========= */

  String? _receivedOtp;
  String get receivedOtp => _receivedOtp!;
  void updateReceivedOtp(receivedOtp) {
    _receivedOtp = receivedOtp;
    notifyListeners();
  }

  String _appoimentDate = "";
  String get appoimentDate => _appoimentDate;
  void updateAppointmentDate(appoimentDate) {
    _appoimentDate = appoimentDate;
    notifyListeners();
  }

  int _availableSlotIndex = 0;
  int get availableSlotIndex => _availableSlotIndex;
  void updateavailableSlotIndex(availableSlotIndex) {
    _availableSlotIndex = availableSlotIndex;
    notifyListeners();
  }

  // booking details

  String _slotTime = "";
  String get slotTime => _slotTime;
  void updateSlotTime(slotTime) {
    _slotTime = slotTime;
    notifyListeners();
  }

  String _coachId = "";
  String get coachId => _coachId;
  void updateCoachId(coachId) {
    _coachId = coachId;
    notifyListeners();
  }

  String _appoitmentDate = "";
  String get appointmentDate => _appoitmentDate;
  void confirmAppointmentDate(appointmentDate) {
    _appoitmentDate = appointmentDate;
    notifyListeners();
  }

  // String _fcmToken = "";
  String get fcmToken => prefs.getString("fcmToken") ?? "null";
  void updateFcmToken(String token) {
    prefs.setString("fcmToken", token);
    // _fcmToken = token;
    // notifyListeners();
  }

  //

  // Local CreditCard portion;
  List<String> get getCard => cardGetter();

  List<String> cardGetter() {
    if (prefs.containsKey('card_list')) {
      return prefs.getStringList('card_list') ?? [];
    } else {
      prefs.setStringList('card_list', <String>[]);
      return [];
    }
  }

  void addCardDetails(ManualCreditCard card) {
    List<String> currentList = cardGetter();
    currentList.add(card.toJson());
    prefs.setStringList('card_list', currentList);
    notifyListeners();
  }

  removeCardDetails(String card) {
    List<String> currentList = cardGetter();
    currentList.removeWhere((element) => element == card);
    prefs.setStringList('card_list', currentList);
    notifyListeners();
  }
// Local Card portionEnd;

  // store card index
  int? _cardIndex;
  int get cardIndex => _cardIndex!;
  void updateCardIndex(cardIndex) {
    _cardIndex = cardIndex;
    notifyListeners();
  }

// For assuring a complete Register!
  registrationSafetyNet({required String route, String? email}) {
    if (email != null) {
      prefs.setString("reg_email", email);
      log("Email Getting Saved!");
    }
    prefs.setString("reg_route", route);
  }

 bool checkSafetyNet({required BuildContext context, required String email, bool? value}) {
      log("Check Getting Called!");
    if (prefs.containsKey("reg_email") &&
        (prefs.getString("reg_email") == email)) {
      goNamedWithBool(context, prefs.getString("reg_route")!, value);
      log("email $email");
      log("stored email ${prefs.getString("reg_email")}");
      return true;
    } else {
      return false;
    }
  }

  clearSafetyNet() {
      log("Safetynet getting cleared!!");
    prefs.remove("reg_email");
    prefs.remove("reg_route");
  }
// For assuring a complete Register!
}
