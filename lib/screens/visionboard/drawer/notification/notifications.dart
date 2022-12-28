import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/box_decoration.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/screens/visionboard/drawer/notification/easy_alerts.dart';
import 'package:olga/screens/visionboard/drawer/notification/messaging.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool isToggled = true;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardAppBar(
        context,
        getTranslated("notification", context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Container(
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

              //
              SizedBox(height: 20.h),
              Visibility(
                visible: isVisible,
                child: Text(
                  getTranslated("notification_type", context),
                  style: TextStyles.smallBoldTextStyle(context),
                ),
              ),
              Visibility(
                visible: isVisible,
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
                  title: Text(
                    getTranslated("easy_alerts", context),
                    style: TextStyles.smallBoldTextStyle(context),
                  ),
                  subtitle: Text(
                    getTranslated("lock_screen_sound", context),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        goPage(context, const EasyAlerts());
                      });
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 14.sp,
                    ),
                  ),
                ),
              ),

              //

              Visibility(
                visible: isVisible,
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 0.0, right: 0.0),
                  title: Text(
                    getTranslated("messaging", context),
                    style: TextStyles.smallBoldTextStyle(context),
                  ),
                  subtitle: Text(getTranslated("lock_screen_sound", context)),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        goPage(context, const Messaging());
                      });
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 16.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
