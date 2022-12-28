// ignore_for_file: avoid_print, prefer_const_constructors
import 'dart:io';
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/auth_provider.dart';
import 'package:olga/screens/auth/signin_screen.dart';
import 'package:olga/screens/languages/choose_language.dart';
import 'package:provider/provider.dart';

class StartingScreen extends StatefulWidget {
  static const String id = "/firstScreen";
  const StartingScreen({Key? key}) : super(key: key);

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.authModel.data?.user?.otp = null;
  
  }
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    var size = MediaQuery.of(context).size.width;
    print("screen 4.7 width ===>>> $size");
    return Scaffold(
      //!=====================> status color match with appbar color 24th Aug
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          //<-- SEE HERE
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
      ),
      //!==========================>
    
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Image.asset(Images.olgaTM, width: 130.w),
             SizedBox(height: 10.h),
            Text("The Campbell Page Personal Development Assistant"),
            SizedBox(height: 10.h),

            Image.asset(Images.campBell, width: 84.w),
            SizedBox(height: 10.h),
            ClipOval(child: Image.asset(Images.userPlaceholder, width: 230.w)),
            SizedBox(height: 30.h),
            Text(
              // getTranslated('brought_to_you_by', context),
              'Powered by the',
              style: TextStyle(
                fontSize: 16.sp,
                letterSpacing: 0.5,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10.h),
            Image.asset(
              Images.centreTM,
              width: 200.w,
            ),
            SizedBox(height: 55.h),
            Padding(
              padding:  EdgeInsets.only(left: 10.0, right: 10),
              child: SubmitButton(
                title: getTranslated('register', context),
                onPressed: () {
                  goPageWithName(context, ChooseLanguage.id);
                  print('registering new user ');
                },
                buttonStyle: ButtonStyles.getCommonStyle(context),
              ),
            ),
            SizedBox(height: 20.h),
            //
    
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
            
            //
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                onTap: () async {
                  await authProvider.signUpWithGoogle(context);
                },
                child: Image.asset(Images.google_round, height: 50,)),
                SizedBox(width: 25),
                
                InkWell(
                onTap: () async {
                  await authProvider.signUpWithFacebook(context);
                },
                child: Image.asset(Images.facebook_round, height: 50,)),
                SizedBox(width: 20),

                if (io.Platform.isIOS)
                  Column(children: [
                   
                    InkWell(
                    onTap: () async {
                      await authProvider.signUpWithApple(context);
                    },
                    child: Image.asset(Images.appbleButtonRound, height: 55,)),
                
                ]),
                                                                 
              ],
            ),
    
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(getTranslated("already_have_account", context)),
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: () {
                  setState(() {
                    goPage(context, SigninScreen());
                    print("sign in....");
                  });
                  },
                  child: Text(
                    getTranslated("sign_in", context),
                    style: TextStyles.gestureTextStyle(context),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
