// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';

class ImproveArea extends StatefulWidget {
  static const String id = "/improveArea";
  const ImproveArea({Key? key}) : super(key: key);

  @override
  State<ImproveArea> createState() => _ImproveAreaState();
}

class _ImproveAreaState extends State<ImproveArea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.w),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(height: 10.h),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: Text(
                        getTranslated('life_wheel', context),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Image.asset(
                    Images.userPlaceholder,
                    width: 60.w,
                  ),
                ],
              ),
              SizedBox(height: 10.w),
                 SubmitButton(
                title: getTranslated("submit", context),
                onPressed: () {
                  setState(() {
                    print("button ready to work");
                  });
                }, buttonStyle: ButtonStyles.getCommonStyle(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
