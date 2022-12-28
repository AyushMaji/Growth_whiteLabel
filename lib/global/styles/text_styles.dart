import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/color_resources.dart';

class TextStyles {

  //:::::::::::::::::::
  static TextStyle gestureContinueStyle(BuildContext context) {
    return TextStyle(
      color: ColorResources.getContinueTxtColor(context), 
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 16.sp,
    );
  }

  //:::::::::::::::::::
  static TextStyle boldTextStyle(BuildContext context) {
    return TextStyle(
      color: ColorResources.getBlackTextColor(context),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 15.sp,
    );
  }

  //:::::::::::::::::::
  static TextStyle normalBoldTextStyle(BuildContext context) {
    return TextStyle(
      color: ColorResources.getBlackTextColor(context),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 14.sp,
    );
  }

  //:::::::::::::::::::
  static TextStyle smallBoldTextStyle(BuildContext context) {
    return TextStyle(
      color: ColorResources.getBlackTextColor(context),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      fontSize: 12.sp,
    );
  }
  //:::::::::::::::::::
  static TextStyle smallRegularBlackTextStyle(BuildContext context) {
    return TextStyle(
      color: ColorResources.getBlackTextColor(context),
      fontFamily: 'Poppins',
      fontSize: 12.sp,
    );
  }
  //:::::::::::::::::::
  static TextStyle smallWhiteBoldTextStyle(BuildContext context) {
    return TextStyle(
      color: ColorResources.getWhiteTextColor(context),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 14.sp,
    );
  }
  //
    static TextStyle smallGoldBoldTextStyle(BuildContext context) {
    return TextStyle(
      color: ColorResources.getContinueTxtColor(context),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 14.sp,
    );
  }

  //:::::::::::::::::::
 static TextStyle regularBoldTextStyle(BuildContext context) {
    return TextStyle(
      color: ColorResources.getBlackTextColor(context),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 14.sp,
    );
  }

  //:::::::::::::::::::
  static TextStyle gestureTextStyle(BuildContext context) {
    return TextStyle(
      color: ColorResources.getTextRedColor(context),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 16.sp,
    );
  }   

  //:::::::::::::::::::
  static TextStyle questionTextStyle(BuildContext context) {
    return TextStyle(
      color: ColorResources.getBlackTextColor(context),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
      fontSize: 17.sp,
    );
  }

  //:::::::::::::::::::
  static TextStyle labelTextStyle(BuildContext context) {
    return TextStyle(
      color: ColorResources.getButtonCalicoColor(context),
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    );
  }

    //:::::::::::::::::::
  static TextStyle creamNormalStyle(BuildContext context) {
    return TextStyle(
      color: ColorResources.getButtonCalicoColor(context),
      fontFamily: 'Poppins',
    );
  }

  //:::::::::::::::::::
  static TextStyle creamBoldStyle(BuildContext context) {
    return TextStyle(
      color: ColorResources.getButtonCalicoColor(context),
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
    );
  }
  //:::::::::::::::::::
  static TextStyle redNormalStyle(BuildContext context) {
    return TextStyle(
      color: ColorResources.getRed(context),
      fontFamily: 'Poppins',
    );
  }
}
