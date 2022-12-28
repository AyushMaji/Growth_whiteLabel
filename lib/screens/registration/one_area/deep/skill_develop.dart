// ignore_for_file: avoid_print
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:olga/provider/happy_life_provider.dart';
import 'package:provider/provider.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/widgets/primary_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../global/methods/methods.dart';
import '../goal/goal_steps.dart';


class SkillsToDevelop extends StatefulWidget {
  static const String id = "/skillsToDevelop";
  const SkillsToDevelop({Key? key}) : super(key: key);

  @override
  State<SkillsToDevelop> createState() => _SkillsToDevelopState();
}

class _SkillsToDevelopState extends State<SkillsToDevelop> {
  bool showButton = false;
  int? selectedIndex;

  final List<String> _wordName = [
    "Resilience",
    "Communicate",
    "Self-reliability",
    "Patience",
    "Courage",
    "Commitment",
    "Willpower",
    "Cautious",
    "Assertiveness",
    "Integrity",
    "Optimism",
    "Risk Taking",
    "Self confidence",
    "Empathy",
    "Flexibility",
    "Listening",
    "Persistence",
    "Pacing",
  ];

  @override
  void initState() {
    super.initState();
    Provider.of<StorageProvider>(context, listen: false).audioSpeak("What skill do I need to develop to achieve my goal.");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(),
      ),
      body: Consumer<StorageProvider>(builder: (context, storeValues, child) {
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
                        getTranslated('what_skill_need_develop', context),
                        style: TextStyles.smallBoldTextStyle(context),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 2,
                    childAspectRatio: (3 / 2),
                  ),
                  itemCount: 18,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (storeValues.skillsDevelopIndex.contains(index)) {
                              storeValues.skillsDevelopIndex.remove(index);
                              storeValues.skillsDeveloptWordList.remove(_wordName[index]);
                            } else {
                              storeValues.updateSkillsDevelopIndex(index);
                              storeValues.updateSkillsDevelopWordList(_wordName[index]);  

                              print("final selected ===>>> ${storeValues.skillsDevelopIndex}");
                              print("final world list selected ===>>> ${storeValues.skillsDeveloptWordList}"); 
                         
                            storeValues.updateSkillsDevelopIndex(index);
                            print("now selected ===>>> $index");
                             Provider.of<StorageProvider>(context, listen: false).audioSpeak( _wordName[index]);
                          }
                          showButton = true;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(5.w),
                        decoration: BoxDecoration(
                          color:
                              storeValues.skillsDevelopIndex.contains(index)
                                  ? const Color(0xffDEB988).withOpacity(0.3)
                                  : const Color(0xffF4F4F6).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: storeValues.skillsDevelopIndex
                                      .contains(index)
                                  ? const Color(0xffDEB988)
                                  : Colors.transparent,
                              width: 1),
                          image: const DecorationImage(
                            image: AssetImage(Images.buttonBG),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Center(
                                child: Text(
                                  _wordName[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: storeValues.skillsDevelopIndex
                                            .contains(index)
                                        ? const Color(0xffDEB988)
                                        : Colors.black,
                                    fontWeight: storeValues.skillsDevelopIndex
                                            .contains(index)
                                        ? FontWeight.w700
                                        : FontWeight.w400,
                                  ),
                                  // color: index==0 ? Colors.amber : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Visibility(
                visible: showButton,
                child: PrimaryButton(
                  title: getTranslated("continue", context),
                  onPressed: () async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    print(" ========== Selected Goal Category ID ========== ");
                    print("${prefs.getString("oneSelectedAreaId")}");
                    print(" ===================================== ");
                    setState(() {
                  
                      print("===================");
                      log(storeValues.skillsDeveloptWordList.toString());
                      final skillsNeedDevelop = storeValues.skillsDeveloptWordList.reduce((value, element) => value + ',' + element);
                      print(skillsNeedDevelop);  
                      storeValues.updateSkillsDevelopSend(skillsNeedDevelop);
                      print("===================");

                      print("response1 =================== ${prefs.getInt("response1")}".toString()); 
                      log(prefs.getString("skillsSupportSend") ?? storeValues.skillsSupportSend.toString());
                      log("Not showing log ${prefs.getString("price") ?? storeValues.price.toString()}");
                    
                      HappyLifeSurvey _happyLifeSurvey = Provider.of<HappyLifeSurvey>(context, listen: false);
                      _happyLifeSurvey.happyLifeSurvey(
                      response1: prefs.getInt("response1").toString(), 
                      response2: prefs.getInt("response2").toString(), 
                      response3: prefs.getInt("response3").toString(), 
                      response4: prefs.getInt("response4").toString(), 
                      categoryId: prefs.getString("oneSelectedAreaId") ?? storeValues.oneSelectedAreaId.toString(), 
                      benefitAchiveGoal: prefs.getString("benefits") ?? storeValues.benefits.toString(), 
                      priceUnchiveGoal: prefs.getString("price") ?? storeValues.price.toString(),
                      importantOfGoal: prefs.getInt("importantYourGoal").toString(), 
                      worthOfEffort: prefs.getInt("worthYourEffort").toString(), 
                      beliveCanDoIt: prefs.getInt("believeYouCan").toString(), 
                      qualitiesYouHave: prefs.getString("skillsSupportSend") ?? storeValues.skillsSupportSend.toString(), 
                      qualitiesNeedToDevelop: skillsNeedDevelop.toString(), 
                      context: context);
            
                      //goPageWithName(context,  GoalSteps.id);
      
                    });
                  },
                ),
              ),
            ],
          ),
        );
        }
      ),
    );
  }

}
