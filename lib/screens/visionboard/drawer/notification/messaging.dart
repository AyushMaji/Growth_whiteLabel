import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/styles/box_decoration.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../../../global/styles/text_styles.dart';

class Messaging extends StatefulWidget {
  const Messaging({Key? key}) : super(key: key);

  @override
  State<Messaging> createState() => _EasyAlertsState();
}

class _EasyAlertsState extends State<Messaging> {
  bool isToggled = true;
  bool gentleNotiToggled = true;
  bool bannerToggled = false;
  bool allowInterruptionsToggled = true;
  bool promotionsToggled = true;
  bool remindersToggled = true;
  int _radioSelected = 2;
  bool status = false;

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardAppBar(
        context,
        getTranslated("messaging", context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 8.w, right: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: boxDecoration,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getTranslated("allow_push_notification", context),
                        style: TextStyles.smallWhiteBoldTextStyle(context),
                      ),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: FlutterSwitch(
                          height: 25.h,
                          width: 48.w,
                          //padding: 4.0,
                          toggleSize: 18.0.h,
                          toggleColor: const Color(0xffDEB988),
                          activeColor: const Color(0xFFFEFFF9),
                          inactiveColor: const Color(0xFFFEFFF9),
                          value: isToggled,
                          onToggle: (value) {
                            //
                            setState(() {
                              isToggled = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //
              SizedBox(height: 20.h),
              ListTile(
                //contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                title: Text(
                  getTranslated("gentle_notification", context),
                  style: TextStyles.smallBoldTextStyle(context),
                ),
                subtitle: Text(getTranslated("silence_notifications", context)),
                trailing: SizedBox(
                  //color: Colors.green,
                  height: 25.h,
                  width: 48.w,
                  child: FlutterSwitch(
                    height: 25.h,
                    width: 48.w,
                    toggleSize: 18.0.h,
                    toggleColor: Colors.white,
                    borderRadius: 30.0,
                    activeColor: const Color(0xffDEB988),
                    inactiveColor: const Color(0xff2E2E2E),
                    value: gentleNotiToggled,
                    onToggle: (value) {
                      setState(() {
                        gentleNotiToggled = value;
                      });
                    },
                  ),
                ),
              ),

              //
              SizedBox(height: 20.h),
              ListTile(
                //contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                title: Text(
                  getTranslated("banners", context),
                  style: TextStyles.smallBoldTextStyle(context),
                ),
                subtitle: Text(getTranslated("display_on_top", context)),
                trailing: SizedBox(
                  //color: Colors.green,
                  height: 25.h,
                  width: 48.w,
                  child: FlutterSwitch(
                    height: 25.h,
                    width: 48.w,
                    toggleSize: 18.0.h,
                    toggleColor: Colors.white,
                    borderRadius: 30.0,
                    activeColor: const Color(0xffDEB988),
                    inactiveColor: const Color(0xff2E2E2E),
                    value: bannerToggled,
                    onToggle: (value) {
                      setState(() {
                        bannerToggled = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              ListTile(
                title: Text(
                  getTranslated("lock_screen_notification", context),
                  style: TextStyles.smallBoldTextStyle(context),
                ),
              ),

              Row(
                children: [
                  Radio(
                    //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: 1,
                    groupValue: _radioSelected,
                    activeColor: const Color(0xffDEB988),
                    onChanged: (value) {
                      setState(() {
                        _radioSelected = value as int;
                      });
                    },
                  ),
                  Text(getTranslated("show", context)),
                ],
              ),
              Row(
                children: [
                  Radio(
                    //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: 2,
                    groupValue: _radioSelected,
                    activeColor: const Color(0xffDEB988),
                    onChanged: (value) {
                      setState(() {
                        _radioSelected = value as int;
                      });
                    },
                  ),
                  Text(getTranslated("do_not_show", context)),
                ],
              ),
              Row(
                children: [
                  Radio(
                    //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    value: 3,
                    groupValue: _radioSelected,
                    activeColor: const Color(0xffDEB988),
                    onChanged: (value) {
                      setState(() {
                        _radioSelected = value as int;
                      });
                    },
                  ),
                  Text(getTranslated("show_but_hide_contents", context)),
                ],
              ),

              SizedBox(height: 20.h),
              ListTile(
                title: Text(
                  getTranslated("allow-interruptions", context),
                  style: TextStyles.smallBoldTextStyle(context),
                ),
                subtitle: Text(getTranslated("receive_notification", context)),
                trailing: Container(
                  //color: Colors.green,
                  height: 25.h,
                  width: 48.w,
                  child: FlutterSwitch(
                    height: 25.h,
                    width: 48.w,
                    toggleSize: 18.0.h,
                    toggleColor: Colors.white,
                    borderRadius: 30.0,
                    activeColor: Color(0xffDEB988),
                    value: allowInterruptionsToggled,
                    onToggle: (value) {
                      setState(() {
                        allowInterruptionsToggled = value;
                      });
                    },
                  ),
                ),
                // Switch(
                //   value: true,
                //   onChanged: (value) {
                //     //
                //   },
                // ),
              ),

              SizedBox(height: 20.h),
              //
            ],
          ),
        ),
      ),
    );
  }
}
