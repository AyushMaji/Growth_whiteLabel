// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/constants/responsive_values.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/text_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/screens/registration/enter_name.dart';

class SignupWelcomeScreen extends StatefulWidget {
  static const String id = "/signupWelcomeScreen";
  const SignupWelcomeScreen({Key? key}) : super(key: key);

  @override
  State<SignupWelcomeScreen> createState() => _SignupWelcomeScreenState();
}

class _SignupWelcomeScreenState extends State<SignupWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Image.asset(
                Images.registrationFirst,
                width: 250.w,
              ),
              Text(getTranslated("welcome_message", context),
              textAlign: TextAlign.center,),
              TextBtn(
                onPressed: () {
                  setState(() {
                  goPageWithName(context, EnterName.id);
                  });               
                },
                title: getTranslated('continue_small', context),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(ResponsiveValues.paddingDefault),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(getTranslated("already_have_account", context)),
            SizedBox(width: 10.w),
            GestureDetector(
              child: Text(
                getTranslated("sign_in", context),
                 style: TextStyles.gestureTextStyle(context),               
              ),
            ),
          ],
        ),
      ),
    );
  }
}
