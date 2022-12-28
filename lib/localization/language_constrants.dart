import 'package:flutter/material.dart';
import '/localization/app_localization.dart';

String getTranslated(String key, BuildContext context) {
  return AppLocalization.of(context)!.translate(key)!;
}

String? newTranslated(String key, BuildContext context) {
  return AppLocalization.of(context)!.translate(key);
}
