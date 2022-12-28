// ignore_for_file: avoid_print
import 'package:olga/provider/happy_life_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/storage_provider.dart';
import '../goal/goal_steps.dart';
import 'skill_develop.dart';

class SkillQualities extends StatefulWidget {
  static const String id = "/skillQualities";
  const SkillQualities({Key? key}) : super(key: key);

  @override
  State<SkillQualities> createState() => _skillsSupportIndexState();
}

class _skillsSupportIndexState extends State<SkillQualities> {
  bool showButton = false;
  int? selectedIndex;

  final List<String> _wordName = [
    // "Resilience",
    // "Creativity",
    // "Self-reliability",
    // "Patience",
    // "Courage",
    // "Commitment",
    // "Willpower",
    // "Passion",
    // "Planning",
    // "Integrity",
    // "Optimism",
    // "Risk Taking",
    // "Self confidence",
    // "Empathy",
    // "Flexibility",
    // "Innovative",
    // "Persistence",
    // "Pro-active",


    "Self-Awareness",
    "Assertiveness",
    "Independence",
    "Self-Belief",
    "Passion",
    "Organised",
    "Network",
    "Realistic",
    "Flexible",
    "Problem Solving",
    "Motivation",
    "Persistence",
    "Optimism",
    "Self-Care",
    "Discipline",
    "Pro-Active",
    "Risk-Taking",
    "Resilience",


  ];

  @override
  void initState() {
    super.initState();
    Provider.of<StorageProvider>(context, listen: false).audioSpeak("Select key skills that you have that will help you achieve your goal");

  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(),
      ),
      body:Consumer<StorageProvider>(
          builder: (context, storeValues, child) {
            return Container(
          padding: EdgeInsets.all(15.w),
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
                       // getTranslated('choose_skill_qualities', context),
                       "Select key skills that you have that will help you achieve your goal",
                        style: TextStyles.smallBoldTextStyle(context),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Expanded(
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 155,
                        childAspectRatio: 3 / 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5),
                    itemCount: 18,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {                        
                           setState(() {

                            if (storeValues.skillsSupportIndex.contains(index)) {
                              storeValues.skillsSupportIndex.remove(index);
                              storeValues.skillsSupportWordList.remove(_wordName[index]);
                            } else {
                              storeValues.updateSkillsSupportIndex(index);
                              storeValues.updateSkillsSupportWordList(_wordName[index]);

                              print( "final selected index ===>>> ${storeValues.skillsSupportIndex}");
                              print("final skillsSupportWordList selected word ===>>> ${storeValues.skillsSupportWordList}"); 
                               Provider.of<StorageProvider>(context, listen: false).audioSpeak( _wordName[index]);
                            }
                            
                            showButton = true;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(5.w),
                          decoration: BoxDecoration( 
                            color: storeValues.skillsSupportIndex.contains(index)
                                ? const Color(0xffDEB988).withOpacity(0.3)
                                : const Color(0xffF4F4F6).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: storeValues.skillsSupportIndex.contains(index)
                                    ? const Color(0xffDEB988)
                                    : Colors.transparent,
                                width: 1),
                            image: const DecorationImage(
                              image: AssetImage(Images.buttonBG),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Text(_wordName[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  letterSpacing: 0.5.sp,
                                  fontWeight:
                                      storeValues.skillsSupportIndex.contains(index)
                                          ? FontWeight.w700
                                          : FontWeight.w400,
                                  color:
                                      storeValues.skillsSupportIndex.contains(index)
                                          ? const Color(0xffDEB988)
                                          : Colors.black,
                                )
                                // color: index==0 ? Colors.amber : null,
                                ),
                          ),
                        ),
                      );
                    }),
              ),
              Visibility(
                visible: showButton,
                child: SubmitButton(
                  title: getTranslated("submit", context),
                  onPressed: () {
                    setState(() {
                      print("button ready to work");                
                      print(" =================== ");
                      final skillsSupportSend = storeValues.skillsSupportWordList.reduce((value, element) => value + ',' + element);
                      print(" =================== ");
                      print(skillsSupportSend);
                      print(" =================== ");
                      // this values will will pass to API 
                      storeValues.updateSkillsSupportSend(skillsSupportSend);
                      goPageWithName(context, SkillsToDevelop.id);                     
                    });
                  },
                  buttonStyle: ButtonStyles.getCommonStyle(context),
                ),
              )
            ],
          ),
        );
        }
      ),
    );
  }

  
}
