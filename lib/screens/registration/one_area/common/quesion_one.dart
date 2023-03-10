// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:provider/provider.dart';


class RomanceIntimacyGoal extends StatefulWidget {
  static const String id = "/romanceIntimacyGoal";

  const RomanceIntimacyGoal({Key? key}) : super(key: key);

  @override
  State<RomanceIntimacyGoal> createState() => _RomanceIntimacyGoalState();
}

class _RomanceIntimacyGoalState extends State<RomanceIntimacyGoal> {
  bool showButton = false;
  bool isButtonActive = true;
  bool absoreTap = false;
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: newAppBar(context),
      body: Consumer<StorageProvider>(
        builder: (context, _storedVale, child) {
          return Container(
          padding: EdgeInsets.all(10.h),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      getTranslated("dynamic_goal_text_why_dont_we", context) + "${_storedVale.oneSelectedArea}}" + "before_we_do_that" + "${_storedVale.oneSelectedArea}}" ,
                      style: TextStyles.regularBoldTextStyle(context),
                    ),
                  ),
                  Image.asset(
                    Images.selectedArea2,
                    width: 120.sp,
                  ),
                ],
              ),
              SizedBox(height: 10.sp),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      getTranslated("on_scale_1_10", context),
                      style: TextStyles.smallBoldTextStyle(context),
                    ),
                    SizedBox(height: 20.sp),
                    Text(_storedVale.oneSelectedArea,
                      style: TextStyles.smallBoldTextStyle(context),
                    ),
                    SizedBox(height: 10.sp),
                    Text(
                      getTranslated('happy_with_communicate', context),
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
      
                    SizedBox(height: 20.sp),
      
              //
              AbsorbPointer(
                absorbing: false,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SizedBox(
                    height: 20.h,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemExtent: 33.w,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              setColorsinIndex(index, context);
                              //storageValue.changeCareerScaleValue(index);
                              selectedIndex = index;
                              showButton = true;
                              absoreTap = true;
                            });
                          },
                          child: Card(
                            child: Container(
                              color: colors[index],
                              height: 20,
                              width: 30,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
      
              
                  ],
                ),
              ),
            ],
          ),
        );
        }
      ),
      bottomSheet: Visibility(
        visible: showButton,
        child: Padding(
          padding: EdgeInsets.only(left: 15.sp, right: 15.sp, bottom: 15.sp),
          child: SubmitButton(
            title: getTranslated('submit', context),
            onPressed: () {
              setState(() {
                isButtonActive = false;
                //HappyLifeSurvey _happyLifeSurvey = Provider.of(context, listen: false);
                //_happyLifeSurvey.happyWithWeight(response: selectedIndex, context: context);
                print('selected index ===>>> $selectedIndex');
                print('submiteed');
                //goPageWithName(context, HappyWithFreedom.id);
              });
            },
            buttonStyle: ButtonStyles.getCommonStyle(context),
          ),
        ),
      ),
    );
  }

  List<Color> colors = [
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
    Colors.grey.shade400,
  ];

  setColorsinIndex(index, BuildContext context) {
    if (index == 0) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Colors.grey.shade400;
        colors[2] = Colors.grey.shade400;
        colors[3] = Colors.grey.shade400;
        colors[4] = Colors.grey.shade400;
        colors[5] = Colors.grey.shade400;
        colors[6] = Colors.grey.shade400;
        colors[7] = Colors.grey.shade400;
        colors[8] = Colors.grey.shade400;
        colors[9] = Colors.grey.shade400;
      });
    } else if (index == 1) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Colors.grey.shade400;
        colors[3] = Colors.grey.shade400;
        colors[4] = Colors.grey.shade400;
        colors[5] = Colors.grey.shade400;
        colors[6] = Colors.grey.shade400;
        colors[7] = Colors.grey.shade400;
        colors[8] = Colors.grey.shade400;
        colors[9] = Colors.grey.shade400;
      });
    } else if (index == 2) {
      setState(() {
        colors[index] = Color(0xFFF2E3CF);
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Color(0xFFF2E3CF);
        colors[3] = Colors.grey.shade400;
        colors[4] = Colors.grey.shade400;
        colors[5] = Colors.grey.shade400;
        colors[6] = Colors.grey.shade400;
        colors[7] = Colors.grey.shade400;
        colors[8] = Colors.grey.shade400;
        colors[9] = Colors.grey.shade400;
      });
    } else if (index == 3) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Color(0xFFF2E3CF);
        colors[3] = Color(0xFFEFDCC4);
        colors[4] = Colors.grey.shade400;
        colors[5] = Colors.grey.shade400;
        colors[6] = Colors.grey.shade400;
        colors[7] = Colors.grey.shade400;
        colors[8] = Colors.grey.shade400;
        colors[9] = Colors.grey.shade400;
      });
    } else if (index == 4) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Color(0xFFF2E3CF);
        colors[3] = Color(0xFFEFDCC4);
        colors[4] = Color(0xFFEFDCC4);
        colors[5] = Colors.grey.shade400;
        colors[6] = Colors.grey.shade400;
        colors[7] = Colors.grey.shade400;
        colors[8] = Colors.grey.shade400;
        colors[9] = Colors.grey.shade400;
      });
    } else if (index == 5) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Color(0xFFF2E3CF);
        colors[3] = Color(0xFFEFDCC4);
        colors[4] = Color(0xFFEFDCC4);
        colors[5] = Color(0xFFEFDCC4);
        colors[6] = Colors.grey.shade400;
        colors[7] = Colors.grey.shade400;
        colors[8] = Colors.grey.shade400;
        colors[9] = Colors.grey.shade400;
      });
    } else if (index == 6) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Color(0xFFF2E3CF);
        colors[3] = Color(0xFFEFDCC4);
        colors[4] = Color(0xFFEFDCC4);
        colors[5] = Color(0xFFEFDCC4);
        colors[6] = Color(0xFFF0DAC0);
        colors[7] = Colors.grey.shade400;
        colors[8] = Colors.grey.shade400;
        colors[9] = Colors.grey.shade400;
      });
    } else if (index == 7) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Color(0xFFF2E3CF);
        colors[3] = Color(0xFFEFDCC4);
        colors[4] = Color(0xFFEFDCC4);
        colors[5] = Color(0xFFEFDCC4);
        colors[6] = Color(0xFFF0DAC0);
        colors[7] = Color(0xFFEED4B4);
        colors[8] = Colors.grey.shade400;
        colors[9] = Colors.grey.shade400;
      });
    } else if (index == 8) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Color(0xFFF2E3CF);
        colors[3] = Color(0xFFEFDCC4);
        colors[4] = Color(0xFFEFDCC4);
        colors[5] = Color(0xFFEFDCC4);
        colors[6] = Color(0xFFF0DAC0);
        colors[7] = Color(0xFFEED4B4);
        colors[8] = Color(0xFFF1D2AC);
        colors[9] = Colors.grey.shade400;
      });
    } else if (index == 9) {
      setState(() {
        colors[0] = Color(0xFFF8F1E7);
        colors[1] = Color(0xFFF8F1E7);
        colors[2] = Color(0xFFF2E3CF);
        colors[3] = Color(0xFFEFDCC4);
        colors[4] = Color(0xFFEFDCC4);
        colors[5] = Color(0xFFEFDCC4);
        colors[6] = Color(0xFFF0DAC0);
        colors[7] = Color(0xFFEED4B4);
        colors[8] = Color(0xFFF1D2AC);
        colors[9] = Color(0xFFF1CC9D);
      });
    }
  }
}
