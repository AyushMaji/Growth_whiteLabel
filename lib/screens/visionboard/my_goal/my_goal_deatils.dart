// ignore_for_file: avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/alart_dialogbox.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/provider/visionboard_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'edit_my_goal.dart';

class MyGoalDetails extends StatefulWidget {
  const MyGoalDetails({Key? key}) : super(key: key);

  @override
  State<MyGoalDetails> createState() => _MyGoalDetailsState();
}

class _MyGoalDetailsState extends State<MyGoalDetails> {
 @override
  void initState() {
    super.initState();

    final _visionBoard = Provider.of<VisionboardProvider>(context, listen: false);
    final _storeProvider = Provider.of<StorageProvider>(context, listen: false);
    //
    int firstIndex = int.parse("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].howImportantIsGoal}");
    print("firstIndex == $firstIndex");
    setColorsinIndex(firstIndex, context);   

    int secondIndex = int.parse("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].worthEffortToAchieve}");
    print("secondIndex == $secondIndex");
    secondColorsinIndex(secondIndex, context);

    int thirdIndex = int.parse("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].canYouAchieveIt}");
    print("thirdIndex == $thirdIndex");
    thirdIndexColor(thirdIndex, context);    
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: dashboardAppBar( context,getTranslated("details", context),),
    
    body: SingleChildScrollView(
      child: Consumer<StorageProvider>(
            builder: (context, _storeProvider, child) {
            
              return Consumer<VisionboardProvider>(
                builder: (context, _visionBoard, child) {
                  //
                  List<String> skillsQualitiesSupport =
                  (("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].qualitiesToSupportGoal}")
                      .split(',')
                      .toList());
                  //    
                  List<String> skillsQualitiesNeedDevelop =
                  (("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].qualitiesToDevelopToAchieveGoal}")
                    .split(',')
                    .toList());
                  //
                  return Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                
                    //Text("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].id}"),
                    //Text("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].userId}"),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(getTranslated("goal", context),
                              style: TextStyles.boldTextStyle(context),
                            ),
                            IconButton(
                              onPressed: () {
                              goPage(context, const EditMyGoal());
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.brown.shade300,
                              ),
                            ),
                          ],
                    ),
                    Text("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].goal}"),
                    SizedBox(height: 10.h),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  getTranslated("start_date", context),
                                  style: TextStyles.boldTextStyle(context),
                                ),
                                Text("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].goalStartDate}"),
                                //const Text("09-11-2021")
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  getTranslated("end_date", context),
                                  style: TextStyles.boldTextStyle(context),
                                ),
                                Text("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].goalEndDate}"),

                              ],
                            ),
                          ],
                        ),
                            
                    //
                    SizedBox(height: 10.h),

                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getTranslated("image", context),
                                style: TextStyles.boldTextStyle(context),
                              ),
                              _visionBoard.goalData.data?.goals?[_storeProvider.goalIndex].image == null ?  
                                FadeInImage.assetNetwork(
                                  fit: BoxFit.cover,
                                  placeholder: Images.uploadImage,
                                  image: 'https://raw.githubusercontent.com/muktabd/public-images/main/placeholder.jpg',
                                )
                                
                                :
                                
                                
                                 SizedBox(
                                      width: 150.w,
                                      height: 90.h,
                                  child: 
                                  

                                  // FadeInImage.assetNetwork(
                                  //   fit: BoxFit.cover,
                                  //   placeholder: Images.uploadImage,
                                  //   image: "${AppConstants.baseURL}${_visionBoard.goalData.data?.goals?[_storeProvider.goalIndex].image}",
                                  // ),
                                   CachedNetworkImage(
                                                    imageUrl: "${AppConstants.baseURL}${_visionBoard.goalData.data?.goals?[_storeProvider.goalIndex].image}",fit: BoxFit.cover,
                                                    progressIndicatorBuilder: (context, url, downloadProgress) => 
                                                            Shimmer.fromColors(
                                                            baseColor: Color.fromARGB(255, 224, 220, 220),
                                                            highlightColor: Colors.white,child: Image.asset(Images.apoinShimmerBox,fit: BoxFit.cover)),
                                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                                ),


                                ),
                              ],
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getTranslated("progress", context),
                                style: TextStyles.boldTextStyle(context),
                              ),
                              Image.asset(
                                Images.progress,
                                fit: BoxFit.cover,
                                // width: 120.w,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),                 

                    Text(getTranslated("my_affirmations", context),
                      style: TextStyles.boldTextStyle(context),
                    ),
                    
                    SizedBox(height: 5.sp),
                    Text("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].dailyAffirmation}"),
                    
                    SizedBox(height: 10.h),
                    Text(getTranslated("midset", context),
                          style: TextStyles.boldTextStyle(context)),
                    Text("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].promiseToAchieveGoal}"),
                    
                    SizedBox(height: 10.h),
                    Text(getTranslated("steps_will_take_achieve", context),
                          style: TextStyles.boldTextStyle(context)),

                    //Text("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].image}"),
                    
                    
                    //
                    // Text("1. ${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].firstStepToAchieveGoal}"),
                    // Text("2. ${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].secondStepToAchieveGoal}"),
                    // Text("3. ${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].thirdStepToAchieveGoal}"),
                    // Text("4. ${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].fourthStepToAchieveGoal}"),
                    // Text("5. ${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].fifthStepToAchieveGoal}"),
                    // SizedBox(height: 10.h),

                    _visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].firstStepToAchieveGoal == "null" ? 
                    Text("Add my 1st step towards my goal") : Text("1. ${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].firstStepToAchieveGoal}"),
                    //  TextFormField(
                    //  enabled: false,
                    //  decoration: InputDecoration(
                    //   labelText: "Add step",
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),)) : Text("1. ${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].firstStepToAchieveGoal}"),
                    SizedBox(height: 10.h),
                    _visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].secondStepToAchieveGoal == "null"? 
                    Text("Add my 2nd step towards my goal",style: TextStyle( color: Colors.grey,fontStyle: FontStyle.italic)) : Text("2. ${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].secondStepToAchieveGoal}"),
                    // TextFormField(
                    //  enabled: false,
                    //  decoration: InputDecoration(
                    //   labelText: "Add step",
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),)) : Text("2. ${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].secondStepToAchieveGoal}"),
                    SizedBox(height: 10.h),
                    _visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].thirdStepToAchieveGoal == "null"? 
                    Text("Add my 3rd step towards my goal",style: TextStyle( color: Colors.grey,fontStyle: FontStyle.italic)) : Text("3. ${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].thirdStepToAchieveGoal}"),
                    // TextFormField(
                    //  enabled: false,
                    //  decoration: InputDecoration(
                    //   labelText: "Add step",
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),))  : Text("3. ${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].thirdStepToAchieveGoal}"),
                    SizedBox(height: 10.h),
                    _visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].fourthStepToAchieveGoal == "null"? 
                    Text("Add my 4th step towards my goal",style: TextStyle( color: Colors.grey,fontStyle: FontStyle.italic)) : Text("4. ${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].fourthStepToAchieveGoal}"),
                    // TextFormField(
                    //  enabled: false,
                    //  decoration: InputDecoration(
                    //   labelText: "Add step",
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),))  : Text("4. ${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].fourthStepToAchieveGoal}"),
                    SizedBox(height: 10.h),
                    _visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].fifthStepToAchieveGoal == "null"? 
                    Text("Add my 5th step towards my goal",style: TextStyle( color: Colors.grey,fontStyle: FontStyle.italic)) : Text("5. ${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].fifthStepToAchieveGoal}"),
                    // TextFormField(
                    //  enabled: false,
                    //  decoration: InputDecoration(
                    //  labelText: "Add step",
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),))  : Text("5. ${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].fifthStepToAchieveGoal}"),
                   SizedBox(height: 10.h),
                    //
                    Text(getTranslated("how_important_goal", context),
                          style: TextStyles.boldTextStyle(context)),
                    //Text("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].howImportantIsGoal}"),

                    SizedBox(height: 5.h),
                    //replace with important of goal value
                    AbsorbPointer(
                      absorbing: true,
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
                                    setColorsinIndex(index, context);
                                },
                                child: Card(
                                  child: Container(
                                    color: colors[index],
                                    height: 20.h,
                                    width: 30.w,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),

                    Text(getTranslated("now_ask_worth_effort", context),
                          style: TextStyles.boldTextStyle(context),
                        ),
                    SizedBox(height: 5.h),
                    //Text("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].worthEffortToAchieve}"),
                    AbsorbPointer(
                      absorbing: true,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(getTranslated('now_ask_worth_effort', context),
                          //     style: TextStyles.smallBoldTextStyle(context)),
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
                                    });
                                  },
                                  child: Card(
                                    child: Container(
                                      color: secondColorsScal[secondIndex],
                                      height: 20.h,
                                      width: 30.w,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ]
                      ),
                    ),
                    
                    SizedBox(height: 10.h),

                    //
                    Text(
                      getTranslated("do_you_believe", context),
                      style: TextStyles.boldTextStyle(context),
                    ),
                    SizedBox(height: 5.h),
                    //Text("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].canYouAchieveIt}"),
                    AbsorbPointer(
                      absorbing: true,
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
                                  print( "thirdIndex ===>>> $thirdIndex");
                                });
                              },
                              child: Card(
                                child: Container(
                                  color: thirtIndexColor[thirdIndex],
                                  height: 20.h,
                                  width: 30.w,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),

                    //
                    SizedBox(height: 10.h),
                    Text(getTranslated("what_will_the_benefits", context),
                            style: TextStyles.boldTextStyle(context)),
                    SizedBox(height: 10.w),
                    Text("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].achieveGoal}"),
                 
                    //
                     SizedBox(height: 10.h),
                    // Text(getTranslated("what_will_the_price", context),
                    //         style: TextStyles.boldTextStyle(context)),
                    // SizedBox(height: 10.sp),
                    // Text("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].priceUnachieveGoal}"),
                    // SizedBox(height: 10.h),
                    
                    //
                    Text(getTranslated("what_qualities_have_to_support", context),
                        style: TextStyles.boldTextStyle(context)),
                    SizedBox(height: 5.sp),
                    for (var i = 0; i < skillsQualitiesSupport.length; i++) Text("• ${skillsQualitiesSupport[i]}"),                 
                    SizedBox(height: 10.h),
                    
                    //
                    Text(getTranslated("what_skill_need_develop", context),
                        style: TextStyles.boldTextStyle(context)),
                    SizedBox(height: 5.sp),
                    for (var i = 0; i < skillsQualitiesNeedDevelop.length; i++) Text("• ${skillsQualitiesNeedDevelop[i]}"),
                    //Text("${_visionBoard.storeGoalData.data?.goals?[_storeProvider.goalIndex].qualitiesToDevelopToAchieveGoal}"),
                    SizedBox(height: 10.h),

                  SizedBox(
                  width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                    style: ButtonStyles.getRedStyle(context),
                      onPressed: (){
                        AlartDialogBox.deleteGoalAlartBox(context);
                        
                    }, child: const Text("Delete this goal")),
                  )
                ],
              ),
            );            
          }
        );
       }
      )
     )
    );
  }
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
  setColorsinIndex(firstScalindex, BuildContext context) {
    if (firstScalindex == 0) {
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
        
    } else if (firstScalindex == 1) {
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
    } else if (firstScalindex == 2) {
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
    } else if (firstScalindex == 3) {
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
    } else if (firstScalindex == 4) {
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
    } else if (firstScalindex == 5) {
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
    } else if (firstScalindex == 6) {
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
    } else if (firstScalindex == 7) {
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
    } else if (firstScalindex == 8) {
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
    } else if (firstScalindex == 9) {
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
    }
    //
  }

  
  //
  List<Color> secondColorsScal = [
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

  secondColorsinIndex(index, BuildContext context) {
    if (index == 0) {
      
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Colors.grey.shade400;
        secondColorsScal[2] = Colors.grey.shade400;
        secondColorsScal[3] = Colors.grey.shade400;
        secondColorsScal[4] = Colors.grey.shade400;
        secondColorsScal[5] = Colors.grey.shade400;
        secondColorsScal[6] = Colors.grey.shade400;
        secondColorsScal[7] = Colors.grey.shade400;
        secondColorsScal[8] = Colors.grey.shade400;
        secondColorsScal[9] = Colors.grey.shade400;
  
    } else if (index == 1) {
      
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Colors.grey.shade400;
        secondColorsScal[3] = Colors.grey.shade400;
        secondColorsScal[4] = Colors.grey.shade400;
        secondColorsScal[5] = Colors.grey.shade400;
        secondColorsScal[6] = Colors.grey.shade400;
        secondColorsScal[7] = Colors.grey.shade400;
        secondColorsScal[8] = Colors.grey.shade400;
        secondColorsScal[9] = Colors.grey.shade400;
  
    } else if (index == 2) {
      
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Color(0xFFF2E3CF);
        secondColorsScal[3] = Colors.grey.shade400;
        secondColorsScal[4] = Colors.grey.shade400;
        secondColorsScal[5] = Colors.grey.shade400;
        secondColorsScal[6] = Colors.grey.shade400;
        secondColorsScal[7] = Colors.grey.shade400;
        secondColorsScal[8] = Colors.grey.shade400;
        secondColorsScal[9] = Colors.grey.shade400;
  
    } else if (index == 3) {
      
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Color(0xFFF2E3CF);
        secondColorsScal[3] = Color(0xFFEFDCC4);
        secondColorsScal[4] = Colors.grey.shade400;
        secondColorsScal[5] = Colors.grey.shade400;
        secondColorsScal[6] = Colors.grey.shade400;
        secondColorsScal[7] = Colors.grey.shade400;
        secondColorsScal[8] = Colors.grey.shade400;
        secondColorsScal[9] = Colors.grey.shade400;
  
    } else if (index == 4) {
      
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Color(0xFFF2E3CF);
        secondColorsScal[3] = Color(0xFFEFDCC4);
        secondColorsScal[4] = Color(0xFFEFDCC4);
        secondColorsScal[5] = Colors.grey.shade400;
        secondColorsScal[6] = Colors.grey.shade400;
        secondColorsScal[7] = Colors.grey.shade400;
        secondColorsScal[8] = Colors.grey.shade400;
        secondColorsScal[9] = Colors.grey.shade400;
  
    } else if (index == 5) {
      
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Color(0xFFF2E3CF);
        secondColorsScal[3] = Color(0xFFEFDCC4);
        secondColorsScal[4] = Color(0xFFEFDCC4);
        secondColorsScal[5] = Color(0xFFEFDCC4);
        secondColorsScal[6] = Colors.grey.shade400;
        secondColorsScal[7] = Colors.grey.shade400;
        secondColorsScal[8] = Colors.grey.shade400;
        secondColorsScal[9] = Colors.grey.shade400;
  
    } else if (index == 6) {
      
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Color(0xFFF2E3CF);
        secondColorsScal[3] = Color(0xFFEFDCC4);
        secondColorsScal[4] = Color(0xFFEFDCC4);
        secondColorsScal[5] = Color(0xFFEFDCC4);
        secondColorsScal[6] = Color(0xFFF0DAC0);
        secondColorsScal[7] = Colors.grey.shade400;
        secondColorsScal[8] = Colors.grey.shade400;
        secondColorsScal[9] = Colors.grey.shade400;
  
    } else if (index == 7) {
      
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Color(0xFFF2E3CF);
        secondColorsScal[3] = Color(0xFFEFDCC4);
        secondColorsScal[4] = Color(0xFFEFDCC4);
        secondColorsScal[5] = Color(0xFFEFDCC4);
        secondColorsScal[6] = Color(0xFFF0DAC0);
        secondColorsScal[7] = Color(0xFFEED4B4);
        secondColorsScal[8] = Colors.grey.shade400;
        secondColorsScal[9] = Colors.grey.shade400;
  
    } else if (index == 8) {
      
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Color(0xFFF2E3CF);
        secondColorsScal[3] = Color(0xFFEFDCC4);
        secondColorsScal[4] = Color(0xFFEFDCC4);
        secondColorsScal[5] = Color(0xFFEFDCC4);
        secondColorsScal[6] = Color(0xFFF0DAC0);
        secondColorsScal[7] = Color(0xFFEED4B4);
        secondColorsScal[8] = Color(0xFFF1D2AC);
        secondColorsScal[9] = Colors.grey.shade400;
  
    } else if (index == 9) {
      
        secondColorsScal[0] = Color(0xFFF8F1E7);
        secondColorsScal[1] = Color(0xFFF8F1E7);
        secondColorsScal[2] = Color(0xFFF2E3CF);
        secondColorsScal[3] = Color(0xFFEFDCC4);
        secondColorsScal[4] = Color(0xFFEFDCC4);
        secondColorsScal[5] = Color(0xFFEFDCC4);
        secondColorsScal[6] = Color(0xFFF0DAC0);
        secondColorsScal[7] = Color(0xFFEED4B4);
        secondColorsScal[8] = Color(0xFFF1D2AC);
        secondColorsScal[9] = Color(0xFFF1CC9D);
  
    }
  }

  //

  //
  List<Color> thirtIndexColor = [
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

  thirdIndexColor(index, BuildContext context) {
    if (index == 0) {
      
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Colors.grey.shade400;
        thirtIndexColor[2] = Colors.grey.shade400;
        thirtIndexColor[3] = Colors.grey.shade400;
        thirtIndexColor[4] = Colors.grey.shade400;
        thirtIndexColor[5] = Colors.grey.shade400;
        thirtIndexColor[6] = Colors.grey.shade400;
        thirtIndexColor[7] = Colors.grey.shade400;
        thirtIndexColor[8] = Colors.grey.shade400;
        thirtIndexColor[9] = Colors.grey.shade400;
    } else if (index == 1) {
      
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Colors.grey.shade400;
        thirtIndexColor[3] = Colors.grey.shade400;
        thirtIndexColor[4] = Colors.grey.shade400;
        thirtIndexColor[5] = Colors.grey.shade400;
        thirtIndexColor[6] = Colors.grey.shade400;
        thirtIndexColor[7] = Colors.grey.shade400;
        thirtIndexColor[8] = Colors.grey.shade400;
        thirtIndexColor[9] = Colors.grey.shade400;
    } else if (index == 2) {
      
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Color(0xFFF2E3CF);
        thirtIndexColor[3] = Colors.grey.shade400;
        thirtIndexColor[4] = Colors.grey.shade400;
        thirtIndexColor[5] = Colors.grey.shade400;
        thirtIndexColor[6] = Colors.grey.shade400;
        thirtIndexColor[7] = Colors.grey.shade400;
        thirtIndexColor[8] = Colors.grey.shade400;
        thirtIndexColor[9] = Colors.grey.shade400;
    } else if (index == 3) {
      
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Color(0xFFF2E3CF);
        thirtIndexColor[3] = Color(0xFFEFDCC4);
        thirtIndexColor[4] = Colors.grey.shade400;
        thirtIndexColor[5] = Colors.grey.shade400;
        thirtIndexColor[6] = Colors.grey.shade400;
        thirtIndexColor[7] = Colors.grey.shade400;
        thirtIndexColor[8] = Colors.grey.shade400;
        thirtIndexColor[9] = Colors.grey.shade400;
    } else if (index == 4) {
      
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Color(0xFFF2E3CF);
        thirtIndexColor[3] = Color(0xFFEFDCC4);
        thirtIndexColor[4] = Color(0xFFEFDCC4);
        thirtIndexColor[5] = Colors.grey.shade400;
        thirtIndexColor[6] = Colors.grey.shade400;
        thirtIndexColor[7] = Colors.grey.shade400;
        thirtIndexColor[8] = Colors.grey.shade400;
        thirtIndexColor[9] = Colors.grey.shade400;
    } else if (index == 5) {
      
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Color(0xFFF2E3CF);
        thirtIndexColor[3] = Color(0xFFEFDCC4);
        thirtIndexColor[4] = Color(0xFFEFDCC4);
        thirtIndexColor[5] = Color(0xFFEFDCC4);
        thirtIndexColor[6] = Colors.grey.shade400;
        thirtIndexColor[7] = Colors.grey.shade400;
        thirtIndexColor[8] = Colors.grey.shade400;
        thirtIndexColor[9] = Colors.grey.shade400;
    } else if (index == 6) {
      
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Color(0xFFF2E3CF);
        thirtIndexColor[3] = Color(0xFFEFDCC4);
        thirtIndexColor[4] = Color(0xFFEFDCC4);
        thirtIndexColor[5] = Color(0xFFEFDCC4);
        thirtIndexColor[6] = Color(0xFFF0DAC0);
        thirtIndexColor[7] = Colors.grey.shade400;
        thirtIndexColor[8] = Colors.grey.shade400;
        thirtIndexColor[9] = Colors.grey.shade400;
    } else if (index == 7) {
      
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Color(0xFFF2E3CF);
        thirtIndexColor[3] = Color(0xFFEFDCC4);
        thirtIndexColor[4] = Color(0xFFEFDCC4);
        thirtIndexColor[5] = Color(0xFFEFDCC4);
        thirtIndexColor[6] = Color(0xFFF0DAC0);
        thirtIndexColor[7] = Color(0xFFEED4B4);
        thirtIndexColor[8] = Colors.grey.shade400;
        thirtIndexColor[9] = Colors.grey.shade400;
    } else if (index == 8) {
      
        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Color(0xFFF2E3CF);
        thirtIndexColor[3] = Color(0xFFEFDCC4);
        thirtIndexColor[4] = Color(0xFFEFDCC4);
        thirtIndexColor[5] = Color(0xFFEFDCC4);
        thirtIndexColor[6] = Color(0xFFF0DAC0);
        thirtIndexColor[7] = Color(0xFFEED4B4);
        thirtIndexColor[8] = Color(0xFFF1D2AC);
        thirtIndexColor[9] = Colors.grey.shade400;
    } else if (index == 9) {

        thirtIndexColor[0] = Color(0xFFF8F1E7);
        thirtIndexColor[1] = Color(0xFFF8F1E7);
        thirtIndexColor[2] = Color(0xFFF2E3CF);
        thirtIndexColor[3] = Color(0xFFEFDCC4);
        thirtIndexColor[4] = Color(0xFFEFDCC4);
        thirtIndexColor[5] = Color(0xFFEFDCC4);
        thirtIndexColor[6] = Color(0xFFF0DAC0);
        thirtIndexColor[7] = Color(0xFFEED4B4);
        thirtIndexColor[8] = Color(0xFFF1D2AC);
        thirtIndexColor[9] = Color(0xFFF1CC9D);
    }
  }
  //