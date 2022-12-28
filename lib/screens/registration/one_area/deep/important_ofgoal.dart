// ignore_for_file: avoid_print, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/constants/responsive_values.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/global/widgets/text_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/happy_life_provider.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/registration/one_area/deep/skills_qualities.dart';
import 'package:provider/provider.dart';

class ImportantOfGoal extends StatefulWidget {
  static const String id = "/importantOfGoal";
  const ImportantOfGoal({Key? key}) : super(key: key);

  @override
  State<ImportantOfGoal> createState() => _ImportantOfGoalState();
}

class _ImportantOfGoalState extends State<ImportantOfGoal> {
  bool absoreTap = false;
  bool absoreTap2 = false;
  bool absoreTap3 = false;

  bool isGoalValueGiven = false;
  bool isWorthValueGiven = false;
  bool isBelieveValueGiven = false;
  bool continueBtn1 = false;
  bool continueBtn2 = false;
  bool continueBtn3 = false;
  bool submitNow = false;
  int selectedIndex = 0;
  int selectedIndex2 = 0;
  int selectedIndex3 = 0;

    @override
     void initState() {
    super.initState();
     Provider.of<StorageProvider>(context, listen: false)
        .registrationSafetyNet(route: ImportantOfGoal.id);
     StorageProvider storageValue =Provider.of<StorageProvider>(context, listen: false);
    Provider.of<StorageProvider>(context, listen: false).audioSpeak("Achieving goals requires change - big or small. The value of this goal and the effort you place on achieving it could determine your level of success. Lets ensure you are on the right track.  How important is your goal?");
  }



  @override
  Widget build(BuildContext context) {
    final storageValue = Provider.of<StorageProvider>(context, listen: false);
    //
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                       // getTranslated('motivation_describe', context),
                       "Achieving goals requires change - big or small. The value of this goal and the effort you place on achieving it could determine your level of success. Lets ensure you are on the right track.",
                        style: TextStyles.regularBoldTextStyle(context),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.sp),

              //
              // RichText(
              //   text: TextSpan(
              //     text: "Henry Ford once said, ",
              //     style: TextStyles.creamBoldStyle(context),
              //     children: [
              //       TextSpan(
              //         text:
              //             "“Whether you believe you can, or believe you can't, you're right”",
              //         style: TextStyles.creamNormalStyle(context),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: 10.sp),

              //
              Text(
                //getTranslated('how_important_goal', context),
                "How valuable is this goal to your life?",
                  style: TextStyles.smallBoldTextStyle(context)),
              SizedBox(height: 10.sp),

              //
              AbsorbPointer(
                absorbing: absoreTap,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child:
                  
                   SizedBox(
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
                              isGoalValueGiven = true;
                              //absoreTap = true;
                               selectedIndex = (index + 1);
                              storageValue.changeImportantYourGoal(index);
                              print("important of goal index ===>>> $index");
                            });
                          },
                          child:
                          //  Container(
                          //   color: colors[index],
                          //   height: 20.h,
                          //   width: 30.w,
                          // ),
                           Container(
                                height: 20,
                                width: 30,
                               decoration: BoxDecoration(
                                  color: selectedIndex == (index + 1) ? colors[index] : Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                  color: colorsForBorder[index],  // Border color
                                  width: 1,  // Border width
                                ),
                                ),
                                 child: Center(child: Text((index + 1).toString(),  style: TextStyle(
                                 color: selectedIndex == (index + 1) ? Colors.white : colorsForBorder[index],  // Change text color based on selection
                                ),)),
                              ),
                          
                        );
                      },
                    ),
                  ),
                ),
              ),
              //

              //

              // Row(
              //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: const [
              //     Expanded(
              //         child: Text(
              //       "1",
              //     )),
              //     Spacer(),
              //     Expanded(
              //         child: Padding(
              //       padding: EdgeInsets.only(right: 10.0),
              //       child: Text(
              //         "10",
              //         textAlign: TextAlign.end,
              //       ),
              //     )),
              //   ],
              // ),

              SizedBox(height: 5.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Expanded(child: Text("Not at all")),
                  Expanded(child: Text("Somewhat")),
                  Expanded(
                      child: Text(
                    "Very",
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                    child: Text(
                      "Extremly",
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),

              //
              Visibility(
                visible: isGoalValueGiven,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextBtn(
                    title: getTranslated('continue_small', context),
                    onPressed: () {
                      setState(() {
                        isWorthValueGiven = true;
                        isGoalValueGiven = false;
                        print("button ready to work");
                      });
                      // Provider.of<StorageProvider>(context, listen: false).audioSpeak("Now ask yourself, is it worth your effort?");

                    },
                  ),
                ),
              ),
              SizedBox(height: 20.sp),

              //
              Visibility(
                visible: isWorthValueGiven,
                child: AbsorbPointer(
                  absorbing: absoreTap2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(getTranslated('now_ask_worth_effort', context),
                          style: TextStyles.smallBoldTextStyle(context)),
                      SizedBox(height: 8.h),
                      //
                      SizedBox(
                        height: 20.h,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemExtent: 33.w,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int secondIndex) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  secondColorsinIndex(secondIndex, context);
                                  storageValue
                                      .changeWorthYourEffort(secondIndex);
                                  print(
                                      "worth effort selected index ===>>> $secondIndex");
                                  continueBtn2 = true;
                                  selectedIndex2 = (secondIndex + 1);
                                  //absoreTap2 = true;
                                });
                              },
                              child: Container(
                                height: 20.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  color: secondColorsScal[secondIndex],
                                   shape: BoxShape.circle,
                                    border: Border.all(
                                  color: colorsForBorder2[secondIndex],  // Border color
                                  width: 1,  // Border width
                                ),
                                ),
                                child: Center(child: Text((secondIndex+1).toString(),
                                 style: TextStyle(
                                 color: selectedIndex2 == (secondIndex + 1) ? Colors.white : colorsForBorder2[secondIndex],  // Change text color based on selection
                                ),
                                )),
                              ),
                            );
                          },
                        ),
                      ),
                      //

                      //
                      // Row(
                      //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: const [
                      //     Expanded(
                      //         child: Text(
                      //       "1",
                      //     )),
                      //     Spacer(),
                      //     Expanded(
                      //         child: Padding(
                      //       padding: EdgeInsets.only(right: 10.0),
                      //       child: Text(
                      //         "10",
                      //         textAlign: TextAlign.end,
                      //       ),
                      //     )),
                      //   ],
                      // ),

                      SizedBox(height: 5.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Expanded(child: Text("Not at all")),
                  Expanded(child: Text("Somewhat")),
                  Expanded(
                      child: Text(
                    "Very",
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                    child: Text(
                      "Extremly",
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),

                      SizedBox(height: 10.sp),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              //
              Visibility(
                visible: continueBtn2,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextBtn(
                    title: getTranslated('continue_small', context),
                    onPressed: () {
                      setState(() {
                        isBelieveValueGiven = true;
                        continueBtn2 = false;
                        print("going to next page...");
                        Provider.of<StorageProvider>(context, listen: false).audioSpeak("Do you BELIEVE you can do it?");

                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 10.sp),

              //
              Visibility(
                visible: isBelieveValueGiven,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getTranslated('do_you_believe', context),
                      style: TextStyles.smallBoldTextStyle(context),
                    ),
                    SizedBox(height: 8.h),

                    AbsorbPointer(
                      absorbing: absoreTap3,
                      child: SizedBox(
                        height: 20.h,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemExtent: 33.w,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int thirdIndex) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  thirdIndexColor(thirdIndex, context);
                                  storageValue.changeBelieveYouCan(thirdIndex);
                                  print(
                                      "believe selected thirdIndex ===>>> $thirdIndex");
                                  continueBtn3 = true;
                                  selectedIndex3 = (thirdIndex + 1);
                                  //absoreTap3 = true;
                                });
                              },
                              child: Container(
                                //color: thirtIndexColor[thirdIndex],
                                height: 20.h,
                                width: 30.w,
                                 decoration: BoxDecoration(
                                  color: thirtIndexColor[thirdIndex],
                                   shape: BoxShape.circle,
                                    border: Border.all(
                                  color: colorsForBorder3[thirdIndex],  // Border color
                                  width: 1,  // Border width
                                ),
                                ),
                                 child: Center(child: Text((thirdIndex+1).toString(),
                                  style: TextStyle(
                                 color: selectedIndex3 == (thirdIndex + 1) ? Colors.white : colorsForBorder3[thirdIndex],  // Change text color based on selection
                                ),
                                 ))
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    //

                    // Row(
                    //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: const [
                    //     Expanded(
                    //         child: Text(
                    //       "1",
                    //     )),
                    //     Spacer(),
                    //     Expanded(
                    //         child: Padding(
                    //       padding: EdgeInsets.only(right: 10.0),
                    //       child: Text(
                    //         "10",
                    //         textAlign: TextAlign.end,
                    //       ),
                    //     )),
                    //   ],
                    // ),

                    SizedBox(height: 5.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Expanded(child: Text("Not at all")),
                  Expanded(child: Text("Somewhat")),
                  Expanded(
                      child: Text(
                    "Very",
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                    child: Text(
                      "Extremly",
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
                  ],
                ),
              ),
              SizedBox(height: 30.sp),

              //
              Visibility(
                visible: continueBtn3,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextBtn(
                    title: getTranslated('continue_small', context),
                    onPressed: () {
                      setState(() {
                        submitNow = true;
                        continueBtn3 = false;
                        print("show button hide now");
                      });
                    },
                  ),
                ),
              ),

              //
              SizedBox(height: 10.sp),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(ResponsiveValues.paddingDefault),
        child: Visibility(
          visible: submitNow,
          child: SubmitButton(
            title: getTranslated('submit', context),
            onPressed: () {
              Provider.of<StorageProvider>(context, listen: false)
                  .registrationSafetyNet(route: SkillQualities.id);
              goPageWithName(context, SkillQualities.id);
              print('registering new user ');
            },
            buttonStyle: ButtonStyles.getCommonStyle(context),
          ),
        ),
      ),
    );
  }

  List<Color> colors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

    List<Color> colorsForBorder = [
    Color(0xffB50000),
    Color(0xffB50000),
    Color(0xffDEB988),
    Color(0xffDEB988),
    Color(0xff67C23A),
    Color(0xff67C23A),
    Color(0xffE6A23C),
    Color(0xffE6A23C),
    Color(0xffF56C6C),
    Color(0xffF56C6C),
  ];

  setColorsinIndex(firstScalindex, BuildContext context) {
    if (firstScalindex == 0) {
      setState(() {
       colors[0] = Color(0xffB50000);
        colors[1] = Colors.white;
        colors[2] = Colors.white;
        colors[3] = Colors.white;
        colors[4] = Colors.white;
        colors[5] = Colors.white;
        colors[6] = Colors.white;
        colors[7] = Colors.white;
        colors[8] = Colors.white;
        colors[9] = Colors.white;
      });
    } else if (firstScalindex == 1) {
      setState(() {
        colors[0] = Colors.white;
        colors[1] = Color(0xffB50000);
        colors[2] = Colors.white;
        colors[3] = Colors.white;
        colors[4] = Colors.white;
        colors[5] = Colors.white;
        colors[6] = Colors.white;
        colors[7] = Colors.white;
        colors[8] = Colors.white;
        colors[9] = Colors.white;
      });
    } else if (firstScalindex == 2) {
      setState(() {
        colors[0] = Colors.white;
        colors[1] = Colors.white;
        colors[2] = Color(0xFFF2E3CF);
        colors[3] = Colors.white;
        colors[4] = Colors.white;
        colors[5] = Colors.white;
        colors[6] = Colors.white;
        colors[7] = Colors.white;
        colors[8] = Colors.white;
        colors[9] = Colors.white;
      });
    } else if (firstScalindex == 3) {
      setState(() {
       colors[0] = Colors.white;
        colors[1] = Colors.white;
        colors[2] = Colors.white;
        colors[3] = Color(0xFFEFDCC4);
        colors[4] = Colors.white;
        colors[5] = Colors.white;
        colors[6] = Colors.white;
        colors[7] = Colors.white;
        colors[8] = Colors.white;
        colors[9] = Colors.white;
      });
    } else if (firstScalindex == 4) {
      setState(() {
       colors[0] = Colors.white;
        colors[1] = Colors.white;
        colors[2] = Colors.white;
        colors[3] = Colors.white;
        colors[4] = Color(0xff67C23A);
        colors[5] = Colors.white;
        colors[6] = Colors.white;
        colors[7] = Colors.white;
        colors[8] = Colors.white;
        colors[9] = Colors.white;
      });
    } else if (firstScalindex == 5) {
      setState(() {
         colors[0] = Colors.white;
        colors[1] = Colors.white;
        colors[2] = Colors.white;
        colors[3] = Colors.white;
        colors[4] = Colors.white;
        colors[5] = Color(0xff67C23A);
        colors[6] = Colors.white;
        colors[7] = Colors.white;
        colors[8] = Colors.white;
        colors[9] = Colors.white;
      });
    } else if (firstScalindex == 6) {
      setState(() {
        colors[0] = Colors.white;
        colors[1] = Colors.white;
        colors[2] = Colors.white;
        colors[3] = Colors.white;
        colors[4] = Colors.white;
        colors[5] = Colors.white;
        colors[6] = Color(0xffE6A23C);
        colors[7] = Colors.white;
        colors[8] = Colors.white;
        colors[9] = Colors.white;
      });
    } else if (firstScalindex == 7) {
      setState(() {
         colors[0] = Colors.white;
        colors[1] = Colors.white;
        colors[2] = Colors.white;
        colors[3] = Colors.white;
        colors[4] = Colors.white;
        colors[5] = Colors.white;
        colors[6] = Colors.white;
        colors[7] = Color(0xffE6A23C);
        colors[8] = Colors.white;
        colors[9] = Colors.white;
      });
    } else if (firstScalindex == 8) {
      setState(() {
        colors[0] = Colors.white;
        colors[1] = Colors.white;
        colors[2] = Colors.white;
        colors[3] = Colors.white;
        colors[4] = Colors.white;
        colors[5] = Colors.white;
        colors[6] = Colors.white;
        colors[7] = Colors.white;
        colors[8] = Color(0xffF56C6C);
        colors[9] = Colors.white;
      });
    } else if (firstScalindex == 9) {
      setState(() {
        colors[0] = Colors.white;
        colors[1] = Colors.white;
        colors[2] = Colors.white;
        colors[3] = Colors.white;
        colors[4] = Colors.white;
        colors[5] = Colors.white;
        colors[6] = Colors.white;
        colors[7] = Colors.white;
        colors[8] = Colors.white;
        colors[9] = Color(0xffF56C6C);
      });
    }

    //
  }

  //
  List<Color> secondColorsScal = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
   List<Color> colorsForBorder2 = [
    Color(0xffB50000),
    Color(0xffB50000),
    Color(0xffDEB988),
    Color(0xffDEB988),
    Color(0xff67C23A),
    Color(0xff67C23A),
    Color(0xffE6A23C),
    Color(0xffE6A23C),
    Color(0xffF56C6C),
    Color(0xffF56C6C),
  ];

  secondColorsinIndex(index, BuildContext context) {
    if (index == 0) {
      setState(() {
        secondColorsScal[0] = Color(0xffB50000);
        secondColorsScal[1] = Colors.white;
        secondColorsScal[2] = Colors.white;
        secondColorsScal[3] = Colors.white;
        secondColorsScal[4] = Colors.white;
        secondColorsScal[5] = Colors.white;
        secondColorsScal[6] = Colors.white;
        secondColorsScal[7] = Colors.white;
        secondColorsScal[8] = Colors.white;
        secondColorsScal[9] = Colors.white;
      });
    } else if (index == 1) {
      setState(() {
        secondColorsScal[0]=Colors.white;
        secondColorsScal[1] = Color(0xFFB50000);
        secondColorsScal[2] = Colors.white;
        secondColorsScal[3] = Colors.white;
        secondColorsScal[4] = Colors.white;
        secondColorsScal[5] = Colors.white;
        secondColorsScal[6] = Colors.white;
        secondColorsScal[7] = Colors.white;
        secondColorsScal[8] = Colors.white;
        secondColorsScal[9] = Colors.white;
      });
    } else if (index == 2) {
      setState(() {
        secondColorsScal[0]=Colors.white;
        secondColorsScal[1]=Colors.white;
        secondColorsScal[2] = Color(0xFFF2E3CF);
        secondColorsScal[3] = Colors.white;
        secondColorsScal[4] = Colors.white;
        secondColorsScal[5] = Colors.white;
        secondColorsScal[6] = Colors.white;
        secondColorsScal[7] = Colors.white;
        secondColorsScal[8] = Colors.white;
        secondColorsScal[9] = Colors.white;
      });
    } else if (index == 3) {
      setState(() {
        secondColorsScal[0] = Colors.white;
        secondColorsScal[1] = Colors.white;
        secondColorsScal[2] = Colors.white;
        secondColorsScal[3] = Color(0xFFEFDCC4);
        secondColorsScal[4] = Colors.white;
        secondColorsScal[5] = Colors.white;
        secondColorsScal[6] = Colors.white;
        secondColorsScal[7] = Colors.white;
        secondColorsScal[8] = Colors.white;
        secondColorsScal[9] = Colors.white;
      });
    } else if (index == 4) {
      setState(() {
        secondColorsScal[0] = Colors.white;
        secondColorsScal[1] = Colors.white;
        secondColorsScal[2] = Colors.white;
        secondColorsScal[3] = Colors.white;
        secondColorsScal[4] = Color(0xff67C23A);
        secondColorsScal[5] = Colors.white;
        secondColorsScal[6] = Colors.white;
        secondColorsScal[7] = Colors.white;
        secondColorsScal[8] = Colors.white;
        secondColorsScal[9] = Colors.white;
      });
    } else if (index == 5) {
      setState(() {
        secondColorsScal[0] = Colors.white;
        secondColorsScal[1] = Colors.white;
        secondColorsScal[2] = Colors.white;
        secondColorsScal[3] = Colors.white;
        secondColorsScal[4] = Colors.white;
        secondColorsScal[5] = Color(0xff67C23A);
        secondColorsScal[6] = Colors.white;
        secondColorsScal[7] = Colors.white;
        secondColorsScal[8] = Colors.white;
        secondColorsScal[9] = Colors.white;
      });
    } else if (index == 6) {
      setState(() {
        secondColorsScal[0] = Colors.white;
        secondColorsScal[1] = Colors.white;
        secondColorsScal[2] = Colors.white;
        secondColorsScal[3] = Colors.white;
        secondColorsScal[4] = Colors.white;
        secondColorsScal[5] = Colors.white;
        secondColorsScal[6] = Color(0xffE6A23C);
        secondColorsScal[7] = Colors.white;
        secondColorsScal[8] = Colors.white;
        secondColorsScal[9] = Colors.white;
      });
    } else if (index == 7) {
      setState(() {
        secondColorsScal[0] = Colors.white;
        secondColorsScal[1] = Colors.white;
        secondColorsScal[2] = Colors.white;
        secondColorsScal[3] = Colors.white;
        secondColorsScal[4] = Colors.white;
        secondColorsScal[5] = Colors.white;
        secondColorsScal[6] = Colors.white;
        secondColorsScal[7] = Color(0xffE6A23C);
        secondColorsScal[8] = Colors.white;
        secondColorsScal[9] = Colors.white;
      });
    } else if (index == 8) {
      setState(() {
        secondColorsScal[0] = Colors.white;
        secondColorsScal[1] = Colors.white;
        secondColorsScal[2] = Colors.white;
        secondColorsScal[3] = Colors.white;
        secondColorsScal[4] = Colors.white;
        secondColorsScal[5] = Colors.white;
        secondColorsScal[6] = Colors.white;
        secondColorsScal[7] = Colors.white;
        secondColorsScal[8] = Color(0xffF56C6C);
        secondColorsScal[9] = Colors.white;
      });
    } else if (index == 9) {
      setState(() {
        secondColorsScal[0] = Colors.white;
        secondColorsScal[1] = Colors.white;
        secondColorsScal[2] = Colors.white;
        secondColorsScal[3] = Colors.white;
        secondColorsScal[4] = Colors.white;
        secondColorsScal[5] = Colors.white;
        secondColorsScal[6] = Colors.white;
        secondColorsScal[7] = Colors.white;
        secondColorsScal[8] = Colors.white;
        secondColorsScal[9] = Color(0xffF56C6C);
      });
    }
  }

  

  //
  List<Color> thirtIndexColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

   List<Color> colorsForBorder3 = [
    Color(0xffB50000),
    Color(0xffB50000),
    Color(0xffDEB988),
    Color(0xffDEB988),
    Color(0xff67C23A),
    Color(0xff67C23A),
    Color(0xffE6A23C),
    Color(0xffE6A23C),
    Color(0xffF56C6C),
    Color(0xffF56C6C),
  ];

  thirdIndexColor(index, BuildContext context) {
    if (index == 0) {
      setState(() {
        thirtIndexColor[0] = Color(0xffB50000);
        thirtIndexColor[1] = Colors.white;
        thirtIndexColor[2] = Colors.white;
        thirtIndexColor[3] = Colors.white;
        thirtIndexColor[4] = Colors.white;
        thirtIndexColor[5] = Colors.white;
        thirtIndexColor[6] = Colors.white;
        thirtIndexColor[7] = Colors.white;
        thirtIndexColor[8] = Colors.white;
        thirtIndexColor[9] = Colors.white;
      });
    } else if (index == 1) {
      setState(() {
        thirtIndexColor[0] = Colors.white;
        thirtIndexColor[1] = Color(0xFFB50000);
        thirtIndexColor[2] = Colors.white;
        thirtIndexColor[3] = Colors.white;
        thirtIndexColor[4] = Colors.white;
        thirtIndexColor[5] = Colors.white;
        thirtIndexColor[6] = Colors.white;
        thirtIndexColor[7] = Colors.white;
        thirtIndexColor[8] = Colors.white;
        thirtIndexColor[9] = Colors.white;
      });
    } else if (index == 2) {
      setState(() {
        thirtIndexColor[0] = Colors.white;
        thirtIndexColor[1] = Colors.white;
        thirtIndexColor[2] = Color(0xFFF2E3CF);
        thirtIndexColor[3] = Colors.white;
        thirtIndexColor[4] = Colors.white;
        thirtIndexColor[5] = Colors.white;
        thirtIndexColor[6] = Colors.white;
        thirtIndexColor[7] = Colors.white;
        thirtIndexColor[8] = Colors.white;
        thirtIndexColor[9] = Colors.white;
      });
    } else if (index == 3) {
      setState(() {
        thirtIndexColor[0] = Colors.white;
        thirtIndexColor[1] = Colors.white;
        thirtIndexColor[2] = Colors.white;
        thirtIndexColor[3] = Color(0xFFEFDCC4);
        thirtIndexColor[4] = Colors.white;
        thirtIndexColor[5] = Colors.white;
        thirtIndexColor[6] = Colors.white;
        thirtIndexColor[7] = Colors.white;
        thirtIndexColor[8] = Colors.white;
        thirtIndexColor[9] = Colors.white;
      });
    } else if (index == 4) {
      setState(() {
        thirtIndexColor[0] = Colors.white;
        thirtIndexColor[1] = Colors.white;
        thirtIndexColor[2] = Colors.white;
        thirtIndexColor[3] = Colors.white;
        thirtIndexColor[4] = Color(0xff67C23A);
        thirtIndexColor[5] = Colors.white;
        thirtIndexColor[6] = Colors.white;
        thirtIndexColor[7] = Colors.white;
        thirtIndexColor[8] = Colors.white;
        thirtIndexColor[9] = Colors.white;
      });
    } else if (index == 5) {
      setState(() {
        thirtIndexColor[0] = Colors.white;
        thirtIndexColor[1] = Colors.white;
        thirtIndexColor[2] = Colors.white;
        thirtIndexColor[3] = Colors.white;
        thirtIndexColor[4] = Colors.white;
        thirtIndexColor[5] = Color(0xff67C23A);
        thirtIndexColor[6] = Colors.white;
        thirtIndexColor[7] = Colors.white;
        thirtIndexColor[8] = Colors.white;
        thirtIndexColor[9] = Colors.white;
      });
    } else if (index == 6) {
      setState(() {
        thirtIndexColor[0] = Colors.white;
        thirtIndexColor[1] = Colors.white;
        thirtIndexColor[2] = Colors.white;
        thirtIndexColor[3] = Colors.white;
        thirtIndexColor[4] = Colors.white;
        thirtIndexColor[5] = Colors.white;
        thirtIndexColor[6] = Color(0xffE6A23C);
        thirtIndexColor[7] = Colors.white;
        thirtIndexColor[8] = Colors.white;
        thirtIndexColor[9] = Colors.white;
      });
    } else if (index == 7) {
      setState(() {
        thirtIndexColor[0] = Colors.white;
        thirtIndexColor[1] = Colors.white;
        thirtIndexColor[2] = Colors.white;
        thirtIndexColor[3] = Colors.white;
        thirtIndexColor[4] = Colors.white;
        thirtIndexColor[5] = Colors.white;
        thirtIndexColor[6] = Colors.white;
        thirtIndexColor[7] = Color(0xffE6A23C);
        thirtIndexColor[8] = Colors.white;
        thirtIndexColor[9] = Colors.white;
      });
    } else if (index == 8) {
      setState(() {
        thirtIndexColor[0] = Colors.white;
        thirtIndexColor[1] = Colors.white;
        thirtIndexColor[2] = Colors.white;
        thirtIndexColor[3] = Colors.white;
        thirtIndexColor[4] = Colors.white;
        thirtIndexColor[5] = Colors.white;
        thirtIndexColor[6] = Colors.white;
        thirtIndexColor[7] = Colors.white;
        thirtIndexColor[8] = Color(0xffF56C6C);
        thirtIndexColor[9] = Colors.white;
      });
    } else if (index == 9) {
      setState(() {
        thirtIndexColor[0] = Colors.white;
        thirtIndexColor[1] = Colors.white;
        thirtIndexColor[2] = Colors.white;
        thirtIndexColor[3] = Colors.white;
        thirtIndexColor[4] = Colors.white;
        thirtIndexColor[5] = Colors.white;
        thirtIndexColor[6] = Colors.white;
        thirtIndexColor[7] = Colors.white;
        thirtIndexColor[8] = Colors.white;
        thirtIndexColor[9] = Color(0xffF56C6C);
      });
    }
  }
  

}
