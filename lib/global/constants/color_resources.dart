import 'package:olga/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorResources {
  static Color getButtonCalicoColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFDEB988)
        : const Color(0xFFDEB988);
  }

    static Color getVideoButtonCalicoColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFB50000)
        : const Color(0xFFB50000);
  }

  static Color getContinueTxtColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFDEB988)
        : const Color(0xFFDEB988);
  }

  static Color getTxtButtonColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFDEB988)
        : const Color(0xFFB50000);
  }

  static Color getButtonRedColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFB50000)
        : const Color(0xFFB50000);
  }

  static Color getTextRedColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFB50000)
        : const Color(0xFFF73431);
  }

  static Color getBlackTextColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFD9D3E2) 
        :const Color(0xFF000000) ;
  }
    static Color getWhiteTextColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF000000)
        :  const Color(0xFFFFFFFF);
  }

  static Color getLightSkyBlue(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFc7c7c7)
        : const Color(0xFF8DBFF6);
  }

  static Color getHarlequin(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF257800)
        : const Color(0xFF3FCC01);
  }

  static Color getCheris(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF941546)
        : const Color(0xFFE2206B);
  }

  static Color getTextTitle(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF333333);
  }

  static Color getGrey(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF808080)
        : const Color(0xFFF1F1F1);
  }

  static Color getRed(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF7a1c1c)
        : const Color(0xffB50000);
  }

  static Color getYellow(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF916129)
        : const Color(0xFFFFAA47);
  }

  static Color getHint(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFc7c7c7)
        : const Color(0xFF9E9E9E);
  }

  static Color getGainsBoro(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF999999)
        : const Color(0xFFE6E6E6);
  }

  static Color getTextBg(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF414345)
        : const Color(0xFFF3F9FF);
  }

  static Color getIconBg(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF2e2e2e)
        : const Color(0xFFF9F9F9);
  }

  static Color getHomeBg(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF3d3d3d)
        : const Color(0xFFf7f7f7);
  }

  static Color getImageBg(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF3f4347)
        : const Color(0xFFE2F0FF);
  }

  static Color getSellerTxt(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF517091)
        : const Color(0xFF92C6FF);
  }

  static Color getChatIcon(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFebebeb)
        : const Color(0xFFD4D4D4);
  }

  static Color getLowGreen(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF7d8085)
        : const Color(0xFFEFF6FE);
  }

  static Color getGreen(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF167d3c)
        : const Color(0xFF23CB60);
  }

  static Color getFloatingBtn(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF49698c)
        : const Color(0xFF7DB6F5);
  }

  static Color getPrimary(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFf0f0f0)
        : Theme.of(context).primaryColor;
  }

  static Color getSearchBg(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF585a5c)
        : const Color(0xFFF4F7FC);
  }

  static const Color buttonBgColor = Color(0xFFDEB988); //550EB9
  static const Color textColorBlue = Color(0xFF550EB9);
  //
  static const Color blackColor = Color(0xff000000);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color lightSkyBlueColor = Color(0xff8DBFF6);
  static const Color harliqueenColor = Color(0xff3FCC01);
  static const Color cheriseColor = Color(0xffE2206B);
  static const Color greyColor = Color(0xff808080);
  static const Color redColor = Color(0xFFD32F2F);
  static const Color yelloColor = Color(0xFFFFAA47);
  static const Color hintTextColor = Color(0xff9E9E9E);
  static const Color gaintBaroColor = Color(0xffE6E6E6);
  static const Color textBgColor = Color(0xffF3F9FF);
  static const Color iconBgColor = Color(0xffF9F9F9);
  static const Color homeBgColor = Color(0xffF0F0F0);
  static const Color imageBgColor = Color(0xffE2F0FF);
  static const Color lowGreenColor = Color(0xffEFF6FE);
  static const Color greenColor = Color(0xff23CB60);

  static const Map<int, Color> colorMap = {
    50: Color(0x10192D6B),
    100: Color(0x20192D6B),
    200: Color(0x30192D6B),
    300: Color(0x40192D6B),
    400: Color(0x50192D6B),
    500: Color(0x60192D6B),
    600: Color(0x70192D6B),
    700: Color(0x80192D6B),
    800: Color(0x90192D6B),
    900: Color(0xff192D6B),
  };

  static const MaterialColor primaryMeterial =
      MaterialColor(0xFF192D6B, colorMap);
}
