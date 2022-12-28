// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/styles/box_decoration.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:flutter_switch/flutter_switch.dart';

class EasyAlerts extends StatefulWidget {
  static const String id = "/easyAlerts";
  const EasyAlerts({Key? key}) : super(key: key);

  @override
  State<EasyAlerts> createState() => _EasyAlertsState();
}

class _EasyAlertsState extends State<EasyAlerts> {
  bool isVisible = true;
  bool isToggled = true;
  bool gentleNotiToggled = true;
  bool bannerToggled = false;
  bool allowInterruptionsToggled = true;
  bool promotionsToggled = true;
  bool remindersToggled = true;
  int _radioSelected = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardAppBar(
        context,
        getTranslated("easy_alerts", context),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                        getTranslated("allow_notification", context),
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
                          toggleColor: Color(0xffDEB988),
                          activeColor: const Color(0xFFFEFFF9),
                          inactiveColor: const Color(0xFFFEFFF9),
                          value: isToggled,
                          onToggle: (value) {
                            //
                            setState(() {
                              isToggled = value;
                              isVisible = !isVisible;
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
              Visibility(
                visible: isVisible,
                child: ListTile(
                  //contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                  title: Text(
                    getTranslated("gentle_notification", context),
                    style: TextStyles.smallBoldTextStyle(context),
                  ),
                  subtitle:
                      Text(getTranslated("silence_notifications", context)),
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
                      activeColor: Color(0xffDEB988),
                      inactiveColor: Color(0xff2E2E2E),
                      value: gentleNotiToggled,
                      onToggle: (value) {
                        setState(() {
                          gentleNotiToggled = value;
                        });
                      },
                    ),
                  ),

                ),
              ),

              //
              SizedBox(height: 20.h),
              Visibility(
                visible: isVisible,
                child: ListTile(
                  //contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                  title: Text(
                    getTranslated("banners", context),
                    style: TextStyles.smallBoldTextStyle(context),
                  ),
                  subtitle: Text(getTranslated("display_on_top", context)),
                  trailing: SizedBox(
                    height: 25.h,
                    width: 48.w,
                    child: FlutterSwitch(
                      height: 25.h,
                      width: 48.w,
                      toggleSize: 18.0.h,
                      toggleColor: Colors.white,
                      borderRadius: 30.0,
                      activeColor: Color(0xffDEB988),
                      inactiveColor: Color(0xff2E2E2E),
                      value: bannerToggled,
                      onToggle: (value) {
                        setState(() {
                          bannerToggled = value;
                        });
                      },
                    ),
                  ),

                ),
              ),
              SizedBox(height: 20.h),
              Visibility(
                visible: isVisible,
                child: ListTile(
                  title: Text(
                    getTranslated("lock_screen_notification", context),
                    style: TextStyles.smallBoldTextStyle(context),
                  ),
                ),
              ),
            
              Visibility(
                visible: isVisible,
                child: Row(
                  children: [
                    Radio(
                      //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: 1,
                      groupValue: _radioSelected,
                      activeColor: Color(0xffDEB988),
                      onChanged: (value) {
                        setState(() {
                          _radioSelected = value as int;
                        });
                      },
                    ),
                    Text(getTranslated("show", context)),
                  ],
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Row(
                  children: [
                    Radio(
                      //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: 2,
                      groupValue: _radioSelected,
                      activeColor: Color(0xffDEB988),
                      onChanged: (value) {
                        setState(() {
                          _radioSelected = value as int;
                        });
                      },
                    ),
                    Text(getTranslated("do_not_show", context)),
                  ],
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Row(
                  children: [
                    Radio(
                      //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: 3,
                      groupValue: _radioSelected,
                      activeColor: Color(0xffDEB988),
                      onChanged: (value) {
                        setState(() {
                          _radioSelected = value as int;
                        });
                      },
                    ),
                    Text(getTranslated("show_but_hide_contents", context)),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
              Visibility(
                visible: isVisible,
                child: ListTile(
                  title: Text(
                    getTranslated("allow-interruptions", context),
                    style: TextStyles.smallBoldTextStyle(context),
                  ),
                  subtitle:
                      Text(getTranslated("receive_notification", context)),
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
                      activeColor: Color(0xffDEB988),
                      inactiveColor: Color(0xff2E2E2E),
                      value: allowInterruptionsToggled,
                      onToggle: (value) {
                        setState(() {
                          allowInterruptionsToggled = value;
                        });
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),
              Visibility(
                visible: isVisible,
                child: ListTile(
                  title: Text(
                    getTranslated("promotions", context),
                    style: TextStyles.smallBoldTextStyle(context),
                  ),
                  subtitle:
                      Text(getTranslated("receive_offers_promotions", context)),
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
                      activeColor: Color(0xffDEB988),
                      inactiveColor: Color(0xff2E2E2E),
                      value: promotionsToggled,
                      onToggle: (value) {
                        setState(() {
                          promotionsToggled = value;
                        });
                      },
                    ),
                  ),
                ),
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
