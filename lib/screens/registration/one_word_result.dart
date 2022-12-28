// ignore_for_file: avoid_print, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/primary_button.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/global/widgets/text_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/ques_res_provider.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:provider/provider.dart';
import '../../global/constants/color_resources.dart';
import 'deepeer/life_wheel.dart';

class OneWordResult extends StatefulWidget {
  static const String id = "/weHaveEstablished";
  const OneWordResult({Key? key}) : super(key: key);

  @override
  State<OneWordResult> createState() => _OneWordResultState();
}

class _OneWordResultState extends State<OneWordResult> {
  bool absoreTap = false;
  bool showButton = true;
  bool _scaleSeleted = false;
  bool _submitButton = false;
  bool _isSubmit = false;
  int selectedIndex = 0;

    @override
  void initState(){
     super.initState();
     Provider.of<StorageProvider>(context, listen: false).audioSpeak("Did you know. “Hopeful people” are found to experience greater success, life meaning, health & wellbeing, academic success, along with fewer symptoms of depression and anxiety.");
  }

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(),
      ),
      body: Consumer<QuesResProvider>(
              builder: (context, _quesResProvider, child) {
            return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15.w),
            child: Column(
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
                         // getTranslated('now_we_established', context),
                         "Did you know... “Hopeful people” are found to experience greater success, life meaning, health & wellbeing, academic success, along with fewer symptoms of depression and anxiety.",
                          //style: TextStyles.labelTextStyle(context),
                          style: TextStyle(
                            color: ColorResources.getButtonCalicoColor(context),
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Poppins',
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 20.h),
                // Text(
                //   getTranslated('hopeful_people', context),
                //   style: TextStyles.smallBoldTextStyle(context),
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(height: 10.w),
                Text(
                  getTranslated('cheavens_feldam', context),
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 12.sp, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 10.h),
                Visibility(
                  visible: showButton,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextBtn(
                      title: getTranslated('continue_small', context),
                      onPressed: () {
                        setState(() {
                           Provider.of<StorageProvider>(context, listen: false).audioSpeak("Now let's rate whether you feel you can achieve your ideal life.");
                          showButton = false;
                          _scaleSeleted = true;
                          print("button ready to work");
                        });
                      },
                    ),
                  ),
                ),
      
                //
                SizedBox(height: 10.h),
                Visibility(
                  visible: _scaleSeleted,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 4,
                            child: Text(
                              getTranslated('rate_feel_achieve', context),
                              style: TextStyles.regularBoldTextStyle(context),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          // Image(
                          //     image: const AssetImage(
                          //       Images.selectedArea2,
                          //     ),
                          //     width: 120.w),

                          Flexible(
                            child: Image.asset(
                                   Images.userPlaceholder,
                                    width: 60.w,
                                  ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.w),
      
                      //
                      AbsorbPointer(
                        absorbing: absoreTap,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: 
                          
                          // SizedBox(
                          //   height: 20.h,
                          //   width: MediaQuery.of(context).size.width,
                          //   child: ListView.builder(
                          //     itemExtent: 33.w,
                          //     shrinkWrap: true,
                          //     scrollDirection: Axis.horizontal,
                          //     physics: const NeverScrollableScrollPhysics(),
                          //     itemCount: 10,
                          //     itemBuilder: (BuildContext context, int index) {
                          //       return InkWell(
                          //         onTap: () {
                          //           setState(() {
                          //             setColorsinIndex(index, context);
                          //             selectedIndex = index;
                          //             absoreTap = true;
                          //             print(selectedIndex);
                          //             _submitButton = true;
                          //           });
                          //         },
                          //         child: Card(
                          //           child: Container(
                          //             color: colors[index],
                          //             height: 20,
                          //             width: 30,
                          //           ),
                          //         ),
                          //       );
                          //     },
                          //   ),
                          // ),


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
                                 HapticFeedback.vibrate();
                                setState(() {
                                  setColorsinIndex(index, context);
                                      selectedIndex = index+1;
                                      absoreTap = true;
                                      print(selectedIndex);
                                      _submitButton = true;
 
                                });
                              },
                              child: Container(
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
                      Row(
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:const [
                    Expanded(child: Text("1",)),
                    Spacer(),
                    Expanded(child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text("10", textAlign: TextAlign.end,),
                    )),

                   ],),
                      Row(
                        children: const [
                          Expanded(child: Text("Not at all")),
                          Expanded(child: Text("Maybe")),
                          Expanded(child: Text("I think so")),
                          Expanded(
                              child: Text(
                            "Absolutely",
                            textAlign: TextAlign.right,
                          ))
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Visibility(
                          visible: _isSubmit,
                          child: Text(
                            //_quesResProvider.achieveIdealLife.msg ?? _achiveGoalFeedbackText,
                            _achiveGoalFeedbackText,
                            style: TextStyles.labelTextStyle(context),
                            textAlign: TextAlign.start,
                          )),
                      SizedBox(height: 75.sp),
                    ],
                  ),
                ),
                //
              ],
            ),
          ),
        );
        }
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.fromLTRB(15.sp, 0, 15.sp, 15.sp),
        child: _submitButton
            ? Visibility(
                visible: _submitButton,
                child: SubmitButton(
                  onPressed: () {
                    setState(() {
                      absoreTap = true;
                      _submitButton = false;
                      _isSubmit = true;
                      _showAchiveGoalFeedback(selectedIndex);
                      Provider.of<StorageProvider>(context, listen: false).updateAchiveGoalValue(selectedIndex);
                      final quesResProvider = Provider.of<QuesResProvider>(context, listen: false);                  
                      quesResProvider.achiveIdealLife(scalevale: selectedIndex, context: context);
                    });
                  },
                  title: 'SUBMIT',
                  buttonStyle: ButtonStyles.getCommonStyle(context),
                ),
              )
            : Visibility(
                visible: _isSubmit,
                child: PrimaryButton(
                  onPressed: () {
                    Provider.of<StorageProvider>(context, listen: false)
                  .registrationSafetyNet(route: LifeWheel.id);
                    goPageWithName(context, LifeWheel.id);
                  },
                  title: getTranslated('continue', context),
                ),
              ),
      ),
    );
  }

  String _achiveGoalFeedbackText = "";

  _showAchiveGoalFeedback(index) {
    if (index >= 0 && index < 3) {
      setState(() {
        _achiveGoalFeedbackText =
            getTranslated('believe_in_your_capabilities', context);
            Provider.of<StorageProvider>(context, listen: false).audioSpeak(_achiveGoalFeedbackText);
        print("feedback 1-3");
      });
    }
    if (index >= 3 && index < 5) {
      setState(() {
        _achiveGoalFeedbackText = getTranslated('short_of_believe', context);
        Provider.of<StorageProvider>(context, listen: false).audioSpeak(_achiveGoalFeedbackText);
        print("feedback 4-6");
      });
    }
    if (index >= 6 && index < 8) {
      setState(() {
        _achiveGoalFeedbackText =
            getTranslated('self-belief-a_key_ingredient', context);
            Provider.of<StorageProvider>(context, listen: false).audioSpeak(_achiveGoalFeedbackText);
        print("feedback 7-8");
      });
    }
    if (index >= 9 && index < 10) {
      setState(() {
        _achiveGoalFeedbackText = getTranslated('your_score_shows', context);
        Provider.of<StorageProvider>(context, listen: false).audioSpeak(_achiveGoalFeedbackText);
        print("feedback 9-10");
      });
    }
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

  setColorsinIndex(index, BuildContext context) {
    if (index == 0) {
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
    } else if (index == 1) {
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
    } else if (index == 2) {
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
    } else if (index == 3) {
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
    } else if (index == 4) {
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
    } else if (index == 5) {
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
    } else if (index == 6) {
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
    } else if (index == 7) {
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
    } else if (index == 8) {
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
    } else if (index == 9) {
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
  }
}
