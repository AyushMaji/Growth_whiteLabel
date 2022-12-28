// ignore_for_file: avoid_print, prefer_const_constructors
import 'dart:io';
import 'dart:io' as io;
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:olga/provider/profile_provider.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:olga/global/constants/color_resources.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/box_decoration.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/auth_provider.dart';
import 'package:olga/screens/start/starting_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class SigninScreen extends StatefulWidget {
  static const String id = "/signinScreen";
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _otpController = TextEditingController(); //
  String currentText = "";

  bool _user = true; //!+++++++++++++
  bool _coach = false;
  bool _company = false;
  bool hidePass = true;
  bool _chooseType = true; //!+++++++++++++
  String _userType = "2"; //!+++++++++++++ 0

  bool activePinCodeTextField = false;
  bool activeEmailTextfield = true;

  @override
  void initState() {
    super.initState();
    print(" =========== yes come back again");
    _user = true;
    _coach = false;
    _company = false;

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.authModel.data?.user?.otp = null;

    _loadUserEmailPassword();
    //confirmBioMetricLogin();
  }

  void _loadUserEmailPassword() async {
    print("Load Email");
    final storeProvider = Provider.of<StorageProvider>(context, listen: false);
    try {
      final prefs = await SharedPreferences.getInstance();
      var email = prefs.getString("user_email") ?? '';
      var userType = prefs.getString("user_type") ?? storeProvider.userType;
      //_emailController.text = email;
      _emailController.text = '';

      // ========= |> user emails
      print("email in textFromField ===>>> ${_emailController.text}");
      print("getting from sharedPreferences ===>>> $email");

      // ========= |> user type
      print("user type in textFromField ===>>> $_userType");
      print("getting from sharedPreferences ===>>> $userType");
    } catch (e) {
      print(e);
    }
  }

  void confirmBioMetricLogin() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.biometricSystems();
    await authProvider.authenticate();
  }

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StorageProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Consumer<AuthProvider>(builder: (context, authProvider, child) {
          return Consumer<ProfileProvider>(
              builder: (context, profileData, child) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //!Text(_userType),
                      SizedBox(height: 25.h),
                      Text(
                        getTranslated("sign_in", context),
                        style: TextStyles.boldTextStyle(context),
                      ),
                      SizedBox(height: 20.h),

                      //
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                setState(() {
                                  _user = true;
                                  _coach = false;
                                  _company = false;
                                  _chooseType = true;
                                  _userType = "2";
                                  print("choose ===>>>$_user");
                                });
                                storeProvider.updateUserType("2");
                                await authProvider.biometricSystems();
                                await authProvider.authenticate();
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Container(
                                  decoration: imageBoxDecoration(
                                    _user
                                        ? Color(0xFFEAA3A3)
                                        : Colors.transparent,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 15.h, bottom: 15.h),
                                    child: Text(
                                      getTranslated("user", context),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: _user
                                            ? Color(0xffB50000)
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //

                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                setState(() {
                                  _user = false;
                                  _coach = true;
                                  _company = false;
                                  _chooseType = true;
                                  _userType = "3";
                                  storeProvider.updateUserType("3");
                                  print("choose ===>>>$_coach");
                                });
                                // await authProvider.biometricSystems();
                                //await authProvider.authenticate();
                                // await authProvider.signUpWithApple(context);
                                print(Platform.operatingSystemVersion);
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                  decoration: imageBoxDecoration(
                                    _coach
                                        ? Colors.orangeAccent
                                        : Colors.transparent,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 15.h, bottom: 15.h),
                                    child: Text(
                                      getTranslated("coach", context),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: _coach
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          //

                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "Stay tuned. We are launching this feature soon."),
                                  backgroundColor: Color(0xFF152A38),
                                ));
                                setState(() {
                                  _user = false;
                                  _coach = false;
                                  _company = false;
                                  _chooseType = false;
                                  _userType = "4";
                                  storeProvider.updateUserType("4");
                                  print("choose ===>>>$_company");
                                });

                                await authProvider.biometricSystems();
                                //await authProvider.authenticate();
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Container(
                                  decoration: imageBoxDecoration(
                                    _company
                                        ? Color(0xFFEE5757)
                                        : Colors.transparent,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 10.h, bottom: 10.h),
                                    child: Column(
                                      children: [
                                        Text(
                                          "COMPANY",
                                          //getTranslated("coach", context),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: _company
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                        Shimmer.fromColors(
                                          baseColor: Colors.red,
                                          highlightColor: Colors.white,
                                          child: Text(
                                            "Coming Soon",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 7.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        getTranslated('email', context),
                        style: TextStyle(
                            color:
                                authProvider.authModel.data?.user?.otp != null
                                    ? Color(0xffCBCBCB)
                                    : Color(0xff2E2E2E)),
                      ),
                      TextFormField(
                        enabled: authProvider.authModel.data?.user?.otp != null
                            ? false
                            : true,
                        controller: _emailController,
                        style: TextStyle(
                            color:
                                authProvider.authModel.data?.user?.otp != null
                                    ? Color(0xffCBCBCB)
                                    : Color(0xff2E2E2E)),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: 'example@email.com',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                                color: authProvider.authModel.data?.user?.otp !=
                                        null
                                    ? Color(0xffCBCBCB)
                                    : Color(0xff2E2E2E)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color:
                                  authProvider.authModel.data?.user?.otp != null
                                      ? Color(0xffCBCBCB)
                                      : Color(0xff2E2E2E),
                              width: 1.0,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) return "Email can not be empty";
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            print("typing email ===>>> $value");
                          });
                        },
                      ),
                      SizedBox(height: 15.h),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter OTP",
                            style: TextStyle(
                                color: authProvider.authModel.data?.user?.otp ==
                                        null
                                    ? Color(0xffCBCBCB)
                                    : Color(0xff2E2E2E)),
                          ),
                          SizedBox(
                            height: 5.h
                          ),
                          Visibility(
                            visible: true,
                            child: PinCodeTextField(
                              enabled:
                                  authProvider.authModel.data?.user?.otp == null
                                      ? false
                                      : true,
                              controller: _otpController,
                              keyboardType: TextInputType.number,
                              appContext: context,
                              pastedTextStyle: TextStyle(
                                color: Colors.green.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                              length: 6,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                borderWidth: 1,
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 50,
                                fieldWidth: 40,
                                activeFillColor: Colors.green,
                                inactiveColor: Color(0xff2E2E2E),
                              ),
                              cursorColor: Colors.black,
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              onCompleted: (v) {
                                print("Completed");
                              },
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  currentText = value;
                                });
                              },
                              beforeTextPaste: (text) {
                                print("Allowing to paste $text");
                                return true;
                              },
                            ),
                          ),

                          //!======================
                          SizedBox(height: 10.sp),
                          Visibility(
                            visible:
                                authProvider.authModel.data?.user?.otp == null
                                    ? false
                                    : true,
                            child: Row(
                              children: [
                                Text(
                                  "Haven't received OTP ? ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                GestureDetector(
                                  onTap: () => authProvider.sendLoginOtp(
                                      context: context,
                                      email: _emailController.text),
                                  child: Text(
                                    "Resend",
                                    style: TextStyle(
                                        color: Color(0xffB50000),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.sp),

                      SizedBox(height: 25.h),
                      authProvider.authModel.data?.user?.otp == null
                          ? SubmitButton(
                              title: getTranslated('request_otp', context),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await authProvider.checkUserExist(
                                      email: _emailController.text,
                                      context: context);
                                  setState(() {});
                                  storeProvider
                                      .updateUserEmail(_emailController.text);
                                }
                                print('Login button is ready to work ');
                              },
                              buttonStyle: ButtonStyles.getCommonStyle(context),
                            )
                          : SubmitButton(
                              title: getTranslated('login', context),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    authProvider.loginWithOtp(
                                        email: _emailController.text,
                                        otp: _otpController.text,
                                        userType: storeProvider.userType,
                                        context: context);
                                  });
                                }
                                print('Login button is ready to work ');
                              },
                              buttonStyle: ButtonStyles.getCommonStyle(context),
                            ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                // ==============>>> Working one
                                bool weird = await authProvider.authenticate();
                                print(weird);
                                if (weird) {
                                  print("BIOMETRIC DONE!!");
                                  authProvider.loginUser(
                                      email: _emailController.text,
                                      password: "12345678",
                                      userType: storeProvider.userType,
                                      context: context);
                                } else {
                                  print("REJECTED!!");
                                }
                              },
                              child: Column(
                                children: [
                                  Image.asset(
                                    Images.facial3,
                                    width: 60.w,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    //getTranslated("facial_recognition", context),
                                    "Tap here for login using\nfingerprint or Facial recognition ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color:
                                            ColorResources.getButtonCalicoColor(
                                                context)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            getTranslated("dont_have_account", context),
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          SizedBox(width: 10.w),
                          GestureDetector(
                            onTap: () {
                              goPage(context, const StartingScreen());
                            },
                            child: Text(
                              getTranslated("register_small", context),
                              style: TextStyle(
                                  color: Color(0xffB50000), fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10.h),

                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(getTranslated('or', context)),
                          ),
                          const Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () async {
                          await authProvider.signInWithGoogle(context);
                        },
                        child: Image.asset(
                          Images.googleButton,
                          fit: BoxFit.fitWidth,
                        ),
                      ),

                      TextButton(
                        onPressed: () async {
                          //
                          await authProvider.signInWithFacebook(context);
                        },
                        child: Image.asset(
                          Images.facebookButton,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      if (io.Platform.isIOS)
                        TextButton(
                          onPressed: () async {
                            //
                            await authProvider.signInApple(context);
                          },
                          child: Image.asset(
                            Images.appbleButton,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      

                      SizedBox(height: 10.h),
                      Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400),
                                children: [
                                  TextSpan(
                                      text:
                                          'By continuing, you agree to Olga\'s ',
                                      style: TextStyle(color: Colors.black)),
                                  TextSpan(
                                      text: 'Terms of Service ',
                                      style: TextStyle(
                                        color: Color(0xffB50000),
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          //Code to launch your URL
                                          const url =
                                              'https://docs.google.com/document/d/1dp-Cdv-btcEOOffXQFl6sm4EwGV3EVeu/edit?usp=sharing&ouid=105929277528898615472&rtpof=true&sd=true';
                                          if (await canLaunch(url)) launch(url);
                                        }),
                                  TextSpan(
                                      text:
                                          'and acknowledge that you\'ve read our ',
                                      style: TextStyle(color: Colors.black)),
                                  TextSpan(
                                      text: 'Privacy Policy',
                                      style:
                                          TextStyle(color: Color(0xffB50000)),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          //Code to launch your URL
                                          const url =
                                              'https://docs.google.com/document/d/1EzMvcY2s-tlsL4PocF_mc7PNduTYzqGHQCc2vpat5tQ/edit?usp=drivesdk';
                                          if (await canLaunchUrl(
                                              Uri.parse(url))) launch(url);
                                        }),
                                ])),
                      ),

                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            );
          });
        }),
      ),
    );
  }
}
