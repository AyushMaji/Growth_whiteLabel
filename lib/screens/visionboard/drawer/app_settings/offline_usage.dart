import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';

import '../../../../global/styles/text_styles.dart';

class OfflineUsage extends StatefulWidget {
  static const String id = "/offlineUsage";
  const OfflineUsage({Key? key}) : super(key: key);

  @override
  State<OfflineUsage> createState() => _EasyAlertsState();
}

class _EasyAlertsState extends State<OfflineUsage> {
  bool isToggled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardAppBar(
        context,
        getTranslated("offline_usage", context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, left: 15.w, right: 15.w),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getTranslated("use_olga_offline", context),
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
              height: 10.h,
            ),
            Text(getTranslated("when_you_go_offline", context)),
          ]),
        ),
      ),
    );
  }
}
