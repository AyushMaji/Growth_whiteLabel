import 'package:flutter/material.dart';
import 'package:olga/global/constants/color_resources.dart';

class ButtonStyles {
  static ButtonStyle getRedStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        ColorResources.getButtonRedColor(context),
      ),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    );
  }

  static ButtonStyle getCommonStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        ColorResources.getButtonCalicoColor(context),
      ),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    );
  }

  static ButtonStyle getGreyStyle(BuildContext context) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        ColorResources.greyColor,
        //ColorResources.getButtonCalicoColor(context),
      ),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    );
  }

  static ButtonStyle getLightGreyStyle(BuildContext context) {
    return ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(
        Color(0xffEEEBEE),
        //ColorResources.getButtonCalicoColor(context),
      ),
      foregroundColor: MaterialStateProperty.all(Colors.black),
    );
  }
}
