import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:provider/provider.dart';
import '../../../../global/widgets/custom_widgets.dart';
import '../../../../provider/storage_provider.dart';
import 'happy_with_activity.dart';
import 'happy_with_support.dart';

class Friends extends StatefulWidget {
  static const String id = "/friends";

  const Friends({Key? key}) : super(key: key);

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  bool showButton = false;
  bool isButtonActive = true;
  bool absoreTap = false;
  int selectedIndex = 0;


       @override
  void initState() {
    super.initState();
    Provider.of<StorageProvider>(context, listen: false).audioSpeak("Solid friendships create a community and reduce feelings of loneliness and increase wellbeing. Friends support you in good times and bad, while having lots of fun, intimate chats and accept you for who you are, warts and all. Let’s create a plan on how you will achieve your goal in this area.How satisfied are you that you have an active social life.");
  }


  @override
  Widget build(BuildContext context) {
  StorageProvider storageValue =
        Provider.of<StorageProvider>(context, listen: false);
    return Scaffold(
      appBar: newAppBar(context),
      body: Container(
        padding: EdgeInsets.all(10.h),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 4,
                  child: Text(
                    // getTranslated("why_dont_start_friends_goal", context),
                    //"Let's understand how happy you are with the different aspects of your Friends by rating how satisfied you are on a scale of 1-10",
                    "Solid friendships create a community and reduce feelings of loneliness and increase wellbeing. Friends support you in good times and bad, while having lots of fun, intimate chats and accept you for who you are, warts and all. Let’s create a plan on how you will achieve your goal in this area.",
                    style: TextStyles.regularBoldTextStyle(context),
                  ),
                ),
                // Image.asset(
                //   Images.selectedArea2,
                //   width: 120.sp,
                // ),
                 Flexible(
                  child: Image.asset(
                   // Images.selectedArea2,
                    Images.userPlaceholder,
                    width: 60.sp,
                  ),
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
                    // getTranslated("on_scale_1_10", context),
                    "How satisfied are you that you have an active social life.",
                    style: TextStyles.smallBoldTextStyle(context),
                  ),
                  // SizedBox(height: 20.sp),
                  // Text(
                  //   getTranslated("friends", context),
                  //   style: TextStyles.smallBoldTextStyle(context),
                  // ),
                  SizedBox(height: 10.sp),
                  Text(
                    // getTranslated('happy_with_being_yourself', context),
                    "Social Life",
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),

                  SizedBox(height: 20.sp),

            //
            AbsorbPointer(
              absorbing: false,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child:
                
                //  SizedBox(
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
                //             storageValue.updateResponse1(index);
                //             selectedIndex = index;
                //             showButton = true;
                //             absoreTap = true;
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
                                  selectedIndex = (index + 1);
                                  
                                  setColorsinIndex(index, context);
                                  storageValue.updateResponse1(index);
                                // selectedIndex = index;
                                  showButton = true;
                                  absoreTap = true;
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

            
                ],
              ),
            ),
          ],
        ),
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
                goPageWithName(context, AskingSupport.id);
              });
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
