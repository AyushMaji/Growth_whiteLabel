import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';

class SyncToMyCalendar extends StatefulWidget {
  static const String id = "SyncToMyCalendar";
  const SyncToMyCalendar({Key? key}) : super(key: key);

  @override
  State<SyncToMyCalendar> createState() => _EasyAlertsState();
}

class _EasyAlertsState extends State<SyncToMyCalendar> {
  bool isToggled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardAppBar(
        context,
        getTranslated("sync_my_calendar", context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    getTranslated("sync_my_calendar", context),
                    style: TextStyles.smallBoldTextStyle(context),
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: FlutterSwitch(
                      height: 25.h,
                      width: 50.w,
                      toggleSize: 18.0.h,
                      toggleColor: Colors.white,
                      borderRadius: 30.0,
                      activeColor: const Color(0xffDEB988),
                      inactiveColor: const Color(0xff2E2E2E),
                      value: isToggled,
                      onToggle: (value) {
                        setState(() {
                          isToggled = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              //
              SizedBox(
                height: 10.h
              ),
              Text(getTranslated("automatically_sync_all", context)),
            ],
          ),
        ),
      ),
    );
  }
}
