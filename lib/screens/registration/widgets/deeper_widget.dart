import 'package:flutter/material.dart';
import 'package:olga/global/constants/color_resources.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:provider/provider.dart';

class DeeperWidget extends StatefulWidget {
  const DeeperWidget({Key? key}) : super(key: key);

  @override
  State<DeeperWidget> createState() => _DeeperWidgetState();
}

class _DeeperWidgetState extends State<DeeperWidget> {
    @override
  void initState() {
    super.initState();
    //initialText = getTranslated("friends", context);
    Provider.of<StorageProvider>(context, listen: false).audioSpeak("Let’s dive a bit deeper and build your life wheel by establishing how you would currently rate where you are in each of  these areas of your life... 1 being awful and 10 being fantastic....Friends");

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(height: 10.h),
              Image.asset(
                Images.userPlaceholder,
                width: 60.w,
              ),
              SizedBox(width: 10.w),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: Text(
                    getTranslated('lets_drive_deeper', context),
                     style: TextStyles.smallBoldTextStyle(context),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              getTranslated('drive_rate', context),
              style: 
              TextStyle(
      color: ColorResources.getContinueTxtColor(context), 
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold,
      fontSize: 12.sp,
    )
              //TextStyles.gestureContinueStyle(context),
            ),
          ),
          //SizedBox(height: 15.h),
        ],
      ),
    );
  }
}
