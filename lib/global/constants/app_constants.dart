// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/models/data_model/language_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConstants {
  static bool isVisible = false;
  static bool hideButton = true;
  //static bool fieldEnable = true;
  RegExp emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static final paddingTopZero = EdgeInsets.fromLTRB(15.w, 0, 15.w, 10.h);
  static final paddingBottomZero = EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 10.h);

  //
  static const String theme = 'theme';
  static const String token = "token";
  //* ============== Remember me ============== */
  static const String userEmail = "user_email";
  static const String userPassword = "user_password";
  //* ============== Remember me ============== */

  //static String token = AuthProvider.token;
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
  static GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  static GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  //
  static String loginURI = "/api/user/login";
  static String baseURL = "http://cfpc.previewforclient.com";
  static String sendOTPURI = "/api/user/send/otp";
  static String otpLoginURI = "/api/user/login/otp";
  static String resetForgotPassword = "/api/user/reset/forgot/password";
  static String registerURI = "/api/user/register";
  static String userProfileDetailsURI = "/api/user/details";
  static String updateUserProfileURI = "/api/user/update/profile/details";
  static String userUpdatePhotoURI = "/api/user/add/photo";
  static String changePasswordURI = "/api/user/update/password";
  static String contactUsURI = "/api/user/contact/message/store";
  static String emailCheck = "/api/check/email";
  static String deleteProfile = "/api/user/delete";
  static String feedBackURI = "/api/user/feedback";


  static String scalRatingURI = "/api/question-responses/scale-rating";
  static String pictureResponseURI = "/api/question-responses/picture-response";
  static String quizResponseURI = "/api/question-responses/quiz-response";
  static String oneWordBestCaptureURI = "/api/question-responses/word-response"; 
  static String wordLoveLifeURI = "/api/question-responses/word-love-life-response";
  static String viewPictureResURI = "/api/question-responses/picture-feeling-response";
  static String achieveIdealLifeURI = "/api/question-responses/achieve-ideal-life-response";
  static String wheelResponseURI = "/api/question-responses/wheel-response";

  //HappyLifeSurvey
  static String goalCategoriesURI = "/api/goal-planning/categories";
  static String happyLifeSurvey = "/api/happy-life-survey/happy-life-survey";
  

  //GoalPlanning
  static String creaaGoalURI = "/api/goal-planning/create-goal";
  static String uploadGoalImageURI = "/api/goal-planning/upload-image";
  static String editGoalURI = "/api/goal-planning/create-goal/1";
  static String deleteGoalURI = "/api/goal-planning/delete-goal";
 
  //
  static String describeYourGoalURI = "/api/goal-planning/describe-goal";
  static String dailyAffirmationURI = "/api/goal-planning/daily-affirmation";
  static String promisesToAchieveGoalURI = "/api/goal-planning/promise-to-achieve-goal";
  static String firstGoalURI = "/api/goal-planning/first-step-to-achieve-goal";
  static String secondGoalURI = "/api/goal-planning/second-step-to-achieve-goal";
  static String thirdGoalURI = "/api/goal-planning/third-step-to-achieve-goal";
  static String fourthGoalURI = "/api/goal-planning/fourth-step-to-achieve-goal";
  static String fifthGoalURI = "/api/goal-planning/fifth-step-to-achieve-goal";
  static String setGoalDateURI = "/api/goal-planning/goal-date";

  //
  static String myGoalURI = "/api/vision-board/my-goals";
  static String myDailyAffirmationURI = "/api/vision-board/my-affirmations";

  //Available Slots
  static String checkAvailableSlots = "/api/calling/available-slots"; 
  static String bookAvailableSlot = "/api/calling/book/slots"; 
  static String userBookedSlot = "/api/calling/user/bookings"; 


  //Coach module APIs
  static String coachBookedSlot = "/api/calling/coach/bookings"; 

  //Payment APIs
  static String paymentIntentURI = "/api/payments/intent"; 
  static String cardTokenURI = "/api/payments/get/token"; 
  static String cardPaymentURI = "/api/payments/create/card/token"; 
  static String chargeWithCardURI = "/api/payments/charge/card/token"; 
  static String paymentHistory = "/api/payments/user/details"; 
  static String createCardToken = "/api/payments/create/card/token"; 

  //
  static String saveLastRoute = "/api/user/last/visited"; 
  static String getLastRoute = "/api/user/last/visited"; 



  static const String fcmTopic = 'olga';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: Images.us,
        languageName: 'ENGLISH',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: Images.italy,
        languageName: 'ITALIANO',
        countryCode: 'IT',
        languageCode: 'it'),
    LanguageModel(
        imageUrl: Images.arabic,
        languageName: 'عربى',
        countryCode: 'SA',
        languageCode: 'ar'),
    LanguageModel(
        imageUrl: Images.spain,
        languageName: 'ESPAÑOL ',
        countryCode: 'ES',
        languageCode: 'es'),
    LanguageModel(
        imageUrl: Images.chinese,
        languageName: 'CHINESE',
        countryCode: 'CN',
        languageCode: 'zh'),
    LanguageModel(
        imageUrl: Images.india,
        languageName: 'हिंदी',
        countryCode: 'IN',
        languageCode: 'hi'),
    LanguageModel(
        imageUrl: Images.france,
        languageName: 'FRANÇAISE',
        countryCode: 'FR',
        languageCode: 'fr'),
    LanguageModel(
        imageUrl: Images.portugues,
        languageName: 'PORTUGUÊS',
        countryCode: 'PT',
        languageCode: 'pt'),
  ];
}
