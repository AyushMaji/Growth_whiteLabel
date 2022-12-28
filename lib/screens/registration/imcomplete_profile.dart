import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/screens/visionboard/drawer/profile/personal_settings.dart';
import '../../global/constants/color_resources.dart';
import '../../global/constants/images.dart';
import '../../global/widgets/custom_widgets.dart';

class IncompleteProfileScreen extends StatefulWidget {
  static const String id = "/incomplete_profile_screen";
  const IncompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<IncompleteProfileScreen> createState() =>
      _IncompleteProfileScreenState();
}

class _IncompleteProfileScreenState extends State<IncompleteProfileScreen> {
//
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPopLogout(context),
      child: Scaffold(
        appBar: dashboardAppBar(context, 'Incomplete Profile'),
        body: Container(
          padding: EdgeInsets.all(10.sm),
          child: Column(
            children: [
              Image.asset(Images.incompleted),
              Text(
                // getTranslated('congratulations', context),
                'Complete your Profile',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: "",
                  color: ColorResources.getButtonCalicoColor(context),
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                // getTranslated('your_have_set_goal', context),
                'Please provide us with the required details to complete your profile.',
                style: TextStyle(
                  fontSize: 16.sp,
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
              goPageWithName(context, PersonalSettings.id);
            },
            title: 'Set profile'.toUpperCase(),
            buttonStyle: ButtonStyles.getCommonStyle(context),
            //getTranslated('continue', context),
          ),
        ),
      ),
    );
  }
}
