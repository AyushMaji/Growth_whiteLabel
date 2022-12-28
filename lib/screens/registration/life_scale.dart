// ignore_for_file: avoid_print, prefer_const_constructors
import 'package:flutter/services.dart';
import 'package:olga/provider/ques_res_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/primary_button.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/registration/life_scale_result.dart';

class LifeScale extends StatefulWidget {
  static const String id = "/lifeOnaScale";
  const LifeScale({Key? key}) : super(key: key);

  @override
  State<LifeScale> createState() => _LifeScaleState();
}

class _LifeScaleState extends State<LifeScale> {
  //
  bool absoreTap = false;
  bool _feedbackGiven = false;
  bool _showText = false;
  bool _feedbackSubmitAndNext = false;
  int selectedIndex = 0;
  bool _submitHide = true;

  void initState(){
        Provider.of<StorageProvider>(context, listen: false).audioSpeak("How do you currently feel about your life on a scale of 1-10?");

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.sp),
        child: const CustomAppBar(),
      ),
      body: Consumer<StorageProvider>(
        builder: (context, _storeValues, child) {
          return Consumer<QuesResProvider>(
        builder: (context, _quesResponseProvider, child) {
          return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 10.sp,right: 5.w),
                child: Column(
                  children: [
                    SizedBox(height: 35.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Text(
                            getTranslated('life_scal', context),
                            style: TextStyles.questionTextStyle(context),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        // Image.asset(
                        //   Images.lifeScale,
                        //   width: 150.w,
                        // ),
                        
                        Flexible(
                          child: Image.asset(
                                 Images.userPlaceholder,
                                  width: 60.w,
                                ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35.w),
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
                        //     itemExtent: 35.5.w,
                        //     shrinkWrap: true,
                        //     scrollDirection: Axis.horizontal,
                        //     physics: const NeverScrollableScrollPhysics(),
                        //     itemCount: 10,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       return InkWell(
                        //         onTap: () {
                        //           HapticFeedback.vibrate();
                        //           setState(() {
                        //             setColorsinIndex(index, context);
                        //             selectedIndex = index;
                        //             _feedbackGiven = true;
                        //             //absoreTap = true;
                        //             _storeValues.addLifeFeelValue(selectedIndex);
                        //           });
                        //         },
                        //         child: Container(
                        //           height: 20,
                        //           width: 30,
                        //           child: Center(child: Text((index + 1).toString())),
                        //            decoration: BoxDecoration(
                        //             color: colors[index],
                        //             shape: BoxShape.circle
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
                                     selectedIndex = (index + 1);
                                    _feedbackGiven = true;
                                     setColorsinIndex(index, context);
                                    //absoreTap = true;
                                    _storeValues.addLifeFeelValue(selectedIndex);
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
          
                   Row(
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:const [
                    // Expanded(child: Padding(
                    //   padding: EdgeInsets.only(left: 10.0),
                    //   child: Text("1",),
                    // )),
                    Spacer(),
                    // Expanded(child: Padding(
                    //   padding: EdgeInsets.only(right: 10.0),
                    //   child: Text("10", textAlign: TextAlign.end,),
                    // )),

                   ],),
                   SizedBox(height: 10.h),
                    Row(
                      children: const [
                        Expanded(child: Padding(
                         padding: EdgeInsets.only(left: 10.0),
                          child: Text("I hate it"),
                        )),
                        Expanded(child: Text("It's ok")),
                        Expanded(child: Text("Good")),
                        Expanded(child: Text("Very Good")),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Text(
                              "I love it!",
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ],
                    ),
          
                    //
                    SizedBox(height: 35.h),
                    Visibility(
                      visible: _showText,
                      child: Column(
                        children: [
                          Text(
                            _quesResponseProvider.lifeScaleRatingModel.msg ?? suggestText,
                            style: TextStyles.smallBoldTextStyle(context),
                          ),
                          SizedBox(height: 100.h),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            );
            }
          );
        }
      ),
      
      
      bottomSheet: Consumer<StorageProvider>(
        builder: (context, _storeValues, child) {
          return Padding(
            padding: const EdgeInsets.all(20),
              child: _submitHide
                ? Visibility(
                    visible: _submitHide,
                    child: SubmitButton(
                      title: getTranslated('submit', context),
                      onPressed:  _feedbackGiven
                          ?() {
                        setState(() {
                          absoreTap = true;
                          _showText = true;
                          _feedbackSubmitAndNext = true;
                          _feedbackGiven = false;
                          _submitHide = false;
                          //
                          _showFeedBackText(selectedIndex);
                          QuesResProvider quesResProvider =Provider.of<QuesResProvider>(context, listen: false);
                          quesResProvider.lifeScaleValue(scale: selectedIndex, context: context);
                           Provider.of<StorageProvider>(context, listen: false).audioSpeak(suggestTextForSpeach);

                        });
                        print('result submitted');
                      }:null,
                      buttonStyle: _feedbackGiven ? ButtonStyles.getCommonStyle(context):null,
                    ),
                  )
                : Visibility(
                    visible: _feedbackSubmitAndNext,
                    child: PrimaryButton(
                      title: getTranslated('continue', context),
                      onPressed: () {
                       absoreTap = true;
                        Provider.of<StorageProvider>(context, listen: false).registrationSafetyNet(route: LifeScaleResult.id);
                        goPageWithName(context, LifeScaleResult.id);
                        print('enter');
                        _storeValues.addLifeFeelValue(selectedIndex);
                      },
                    ),
                  ),
          );
        }
      ),
    );
  }

  String suggestText = "null";
  String suggestTextForSpeach = "null";
  _showFeedBackText(index) {
    if (index >= 0 && index < 3) {
      setState(() {
        suggestText =getTranslated("feedback_suggests_difficult_time", context);
        suggestTextForSpeach= "Your feedback suggests you’re going through a very difficult time.  Hang in there. Let's work together to find ways to lift you up. I’m with you all the way. In the meantime reach out to family, friends or a health practioner for extra support.";
        print("feedback 1-3");
      });
    } else if (index >= 3 && index < 7) {
      setState(() {
        suggestText = getTranslated("feedback_suggests_unhappy", context);
        suggestTextForSpeach= "Your feedback suggests you are unhappy with aspects of your life. Hang in there. Let's find what's in your heart that will make you glow, goals that will inspire you and strategies that will help you coach yourself to greater happiness. I know you will succeed as you have the answers within you. I’m with you all the way . Let’s go, and let's kickstart your journey!";

        print("feedback 4-7");
      });
    } else {
      setState(() {
        suggestText = getTranslated("feedback_suggests_happy", context);
        suggestTextForSpeach= "Your feedback suggests you are happy in your life. Thats great! There may be areas you still want to work on and refine for if you did you would thrive even more. Lets kickstart your journey and make that happen. I’m with you all the way.";

        print("feedback 8-10");
      });
    }
    //
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
