import 'package:flutter/material.dart';
import 'package:olga/global/constants/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/screens/visionboard/visionboard.dart';
import '../../localization/language_constrants.dart';
import 'package:olga/global/constants/color_resources.dart';

class Completed extends StatefulWidget {
  static const String id = "/completed";
  const Completed({Key? key}) : super(key: key);

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
//
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPopLogout(context),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () async {
              await onWillPopLogout(context);
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
          flexibleSpace:  const Image(
            image: AssetImage(Images.appBarBG),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(10.sm),
          child: Column(
            children: [
              Image.asset(Images.completed),
              Text(
                getTranslated('congratulations', context),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "",
                  color: ColorResources.getButtonCalicoColor(context),
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                getTranslated('your_have_set_goal', context),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "",
                  color: ColorResources.getBlackTextColor(context),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SubmitButton(
            onPressed: () {
              goPageWithName(context, VisionBoard.id);
            },
            title: 'Vision board'.toUpperCase(),
            buttonStyle: ButtonStyles.getCommonStyle(context),
            //getTranslated('continue', context),
          ),
        ),
      ),
    );
  }
}
