// ignore_for_file: avoid_print, use_build_context_synchronously
import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/widgets/loader.dart';
import 'package:olga/models/api_model/api_model.dart';
import 'package:olga/models/data_model/auth_model.dart';
import 'package:olga/models/data_model/facebook_user.dart';
import 'package:olga/provider/profile_provider.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/coach/coach_video_calling/appointments_screen.dart';
import 'package:olga/screens/company/company.dart';
import 'package:olga/screens/languages/choose_language.dart';
import 'package:olga/screens/registration/gender_email_next.dart';
import 'package:olga/screens/visionboard/visionboard.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../models/data_model/user_checker_model.dart';
import 'dart:convert';
import 'dart:math' as math;
import 'package:crypto/crypto.dart';

class AuthProvider with ChangeNotifier {
  final SharedPreferences? prefs;
  FaceBookUser? faceBookUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );
  final _facebookAuth = FacebookAuth.instance;
  final FirebaseAuth _authProvider = FirebaseAuth.instance;
  AuthProvider({this.prefs});
  AuthModel authModel = AuthModel();

  Future registerUser({
    required String userType,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String gender,
    required String medium,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    final StorageProvider storageProvider =
        Provider.of<StorageProvider>(context, listen: false);
    params['user_type'] = userType;
    params['email'] = email;
    params['password'] = password;
    params['first_name'] = firstName;
    params['last_name'] = lastName;
    params['gender'] = gender;
    params['fcm_token'] = storageProvider.fcmToken;
    params['medium'] = medium;

    //registerURI
    var url = AppConstants.baseURL + AppConstants.registerURI;
    var response = await ApiModel.post(params, url);
    log(" This is register url ===>>> $url \n This is response ===>>> $response ");
    log(" ============ The End ============ ");
    authModel = AuthModel.fromJson(response);

    if (authModel.statuscode == 200) {
      showToast(authModel.msg.toString(), context);
      Provider.of<ProfileProvider>(context, listen: false)
          .viewUserProfileDetails();
      final storeProvider =
          Provider.of<StorageProvider>(context, listen: false);
      storeProvider.changeName(authModel.data?.user?.firstName ?? "");
      storeProvider.updateUserEmail(email);
      if (authModel.data?.user?.medium! == "google") {
        log("user registering with google");
        storageProvider.registrationSafetyNet(
            route: ChooseLanguage.id, email: email);
        goNamedWithBool(context, ChooseLanguage.id, true);
      } else if (authModel.data?.user?.medium! == "facebook") {
        log("user registering with facebook");
        storageProvider.registrationSafetyNet(
            route: ChooseLanguage.id, email: email);
        goNamedWithBool(context, ChooseLanguage.id, true);
      } else {
        log("regular user registering");
        storageProvider.registrationSafetyNet(
            route: GenderEmailNext.id, email: email);
        goPageWithName(context, GenderEmailNext.id);
      }
      saveUserToken("${authModel.data?.token}", email);
      print("registered token is ${authModel.data?.token}");
      notifyListeners();
    } else if (response['statuscode'] == 400) {
      showToast(response['msg'], context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(authModel.msg.toString())));
      print(response['msg']);
      print(response['statuscode']);
      notifyListeners();
    }
    notifyListeners();
  }

  // ========================== |> Login with email and password <| ========================== //
  UserCheckModel uerCheckModel = UserCheckModel();
  Future checkUserExist({
    required String email,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    params['email'] = email;
    var loginApiURL = AppConstants.baseURL + AppConstants.emailCheck;
    var response = await ApiModel.post(params, loginApiURL);
    uerCheckModel = UserCheckModel.fromJson(response);
    log(response.toString());
    if (uerCheckModel.statuscode == 200) {
      //showToast(uerCheckModel.msg.toString(), context);
      if (uerCheckModel.data?.user?.medium != null &&
          uerCheckModel.data?.user?.medium == "google") {
        log("google");
       // showToast("Please Try Google Sign In", context);
        Get.snackbar(
                      'Error !',
                      'Please Try Google Sign In',
                      snackPosition: SnackPosition.TOP,
                      colorText:Colors.white,
                       backgroundColor: Color.fromARGB(190, 244, 67, 54),
                  );
      } else if (uerCheckModel.data?.user?.medium != null &&
          uerCheckModel.data?.user?.medium == "facebook") {
        log("facebook");
        showToast("Please Try Facebook Sign In", context);
      } else {
        log("regular");
        //showToast(uerCheckModel.msg, context);
        sendLoginOtp(context: context, email: email);
      }
    } else if (uerCheckModel.statuscode == 400) {
      showToast(response['msg'], context);
    }
  }

  Future checkFacebookUserLogIn(
      {required String email, required BuildContext context}) async {
    Map<String, dynamic> params = {};
    params['email'] = email;
    var loginApiURL = AppConstants.baseURL + AppConstants.emailCheck;
    var response = await ApiModel.post(params, loginApiURL);
    uerCheckModel = UserCheckModel.fromJson(response);
    log(response.toString());
    if (uerCheckModel.statuscode == 200) {
      //showToast(uerCheckModel.msg.toString(), context);
      //showToast(uerCheckModel.data?.user?.medium?.toString(), context);
      if (uerCheckModel.data?.user?.medium != null &&
          uerCheckModel.data?.user?.medium == "google") {
        log("google");
       // showToast("Please Try Google Sign In", context);
        Get.snackbar(
                      'Error !',
                      'Please Try Google Sign In',
                      snackPosition: SnackPosition.TOP,
                      colorText:Colors.white,
                       backgroundColor: Color.fromARGB(190, 244, 67, 54),
                  );
      } else if (uerCheckModel.data?.user?.medium != null &&
          uerCheckModel.data?.user?.medium == "apple") {
        log("facebook");
        showToast("Please Try Apple Sign In", context);
      } else if (uerCheckModel.data?.user?.medium != null &&
          uerCheckModel.data?.user?.medium == "facebook") {
        final storeProvider =
            Provider.of<StorageProvider>(context, listen: false);
        await loginUser(
          email: faceBookUser!.email!,
          password: "12345678",
          userType: "2",
          context: context,
        );
        storeProvider.changeName(faceBookUser!.name!);
        storeProvider.updateUserEmail(faceBookUser!.email!);
      } else {
        log("regular");
        // sendLoginOtp(context: context, email: email);
        showToast("Please Try Regular Sign In", context);
      }
    }
  }

  Future checkGoogleUserLogIn({
    required String email,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    params['email'] = email;
    var loginApiURL = AppConstants.baseURL + AppConstants.emailCheck;
    var response = await ApiModel.post(params, loginApiURL);
    uerCheckModel = UserCheckModel.fromJson(response);
    log(response.toString());
    if (uerCheckModel.statuscode == 200) {
      //showToast(uerCheckModel.msg.toString(), context);
      //showToast(uerCheckModel.data?.user?.medium?.toString(), context);
      //showToast(uerCheckModel.data?.user?.medium?.toString(), context);

      log(uerCheckModel.msg.toString());
      log(uerCheckModel.data?.user?.medium?.toString() ?? "");

      if (uerCheckModel.data?.user?.medium != null &&
          uerCheckModel.data?.user?.medium == "google") {
        log("google");
        final storeProvider =
            Provider.of<StorageProvider>(context, listen: false);

        await loginUser(
          email: email,
          password: "12345678",
          userType: "2",
          context: context,
        );
        await _googleSignIn.signOut();
        await _googleSignIn.disconnect();
        storeProvider.updateUserEmail(email);
      } else if (uerCheckModel.data?.user?.medium != null &&
          uerCheckModel.data?.user?.medium == "facebook") {
        log("facebook");
        showToast("Please Try Facebook Sign In", context);
      } else if (uerCheckModel.data?.user?.medium != null &&
          uerCheckModel.data?.user?.medium == "apple") {
        log("facebook");
        showToast("Please Try Apple Sign In", context);
      } else {
        log("regular");
        showToast("Please Try Regular Sign In", context);
        // sendLoginOtp(context: context, email: email);
      }
    }
  }

  Future checkAppleUserLogIn({
    required String email,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    params['email'] = email;
    var loginApiURL = AppConstants.baseURL + AppConstants.emailCheck;
    var response = await ApiModel.post(params, loginApiURL);
    uerCheckModel = UserCheckModel.fromJson(response);
    log(response.toString());
    if (uerCheckModel.statuscode == 200) {
      //showToast(uerCheckModel.msg.toString(), context);
      //showToast(uerCheckModel.data?.user?.medium?.toString(), context);
      //showToast(uerCheckModel.data?.user?.medium?.toString(), context);

      log(uerCheckModel.msg.toString());
      log(uerCheckModel.data?.user?.medium?.toString() ?? "");

      if (uerCheckModel.data?.user?.medium != null &&
          uerCheckModel.data?.user?.medium == "apple") {
        log("apple");
        final storeProvider =
            Provider.of<StorageProvider>(context, listen: false);

        await loginUser(
          email: email,
          password: "12345678",
          userType: "2",
          context: context,
        );
        storeProvider.updateUserEmail(email);
      } else if (uerCheckModel.data?.user?.medium != null &&
          uerCheckModel.data?.user?.medium == "facebook") {
        log("facebook");
        showToast("Please Try Facebook Sign In", context);
      } else if (uerCheckModel.data?.user?.medium != null &&
          uerCheckModel.data?.user?.medium == "google") {
        log("google");
        showToast("Please Try Google Sign In", context);
      } else {
        log("regular");
        showToast("Please Try Regular Sign In", context);
        // sendLoginOtp(context: context, email: email);
      }
    }
  }

  Future checkRegisterUser({
    String? name,
    required String email,
    required String medium,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    params['email'] = email;
    var loginApiURL = AppConstants.baseURL + AppConstants.emailCheck;
    var response = await ApiModel.post(params, loginApiURL);

    uerCheckModel = UserCheckModel.fromJson(response);
    if (uerCheckModel.statuscode == 200) {
      log(uerCheckModel.msg.toString());
      log(uerCheckModel.data?.user?.medium?.toString() ?? '');
      if (uerCheckModel.data?.user?.medium != null &&
          uerCheckModel.data?.user?.medium == "google") {
        log("google");
       // showToast("Please Try Google Sign In", context);
        Get.snackbar(
                      'Error !',
                      'Please Try Google Sign In',
                      snackPosition: SnackPosition.TOP,
                      colorText:Colors.white,
                       backgroundColor: Color.fromARGB(190, 244, 67, 54),
                  );
      } else if (uerCheckModel.data?.user?.medium != null &&
          uerCheckModel.data?.user?.medium == "facebook") {
        log("facebook");
        showToast("Please Try Facebook Sign In", context);
      } else if (uerCheckModel.data?.user?.medium != null &&
          uerCheckModel.data?.user?.medium == "apple") {
        log("apple");
        showToast("Please Try Regular Sign In", context);
      } else if (uerCheckModel.data?.user?.medium != null &&
          uerCheckModel.data?.user?.medium == "null") {
        log("regular");
        showToast("Please Try Regular Sign In", context);
      } else {
        log("Unrecognized Medium With an existing User!");
      }
    } else {
      log("register google user!");

      registerUser(
        userType: '2',
        email: email,
        password: '12345678',
        firstName: name ?? "",
        lastName: '',
        gender: '',
        medium: medium,
        context: context,
      );
    }
  }

  // ========================== |> Login with email and password <| ========================== //
  Future loginUser({
    required String email,
    required String password,
    required String userType,
    required BuildContext context,
  }) async {
     Loader.show(context);
    Map<String, dynamic> params = {};

    params['email'] = email;
    params['password'] = password;
    var loginApiURL = AppConstants.baseURL + AppConstants.loginURI;
    var response = await ApiModel.post(params, loginApiURL);
    log("here are the fields $params");
    print("login full url ===>>> $loginApiURL");
    print("login API response ===>>> $response");
    authModel = AuthModel.fromJson(response);

    if (authModel.statuscode == 200) {
      Loader.hide();
      // showToast(authModel.msg.toString(), context);
      print("login token is ${authModel.data?.token}");
      saveUserToken("${authModel.data?.token}", email);
      //Navigate to
      print(authModel.data?.user?.userType);
      var responseUserType = authModel.data?.user?.userType;
      print("API user type ===>>> $responseUserType");
      print("carried user type ===>>> $userType");
      if (Provider.of<StorageProvider>(context, listen: false)
          .checkSafetyNet(context: context, email: email)) {
        notifyListeners();
        return;
      }
      if (responseUserType == "2") {
        print("VisionBoard 1");
        goPageWithName(context, VisionBoard.id);
        // showToast(response['msg'].toString(), context);
        Get.snackbar(
                      'Successful !',
                     response['msg'].toString(),
                      snackPosition: SnackPosition.TOP,
                      colorText:Colors.white,
                       backgroundColor: Color.fromARGB(189, 54, 244, 76),
                  );
      } else if (responseUserType == "3") {
        print("CoachScreen 2");
        goPageWithName(context, AppointmentsScreen.id);
      } else if (responseUserType == "4") {
        print("CompanyScreen 3");
        goPageWithName(context, CompanyScreen.id);
      } else {
        print("not match anything");
      }
      notifyListeners();
    } else {
       Loader.hide();
      showToast(response['msg'].toString(), context);
      notifyListeners();
    }
    notifyListeners();
  }

  //* ============== |> Login with OTP <|============== */
  Future sendLoginOtp({
    required String email,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    params['email'] = email;

    print(" ====== $params ====== \n  ====== End ====== ");

    var url = AppConstants.baseURL + AppConstants.sendOTPURI;
    var response = await ApiModel.post(params, url);

    print("otp details URL ===>>> $url");
    print("getting otp API response ===>>> $response");
    //
    if (response['statuscode'] == 200) {
      authModel = AuthModel.fromJson(response);
      log('${authModel.data?.user?.otp}');
      showToast(response['msg'], context);
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('This email is not register with us')));
      notifyListeners();
    }
  }

  //* ============== |> Login with OTP <|============== */
  Future loginWithOtp({
    required String email,
    required String otp,
    required String userType,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};

    params['email'] = email;
    params['otp'] = otp;

    var loginApiURL = AppConstants.baseURL + AppConstants.otpLoginURI;
    final storeProvider = Provider.of<StorageProvider>(context, listen: false);
    var response = await ApiModel.post(params, loginApiURL);
    print("login full url ===>>> $loginApiURL");
    print("login API response ===>>> $response");
    authModel = AuthModel.fromJson(response);

    if (authModel.statuscode == 200) {
      print("login token is ${authModel.data?.token}");
      saveUserToken("${authModel.data?.token}", email);
      storeProvider.updateUserEmail(email);
      //Navigate to
      print(authModel.data?.user?.userType);
      var responseUserType = authModel.data?.user?.userType;
      print("API user type ===>>> $responseUserType");
      print("carried user type ===>>> $userType");
      if (storeProvider.checkSafetyNet(context: context, email: email)) {
        notifyListeners();
        return;
      }
      if (responseUserType == "2") {
        print("VisionBoard 1");
        goPageWithName(context, VisionBoard.id);
      } else if (responseUserType == "3") {
        print("CoachScreen 2");
        goPageWithName(context, AppointmentsScreen.id);
      } else if (responseUserType == "4") {
        print("CompanyScreen 3");
        goPageWithName(context, CompanyScreen.id);
      } else {
        print("not match anything");
      }
      notifyListeners();
    } else {
      showToast(response['msg'].toString(), context);
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> saveUserToken(String token, String email) async {
    try {
      await prefs?.setString(AppConstants.token, token);
      await prefs?.setString(AppConstants.userEmail, email);
      ApiModel.updateHeader(newToken: token);
    } catch (e) {
      rethrow;
    }
    print("saved token ===>> $token");
  }

  String getUserToken() {
    return prefs?.getString(AppConstants.token) ?? "";
  }

  //
  bool _isActiveRememberMe = false;
  bool get isActiveRememberMe => _isActiveRememberMe;
  toggleRememberMe() {
    _isActiveRememberMe = !_isActiveRememberMe;
    print(_isActiveRememberMe);
    notifyListeners();
  }

  bool isLoggedIn() {
    return prefs!.containsKey(AppConstants.userEmail);
  }

  //
  Future updateDeviceToken() async {
    try {
      await _getDeviceToken();
      FirebaseMessaging.instance.subscribeToTopic(AppConstants.fcmTopic);
    } catch (e) {
      return e;
    }
  }

  //
  Future<String> _getDeviceToken() async {
    String deviceToken;
    if (Platform.isIOS) {
      deviceToken = (await FirebaseMessaging.instance.getAPNSToken())!;
    } else {
      deviceToken = (await FirebaseMessaging.instance.getToken())!;
    }
    print(' ==========> Device Token <========== $deviceToken');
    return deviceToken;
  }

  Future<bool> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.token);
    await prefs.clear();
    print("calling to remove data");
    authModel.statuscode == 0;
    return true;
  }

  //* ============== |> signIn With Google <|============== */
  Future<void> signUpWithGoogle(BuildContext context) async {
    print("GOOGLE SIGN UP: ");
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    await checkRegisterUser(
        context: context,
        email: googleUser!.email,
        medium: "google",
        name: googleUser.displayName);

    await _googleSignIn.signOut();
    await _googleSignIn.disconnect();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    print("GOOGLE SIGN IN: ");
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    await checkGoogleUserLogIn(email: googleUser!.email, context: context);
    await _googleSignIn.signOut();
    await _googleSignIn.disconnect();
  }

  //* ============== |> signUp With FACEBOOK <|============== */
  Future<void> signUpWithFacebook(BuildContext context) async {
    Loader.show(context);
    print("Facebook SIGN IN: ");
    try {
      final LoginResult loginResult =
          await _facebookAuth.login(permissions: ['email']);

      log("Facebook login Status ${loginResult.status.name}");
      log("Facebook login Status ${loginResult.status}");
      if (loginResult.status == LoginStatus.success) {
        final userData = await FacebookAuth.instance
            .getUserData(); // This method is getting stucked!
        faceBookUser = FaceBookUser.fromMap(userData);
        print("${faceBookUser!.email}");

        if (faceBookUser?.email != null) {
          await checkRegisterUser(
              name: faceBookUser!.name,
              context: context,
              email: faceBookUser!.email!,
              medium: "facebook");
        } else {
          print("USER DOESN'T HAVE AN EMAIL ACCOUNT CONNECTED");
          showToast("User doesn't have any email inthis account", context);
        }
      } else {
        print("NO EXISTING FACEBOOK USER!");
      }
    } catch (error) {
      print("FACEBOOK AUTH ERROR: $error");
    }
    Loader.hide();
  }

  //* ============== |> signIn With FACEBOOK <|============== */
  Future<void> signInWithFacebook(BuildContext context) async {
    print("Facebook SIGN IN: ");
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      log("${loginResult.message}");
      if (loginResult.status == LoginStatus.success) {
        final userData = await FacebookAuth.instance.getUserData();
        print("User Data : $userData");
        faceBookUser = FaceBookUser.fromMap(userData);

        if (faceBookUser?.email != null) {
          await checkFacebookUserLogIn(
              email: faceBookUser!.email!, context: context);
        } else {
          log("Facebook user with no email!");
          showToast(
              "This account doesn't have a email connected to it!", context);
        }
      } else {
        print("NO EXISTING FACEBOOK USER!");
      }
    } catch (error) {
      print("FACEBOOK AUTH ERROR: $error");
    }
  }

//* ============== |> signUp With Apple <|============== */
  String generateNonce([int length = 32]) {
    const String charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<void> signUpWithApple(BuildContext context) async {
    print("APPLE SIGN UP: ");

    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );
    final userCred =
        await FirebaseAuth.instance.signInWithCredential(oauthCredential);

    await checkRegisterUser(
        context: context,
        email: userCred.user!.email!,
        medium: "apple",
        name: userCred.user!.displayName);

    //Loader.hide();
  }
  //* ============== |> end <|============== */

  Future<void> signInApple(BuildContext context) async {
    // var redirectURL = "https://olga-14137.firebaseapp.com/__/auth/handler"; // Will be needed if it's not an apple device
    // var clientID = "com.cfpc.olgaios";  // Will be needed if it's not an apple device
    //Loader.show(context);
    print("APPLE SIGN IN: ");

    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );
    final userCred =
        await FirebaseAuth.instance.signInWithCredential(oauthCredential);

    //Loader.hide();
    if (userCred.user != null) {
      await checkAppleUserLogIn(email: userCred.user!.email!, context: context);
    }
  }

  //===========
  Future<void> firebaseAuthSystem(String email) async {
    List<String> ways = await _authProvider.fetchSignInMethodsForEmail(email);

    if (ways.isEmpty) {
      await _authProvider.createUserWithEmailAndPassword(
          email: email, password: "12345678");
      return;
    } else {
      await _authProvider.signInWithEmailAndPassword(
          email: email, password: "12345678");
      return;
    }
  }

  Future<bool> databaseAuthSystem(String email) async {
    Map<String, dynamic> params = {};
    params['email'] = email;
    var loginApiURL = AppConstants.baseURL + AppConstants.emailCheck;
    var response = await ApiModel.post(params, loginApiURL);
    return response['statuscode'] == 200;
  }

  Future<void> signOutFirebase() async => await _authProvider.signOut();

  //* ============== |> signIn With BIOMETRIC <|============== */
  Future hasBiometrics() async {
    try {
      bool status = await LocalAuthentication().canCheckBiometrics;
      return status;
    } on PlatformException catch (e) {
      print("Error in has Biometric $e");
    }
  }

  biometricSystems() async {
    // 31 >  30
    List<BiometricType> x =
        await LocalAuthentication().getAvailableBiometrics();
    print(x);
    if (x.contains(BiometricType.fingerprint)) {
      print("Has FIngerprint");
    }
    if (x.contains(BiometricType.face)) {
      print("Has face ID");
    }
  }

  authenticate() async {
    try {
      return await LocalAuthentication().authenticate(
        localizedReason: 'Unlock to Login!',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          sensitiveTransaction: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      print("Error in Biometric authentication $e");
      return false;
    }
  }
}
