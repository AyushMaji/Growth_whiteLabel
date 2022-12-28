// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/global/constants/color_resources.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/widgets/primary_button.dart';
import 'package:olga/global/widgets/text_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/registration/how_feel_today.dart';
import 'package:provider/provider.dart';

class QuizResult extends StatefulWidget {
  static const String id = "/quizResult";
  const QuizResult({Key? key}) : super(key: key);

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  String quizFeedback = "null";
  String speakQuizFeedback = "null";

  @override
  void initState() {
    AppConstants.hideButton = true;
    AppConstants.isVisible = false;

    super.initState();
    StorageProvider storeValues =
        Provider.of<StorageProvider>(context, listen: false);
    int finalScore = storeValues.totalQuizScore;

    if (finalScore >= 1 && finalScore <= 7) {
      setState(() {
        speakQuizFeedback =
            ",  Your feedback suggests your not optimistic about life. Hang in there. Dont let any setbacks determine the rest of your life. Dont feel defeated. Let's work together so you create a life that brings you joy, hope and meaning. Goals that speak to your heart. Hang in there and you will see that there is light at the end of the tunnel.";
      });
    } else if (finalScore >= 8 && finalScore <= 14) {
      setState(() {
        speakQuizFeedback =
            ",  Your feedback suggests that you feel flat about life. Let's kick start goals that will bring you passion, fun and joy in your life. Let's focus on overcoming what is holding you back and make your dreams a reality and you are the best version of you.";
      });
    } else if (finalScore >= 15 && finalScore <= 21) {
      setState(() {
        speakQuizFeedback =
            ",Your feedback suggests you are a little hopeful about life. Thats a good start. Trust that good things will come your way.  Be brave and ask what you want from life. Let's focus on creating a life of meaning and all that you can be. Let your hope shape your future. Let's kickstart your journey.";
      });
    } else if (finalScore >= 22 && finalScore <= 28) {
      setState(() {
        speakQuizFeedback =
            ", your feedback suggests you are somewhat hopeful. That's a great start. Be brave and ask for what you want from life. Let's focus on designing goals that inspire you and the roadmap that will get you there. You are more capable than you realise. Let's help you take action and thrive.";
      });
    } else if (finalScore >= 29 && finalScore <= 35) {
      setState(() {
        speakQuizFeedback =
            ",  Your feedback suggests you are an optimistic person. Let's focus on designing goals that inspire you and the roadmap that will get you there. You are more capable than you realise. Let's help you take action and thrive.";
      });
    } else if (finalScore >= 36 && finalScore <= 42) {
      setState(() {
        speakQuizFeedback =
            ",  Your feedback suggests you are an optimistic person. Let's focus on designing goals that inspire you and the roadmap that will get you there. You are more capable than you realise. Let's help you take action and thrive.";
      });
    } else {
      setState(() {
        speakQuizFeedback =
            ",  Your feedback suggests your not optimistic about life. Hang in there. Dont let any setbacks determine the rest of your life. Dont feel defeated. Let's work together so you create a life that brings you joy, hope and meaning. Goals that speak to your heart. Hang in there and you will see that there is light at the end of the tunnel.";
      });
    }
    Provider.of<StorageProvider>(context, listen: false)
        .audioSpeak(speakQuizFeedback);
  }

  @override
  Widget build(BuildContext context) {
    StorageProvider storeValues =
        Provider.of<StorageProvider>(context, listen: false);
    int finalScore = storeValues.totalQuizScore;

    if (finalScore >= 1 && finalScore <= 7) {
      setState(() {
        quizFeedback = getTranslated("your_not_optimistic", context);
        print("feedback 1-7");
      });
    } else if (finalScore >= 8 && finalScore <= 14) {
      setState(() {
        quizFeedback = getTranslated("feel_flat_about_life", context);
        print("feedback 8-14");
      });
    } else if (finalScore >= 15 && finalScore <= 21) {
      setState(() {
        quizFeedback = getTranslated("a_little_hopeful_person", context);
        print("feedback 15-21");
      });
    } else if (finalScore >= 22 && finalScore <= 28) {
      setState(() {
        quizFeedback = getTranslated("somewht_hopeful_person", context);
        print("feedback 22-28");
      });
    } else if (finalScore >= 29 && finalScore <= 35) {
      setState(() {
        quizFeedback = getTranslated("an_optimistic_person", context);
        print("feedback 29-35");
      });
    } else if (finalScore >= 36 && finalScore <= 42) {
      setState(() {
        quizFeedback = getTranslated("an_optimistic_person", context);
        print("feedback 36-42");
      });
    } else {
      setState(() {
        quizFeedback = getTranslated("your_not_optimistic", context);
        print("feedback 0-0");
      });
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(),
      ),
      body: Consumer<StorageProvider>(builder: (context, authProvider, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15.sp),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Image.asset(Images.userPlaceholder, width: 60.w),
                    SizedBox(width: 10.w),
                    Flexible(
                      child: Text(
                        storeValues.name + quizFeedback,
                        style: TextStyles.smallBoldTextStyle(context),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: AppConstants.hideButton,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextBtn(
                      title: getTranslated("continue", context),
                      onPressed: () {
                        setState(() {
                          AppConstants.hideButton = false;
                          AppConstants.isVisible = true;
                          Provider.of<StorageProvider>(context, listen: false)
                              .audioSpeak(
                                  "Imagine going beyond your current circumstances and limitations by thinking about the changes you want to make in the form of an ideal vision. As Jonas Edward Salt once said.. “Hope lies in dreams and imagination and in the courage of those who dare to make dreams a reality..............” Start building the new by creating a mental picture of the life you would love and what this would look like for you.");
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Visibility(
                visible: AppConstants.isVisible,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(height: 10.h),
                        Image.asset(
                          Images.lifeScaleFlip,
                          width: 150.w,
                        ),
                        SizedBox(width: 10.w),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: Text(
                              getTranslated('imagine_going_beyond', context),
                              style: TextStyles.smallBoldTextStyle(context),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.sp),
                    RichText(
                      text: TextSpan(
                        text: getTranslated("as", context),
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: getTranslated("jonas_edward", context),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color:
                                    ColorResources.getBlackTextColor(context),
                                fontFamily: 'Poppins',
                                fontStyle: FontStyle.italic),
                          ),
                          TextSpan(
                            text: getTranslated("once_said", context),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    Padding(
                      padding: EdgeInsets.all(15.w),
                      child: Text(
                        getTranslated("hope_lies_dreams", context),
                        textAlign: TextAlign.center,
                        style: TextStyles.labelTextStyle(context),
                      ),
                    ),
                    SizedBox(height: 15.sp),
                    Row(
                      children: [
                        SizedBox(height: 10.sp),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15.w),
                            child: Text(
                              getTranslated('start_building_new', context),
                              style: TextStyles.smallBoldTextStyle(context),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Image.asset(Images.lifeScale, width: 150.w),
                      ],
                    ),
                    SizedBox(height: 35.w),
                    Padding(
                      padding: EdgeInsets.all(15.w),
                      child: PrimaryButton(
                        title: getTranslated('continue', context),
                        onPressed: () {
                          Provider.of<StorageProvider>(context, listen: false)
                              .registrationSafetyNet(route: HowFeelToday.id);
                          goPageWithName(context, HowFeelToday.id);
                          print('enter');
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
