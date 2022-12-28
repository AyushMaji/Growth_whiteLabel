// ignore_for_file: avoid_print
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/models/api_model/api_model.dart';
import 'package:olga/models/data_model/profile_model.dart';
import 'package:olga/screens/auth/signin_screen.dart';
import 'package:olga/screens/registration/gender_email_next.dart';
import 'package:olga/screens/visionboard/drawer/password/forgot_password_opt.dart';
import 'package:provider/provider.dart';
import '../global/widgets/loader.dart';
import '../models/data_model/auth_model.dart';
import '../screens/registration/completed_screen.dart';
import 'visionboard_provider.dart';

class ProfileProvider with ChangeNotifier {
  ProfileProvider()  {
    print("intial ProfileProvider ruuing");
    //viewUserProfileDetails();
  }
  //

  ProfileModel profileModel = ProfileModel();
  Future<void> viewUserProfileDetails() async {
    var apiURL = AppConstants.baseURL + AppConstants.userProfileDetailsURI;
    var getResponse = await ApiModel.get(apiURL);
    profileModel = ProfileModel.fromJson(getResponse);

    print("profile details URL ===>>> $apiURL");
    print("getting user details API response ===>>> $getResponse");
    print("getting user model response ===>>> $profileModel");
    notifyListeners();
  }

  Future updateProfileDetails({
    required String firstName,
    required String lastName,
    required String dateOfBirth,
    required String countryOfResidence,
    required String prefferedLang,
    required String phoneNumber,
    required String gender,
    required BuildContext context,
  }) async {
     Loader.show(context,
        progressIndicator: const CircularProgressIndicator(
          color: Color(0xffDEB988),
        ));
    Map<String, dynamic> params = {};
    params['first_name'] = firstName;
    params['last_name'] = lastName;
    params['date_of_birth'] = dateOfBirth;
    params['country_of_residence'] = countryOfResidence;
    params['preffered_language'] = prefferedLang;
    params['phone_number'] = phoneNumber;
    params['gender'] = gender;

    var apiURL = AppConstants.baseURL + AppConstants.updateUserProfileURI;
    var postResponse = await ApiModel.post(params, apiURL);
    //update instanctly in the screen
    profileModel = ProfileModel.fromJson(postResponse);
    await viewUserProfileDetails();

    print("update profile URL ===>>> $apiURL");
    print("getting update profile API response ===>>> $postResponse");
    //

    if (postResponse['statuscode'] == 200) {
      Loader.hide();
      //showToast(postResponse['msg'].toString(), context);
      final visionBoard = Provider.of<VisionboardProvider>(context, listen: false);
      await visionBoard.viewGoalDetails();
      await visionBoard.viewDailyAffirmations();
       //final profileData = Provider.of<ProfileProvider>(context, listen: false);
      // await profileData.viewUserProfileDetails();
     
      goPage(context, Completed());
      
      print(postResponse['msg']);
      notifyListeners();
    } else {
      showToast(postResponse['msg'].toString(), context);
      Loader.hide();
      notifyListeners();
    }
  }
  Future setProfileDetails({
    required String firstName,
    required String lastName,
    required String dateOfBirth,
    required String countryOfResidence,
    required String prefferedLang,
    required String phoneNumber,
    required String gender,
    required BuildContext context,
  }) async {
     Loader.show(context,
        progressIndicator: const CircularProgressIndicator(
          color: Color(0xffDEB988),
        ));
    Map<String, dynamic> params = {};
    params['first_name'] = firstName;
    params['last_name'] = lastName;
    params['date_of_birth'] = dateOfBirth;
    params['country_of_residence'] = countryOfResidence;
    params['preffered_language'] = prefferedLang;
    params['phone_number'] = phoneNumber;
    params['gender'] = gender;

    var apiURL = AppConstants.baseURL + AppConstants.updateUserProfileURI;
    var postResponse = await ApiModel.post(params, apiURL);
    //update instanctly in the screen
    profileModel = ProfileModel.fromJson(postResponse);
    await viewUserProfileDetails();

    print("update profile URL ===>>> $apiURL");
    print("getting update profile API response ===>>> $postResponse");
    //

    if (postResponse['statuscode'] == 200) {
        Loader.hide();
      //showToast(postResponse['msg'].toString(), context);
      goPageWithName(context, GenderEmailNext.id);
      
      print(postResponse['msg']);
      notifyListeners();
    } else {
      log(postResponse['msg'].toString());
      Loader.hide();
      notifyListeners();
    }
  }

  // Upload-Update Profile Images
  Future updateProfileImage({
    required XFile image,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    String fileName = image.path;
    print("this is file name ===>>> $fileName");
    var imageSend = await MultipartFile.fromFile(fileName, filename: fileName);
    params['image'] = imageSend;
    var apiURL = AppConstants.baseURL + AppConstants.userUpdatePhotoURI;
    var postResponse = await ApiModel.postFormData(params, apiURL);
    profileModel = ProfileModel.fromJson(postResponse);
    await viewUserProfileDetails();

    print("sending profile details URL ===>>> $apiURL");
    print("getting update image API response ===>>> $postResponse");
    // context.

    if (postResponse['statuscode'] == 200) {
    //  showToast(postResponse['msg'].toString(), context);
      print(postResponse['msg']);
      notifyListeners();
    } else {
      showToast(postResponse['msg'].toString(), context);
      notifyListeners();
    }
  }

  //
  var postResponse;
  Future changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};

    params['old_password'] = oldPassword;
    params['new_password'] = newPassword;
    params['confirm_password'] = confirmPassword;

    var apiURL = AppConstants.baseURL + AppConstants.changePasswordURI;
    postResponse = await ApiModel.post(params, apiURL);

    print("profile details URL ===>>> $apiURL");
    print("getting update image API response ===>>> $postResponse");
    //
    if (postResponse['statuscode'] == 200) {
      //showToast(postResponse['msg'].toString(), context);
      print(postResponse['msg']);
      //goPageAndRemove(context, ChangePassword);
      notifyListeners();
    } else {
     // showToast(postResponse['msg'].toString(), context);
      notifyListeners();
    }
  }

  //
  AuthModel authModel = AuthModel();
  Future sendOTP({
    required String email,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    params['email'] = email;

    var apiURL = AppConstants.baseURL + AppConstants.sendOTPURI;
    var otpResponse = await ApiModel.post(params, apiURL);
    authModel = AuthModel.fromJson(otpResponse);

    print("profile details URL ===>>> $apiURL");
    print("getting update image API response ===>>> $otpResponse");
    print('${authModel.data?.user?.otp}');
    //
    if (otpResponse['statuscode'] == 200) {
     // showToast(otpResponse['msg'].toString(), context);
      print(otpResponse['msg']);
      goPage(context, const ForgotPasswordOtp());
      notifyListeners();
    } else {
      showToast('This email is not register with us', context);
      //showToast(otpResponse['msg'].toString(), context);
      notifyListeners();
    }
  }

  // reset forgot password
  Future resetForgotPassword({
    required String email,
    required String newPassword,
    required String confirmPassword,
    required String otp,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};

    params['email'] = email;
    params['new_password'] = newPassword;
    params['confirm_password'] = confirmPassword;
    params['otp'] = otp;

    var apiURL = AppConstants.baseURL + AppConstants.resetForgotPassword;
    var postResponse = await ApiModel.post(params, apiURL);

    print("profile details URL ===>>> $apiURL");
    print("getting update image API response ===>>> $params");
    print("getting update image API response ===>>> $postResponse");
    //
    if (postResponse['statuscode'] == 200) {
     // showToast(postResponse['msg'].toString(), context);
      print(postResponse['msg']);
      goPageAndRemove(context, SigninScreen.id);
      notifyListeners();
    } else {
      showToast(postResponse['msg'].toString(), context);
      notifyListeners();
    }
  }

  //

    Future deleteUser({
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};

    params['token'] = ApiModel.prefs!.getString(AppConstants.token);

    var deleteUrl = AppConstants.baseURL + AppConstants.deleteProfile;
    var postResponse = await ApiModel.post(params, deleteUrl);

    print("getting delete api response ===>>> $postResponse");
    if (postResponse['statuscode'] == 200) {
      print(postResponse['msg']);
      notifyListeners();
    } else {
      showToast(postResponse['msg'].toString(), context);
      notifyListeners();
    }
  }


}
