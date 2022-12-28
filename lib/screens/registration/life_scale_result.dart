// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/services.dart';
import 'package:olga/global/styles/box_decoration.dart';
import 'package:olga/provider/ques_res_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/global/constants/color_resources.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/widgets/primary_button.dart';
import 'package:olga/global/widgets/text_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/storage_provider.dart';

import 'quiz_result.dart';

class LifeScaleResult extends StatefulWidget {
  static const String id = "/lifScaleResult";
  const LifeScaleResult({Key? key}) : super(key: key);

  @override
  State<LifeScaleResult> createState() => _LifeScaleResultState();
}

class _LifeScaleResultState extends State<LifeScaleResult> {
  bool _hideButton = true;

  @override
  void initState() {
    super.initState();
    _hideButton = true;
    AppConstants.isVisible = false;

    Provider.of<StorageProvider>(context, listen: false).audioSpeak(
        "Part of making change is having an “optimistic state of mind”. Hope is one characteristic successful people have in abundance.\n\nWould you consider yourself a person who is optimistic and hopeful? \n\nComplete this short quiz and let’s find out");
  }

  List<String> texts = ["Strongly\nDisagree", "Disagree", "Somewhat\n  Disagree", "Somewhat\n     agree", "Agree", "Strongly\n  Agree"];

  int ?selectedIndex ;
  int ?selectedIndex2 ;
  int ?selectedIndex3 ;
  int ?selectedIndex4 ;
  int ?selectedIndex5 ;
  int? selectedIndex6 ;
  int? selectedIndex7 ;

  String? _hopeisImportant;
  String? _outweighsAnxiety;
  String? _iFeelHopeful;
  String? _hopeImproveQuality;
  String? _hopefulWithRegards;
  String? _myHopesFulfilled;
  String? _remainHopeful;

  final List<String> _items = [
    'Strongly Disagree',
    'Disagree',
    'Somewhat Disagree',
    'Somewhat Agree',
    'Agree',
    'Strongly Agree'
  ];
  int hopeIsImportant = 0;
  int outweighsAnxiety = 0;
  int iFeelHopeful = 0;
  int hopeImproveQuality = 0;
  int hopefulWithRegards = 0;
  int myHopesFulfilled = 0;
  int remainHopeful = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(),
      ),
      body: Consumer<StorageProvider>(builder: (context, storeValues, child) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(left: 15.w, right: 5.w),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 10.h),
                    Image.asset(
                      Images.userPlaceholder,
                      width: 60.w,
                    ),
                    SizedBox(width: 5.w),
                    Flexible(
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                         // text: getTranslated('partof_making_change', context),
                          text: "Hope is one characteristic successful people have in abundance.",
                          // style: TextStyles.smallBoldTextStyle(context),
                           style: TextStyle(
                                // color:
                                //     ColorResources.getButtonCalicoColor(context),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 14.sp,),
                          children: [

                             TextSpan(
                              text: 
                              // getTranslated(
                              //     "partof_making_change1", context),
                              "\n\nPart of making change is having an\n",
                              style: TextStyle(
                                // color:
                                //     ColorResources.getButtonCalicoColor(context),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                fontSize: 14.sp,
                              ),
                            ),


                            TextSpan(
                              text: getTranslated(
                                  "optimistic_state_of_mind", context),
                              style: TextStyle(
                                color: ColorResources.getButtonCalicoColor(
                                    context),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                fontSize: 14.sp,
                              ),
                            ),


                             TextSpan(
                              text: 
                              // getTranslated(
                              //     "partof_making_change1", context),
                              "\n\nLet's assess how optimistic and hopeful you are by answering a few questions.\n",
                              style: TextStyle(
                                // color:
                                //     ColorResources.getButtonCalicoColor(context),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins',
                                fontSize: 14.sp,
                              ),
                            ),

                           
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Text(
                //   getTranslated('partof_making_change1', context),
                //   textAlign: TextAlign.right,
                //   style: TextStyles.smallBoldTextStyle(context),
                // ),
                Visibility(
                  visible: _hideButton,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextBtn(
                        title: getTranslated("continue_small", context),
                        onPressed: () {
                          setState(() {
                            _hideButton = false;
                            AppConstants.isVisible = true;
                            Provider.of<StorageProvider>(context, listen: false)
                                .audioSpeak(
                                    "\"Hope is important for my life\"");
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Visibility(
                  visible: AppConstants.isVisible,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      //
                      Text(
                        getTranslated("hope_is_important", context),
                        style: TextStyles.smallBoldTextStyle(context),
                      ),

                      //!

                       SizedBox(
                        height: 80.h,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemExtent: 57.w,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 6,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                 HapticFeedback.vibrate();
                                setState(() {
                                  setColorsinIndex(index, context);
                                   selectedIndex = (index + 1);

                                   _hopeisImportant = _items[index]; //array 1st item
                                    hopeIsImportant = _items.indexOf(_hopeisImportant as String);
                                    print(hopeIsImportant.toString());
                                     Provider.of<StorageProvider>(context, listen: false).audioSpeak("\"In my life, hope outweighs anxiety\"");
                                     storeValues.changeHopeImportant(_hopeisImportant);
                                });
                                 print("_hopeisImportant ===> $_hopeisImportant");
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 30,
                                   decoration: BoxDecoration(
                                      color: colors[index],
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
                               Expanded(child: Text(texts[index],style: TextStyle(fontSize: 8.sp,color: colorsForBorder[index]),))
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      //!


                      // Container(
                      //   padding: const EdgeInsets.all(5),
                      //   decoration: dropDownBorder,
                      //   child: DropdownButtonHideUnderline(
                      //     child: DropdownButton<String>(
                      //       hint: Padding(
                      //         padding: const EdgeInsets.all(10.0),
                      //         child: const Text("Select"),
                      //       ),
                      //       isExpanded: true,
                      //       value: _hopeisImportant,
                      //       icon: const Icon(Icons.keyboard_arrow_down),
                      //       items: _items.map((String value) {
                      //         return DropdownMenuItem(
                      //           value: value,
                      //           child: Container(
                      //             margin: const EdgeInsets.all(10),
                      //             child: Text(value),
                      //           ),
                      //         );
                      //       }).toList(),
                      //       onChanged: (newValue) {
                      //         setState(() {
                      //           _hopeisImportant = newValue!;
                      //           hopeIsImportant = _items.indexOf(newValue);
                      //           print(hopeIsImportant);
                      //           Provider.of<StorageProvider>(context,
                      //                   listen: false)
                      //               .audioSpeak(
                      //                   "\"In my life, hope outweighs anxiety\"");

                      //           //StorageProvider quesResProvider = Provider.of<StorageProvider>(context, listen: false);
                      //           storeValues
                      //               .changeHopeImportant(_hopeisImportant);
                      //         });
                      //         print("_hopeisImportant ===> $_hopeisImportant");
                      //       },
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 15.h),
                      //
                      Visibility(
                        visible: selectedIndex!=null?true:false,
                        child: Text(
                          getTranslated("in_my_life", context),
                          style: TextStyles.smallBoldTextStyle(context),
                        ),
                      ),

                       //!

                         Visibility(
                        visible: selectedIndex!=null?true:false,
                         child: SizedBox(
                          height: 80.h,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemExtent: 57.w,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                   HapticFeedback.vibrate();
                                  setState(() {
                                    setColorsinIndex2(index, context);
                                     selectedIndex2 = (index + 1);
                       
                                     _outweighsAnxiety = _items[index]; //array 1st item
                                      outweighsAnxiety = _items.indexOf(_outweighsAnxiety as String);
                                      print(outweighsAnxiety.toString());
                                       Provider.of<StorageProvider>(context, listen: false).audioSpeak("\"I feel hopeful\"");
                                      // storeValues.changeHopeImportant(_outweighsAnxiety);
                                  });
                                   print("_hopeisImportant ===> $_outweighsAnxiety");
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 30,
                                     decoration: BoxDecoration(
                                        color: colors2[index],
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                        color: colorsForBorder2[index],  // Border color
                                        width: 1,  // Border width
                                      ),
                                      ),
                                       child: Center(child: Text((index + 1).toString(),  style: TextStyle(
                                       color: selectedIndex2 == (index + 1) ? Colors.white : colorsForBorder2[index],  // Change text color based on selection
                                      ),)),
                                    ),
                                     Expanded(child: Text(texts[index],style: TextStyle(fontSize: 8.sp,color: colorsForBorder[index]),))
                       
                                  ],
                                ),
                              );
                            },
                          ),
                                             ),
                       ),

                      //!

                      // Container(
                      //   padding: const EdgeInsets.all(5),
                      //   decoration: dropDownBorder,
                      //   child: DropdownButtonHideUnderline(
                      //     child: DropdownButton(
                      //       hint: Padding(
                      //         padding: const EdgeInsets.all(10.0),
                      //         child: const Text("Select"),
                      //       ),
                      //       isExpanded: true,
                      //       value: _outweighsAnxiety,
                      //       icon: const Icon(Icons.keyboard_arrow_down),
                      //       items: _items.map((String items) {
                      //         return DropdownMenuItem(
                      //           value: items,
                      //           child: Container(
                      //               margin: const EdgeInsets.all(10),
                      //               child: Text(items)),
                      //         );
                      //       }).toList(),
                      //       onChanged: (String? newValue) {
                      //         setState(() {
                      //           _outweighsAnxiety = newValue!;
                      //           outweighsAnxiety = _items.indexOf(newValue);
                      //           print(outweighsAnxiety);
                      //           print(
                      //               "_outweighsAnxiety ===> $_outweighsAnxiety");
                      //           Provider.of<StorageProvider>(context,
                      //                   listen: false)
                      //               .audioSpeak("\"I feel hopeful\"");
                      //         });
                      //       },
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 15.h),
                      //
                       Visibility(
                        visible: selectedIndex2!=null?true:false,
                        child: Text(
                          getTranslated("i_feel_hopeful", context),
                          style: TextStyles.smallBoldTextStyle(context),
                        ),
                      ),

                         Visibility(
                        visible: selectedIndex2!=null?true:false,
                          child: SizedBox(
                          height: 80.h,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemExtent: 57.w,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                   HapticFeedback.vibrate();
                                  setState(() {
                                    setColorsinIndex3(index, context);
                                     selectedIndex3 = (index + 1);
                        
                                     _iFeelHopeful = _items[index]; //array 1st item
                                      iFeelHopeful = _items.indexOf(_iFeelHopeful as String);
                                      print(iFeelHopeful.toString());
                                       Provider.of<StorageProvider>(context, listen: false).audioSpeak("\"Hope improves the quality of my life\"");
                                      // storeValues.changeHopeImportant(_outweighsAnxiety);
                                  });
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 30,
                                     decoration: BoxDecoration(
                                        color: colors3[index],
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                        color: colorsForBorder3[index],  // Border color
                                        width: 1,  // Border width
                                      ),
                                      ),
                                       child: Center(child: Text((index + 1).toString(),  style: TextStyle(
                                       color: selectedIndex3 == (index + 1) ? Colors.white : colorsForBorder3[index],  // Change text color based on selection
                                      ),)),
                                    ),
                        
                                   Expanded(child: Text(texts[index],style: TextStyle(fontSize: 8.sp,color: colorsForBorder[index]),))
                        
                                  ],
                                ),
                              );
                            },
                          ),
                                              ),
                        ),

                      //!

                      // Container(
                      //   padding: const EdgeInsets.all(5),
                      //   decoration: dropDownBorder,
                      //   child: DropdownButtonHideUnderline(
                      //     child: DropdownButton(
                      //       hint: Padding(
                      //         padding: const EdgeInsets.all(10.0),
                      //         child: const Text("Select"),
                      //       ),
                      //       isExpanded: true,
                      //       value: _iFeelHopeful,
                      //       icon: const Icon(Icons.keyboard_arrow_down),
                      //       items: _items.map((String items) {
                      //         return DropdownMenuItem(
                      //           value: items,
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(10.0),
                      //             child: Text(items),
                      //           ),
                      //         );
                      //       }).toList(),
                      //       onChanged: (String? newValue) {
                      //         setState(() {
                      //           _iFeelHopeful = newValue!;
                      //           iFeelHopeful = _items.indexOf(newValue);
                      //           print(iFeelHopeful);
                      //           print("_iFeelHopeful ===> $_iFeelHopeful");
                      //           Provider.of<StorageProvider>(context,
                      //                   listen: false)
                      //               .audioSpeak(
                      //                   "\"Hope improves the quality of my life\"");
                      //         });
                      //       },
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 15.h),

                      //!================================================================================= 4 ===============================
                       Visibility(
                        visible: selectedIndex3!=null?true:false,
                        child: Text(
                          getTranslated("hope_improves", context),
                          style: TextStyles.smallBoldTextStyle(context),
                        ),
                      ),


                        Visibility(
                        visible: selectedIndex3!=null?true:false,
                         child: SizedBox(
                          height: 80.h,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemExtent: 57.w,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                   HapticFeedback.vibrate();
                                  setState(() {
                                    setColorsinIndex4(index, context);
                                     selectedIndex4 = (index + 1);
                       
                                     _hopeImproveQuality = _items[index]; //array 1st item
                                      print("now selected ===> $_hopeImproveQuality");
                                      hopeImproveQuality = _items.indexOf(_hopeImproveQuality as String);
                                      print(hopeImproveQuality.toString());
                                       Provider.of<StorageProvider>(context, listen: false).audioSpeak("\"I hopeful with regards to my life\"");
                                      // storeValues.changeHopeImportant(_outweighsAnxiety);
                                  });
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 30,
                                     decoration: BoxDecoration(
                                        color: colors4[index],
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                        color: colorsForBorder4[index],  // Border color
                                        width: 1,  // Border width
                                      ),
                                      ),
                                       child: Center(child: Text((index + 1).toString(),  style: TextStyle(
                                       color: selectedIndex4 == (index + 1) ? Colors.white : colorsForBorder4[index],  // Change text color based on selection
                                      ),)),
                                    ),
                                    Expanded(child: Text(texts[index],style: TextStyle(fontSize: 8.sp,color: colorsForBorder[index]),))
                       
                                  ],
                                ),
                              );
                            },
                          ),
                                             ),
                       ),


                      // Container(
                      //   padding: const EdgeInsets.all(5),
                      //   decoration: dropDownBorder,
                      //   child: DropdownButtonHideUnderline(
                      //     child: DropdownButton(
                      //       hint: Padding(
                      //         padding: const EdgeInsets.all(10.0),
                      //         child: const Text("Select"),
                      //       ),
                      //       isExpanded: true,
                      //       value: _hopeImproveQuality,
                      //       icon: const Icon(Icons.keyboard_arrow_down),
                      //       items: _items.map((String items) {
                      //         return DropdownMenuItem(
                      //           value: items,
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(10.0),
                      //             child: Text(items),
                      //           ),
                      //         );
                      //       }).toList(),
                      //       onChanged: (String? newValue) {
                      //         setState(() {
                      //           _hopeImproveQuality = newValue!;
                      //           print("now selected ===> $_hopeImproveQuality");
                      //           hopeImproveQuality = _items.indexOf(newValue);
                      //           print(hopeImproveQuality);
                      //           Provider.of<StorageProvider>(context,
                      //                   listen: false)
                      //               .audioSpeak(
                      //                   "\"I hopeful with regards to my life\"");
                      //         });
                      //       },
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 15.h),

                      //
                       Visibility(
                        visible: selectedIndex4!=null?true:false,
                        child: Text(
                          getTranslated("i_am_hopeful", context),
                          style: TextStyles.smallBoldTextStyle(context),
                        ),
                      ),

                        Visibility(
                        visible: selectedIndex4!=null?true:false,
                          child: SizedBox(
                          height: 80.h,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemExtent: 57.w,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                   HapticFeedback.vibrate();
                                  setState(() {
                                    setColorsinIndex5(index, context);
                                     selectedIndex5 = (index + 1);
                        
                                     _hopefulWithRegards = _items[index]; //array 1st item
                                      print("now selected ===> $_hopefulWithRegards");
                                      hopefulWithRegards = _items.indexOf(_hopeImproveQuality as String);
                                      print(hopefulWithRegards.toString());
                                       Provider.of<StorageProvider>(context, listen: false).audioSpeak("\"My hopes are ususally fulfilled\"");
                                      // storeValues.changeHopeImportant(_outweighsAnxiety);
                                  });
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 30,
                                     decoration: BoxDecoration(
                                        color: colors5[index],
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                        color: colorsForBorder5[index],  // Border color
                                        width: 1,  // Border width
                                      ),
                                      ),
                                       child: Center(child: Text((index + 1).toString(),  style: TextStyle(
                                       color: selectedIndex5 == (index + 1) ? Colors.white : colorsForBorder5[index],  // Change text color based on selection
                                      ),)),
                                    ),
                                    Expanded(child: Text(texts[index],style: TextStyle(fontSize: 8.sp,color: colorsForBorder[index]),))
                        
                                  ],
                                ),
                              );
                            },
                          ),
                                              ),
                        ),


                      // Container(
                      //   padding: const EdgeInsets.all(5),
                      //   decoration: dropDownBorder,
                      //   child: DropdownButtonHideUnderline(
                      //     child: DropdownButton(
                      //       hint: Padding(
                      //         padding: const EdgeInsets.all(10.0),
                      //         child: Text("Select"),
                      //       ),
                      //       isExpanded: true,
                      //       value: _hopefulWithRegards,
                      //       icon: const Icon(Icons.keyboard_arrow_down),
                      //       items: _items.map((String items) {
                      //         return DropdownMenuItem(
                      //           value: items,
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(10.0),
                      //             child: Text(items),
                      //           ),
                      //         );
                      //       }).toList(),
                      //       onChanged: (String? newValue) {
                      //         setState(() {
                      //           _hopefulWithRegards = newValue!.toString();
                      //           print("now selected ===> $_hopefulWithRegards");
                      //           hopefulWithRegards = _items.indexOf(newValue);
                      //           print(hopefulWithRegards);
                      //           Provider.of<StorageProvider>(context,
                      //                   listen: false)
                      //               .audioSpeak(
                      //                   "\"My hopes are ususally fulfilled\"");
                      //         });
                      //       },
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 15.h),

                      //
                       Visibility(
                        visible: selectedIndex5!=null?true:false,
                        child: Text(
                          getTranslated("my_hope_usually", context),
                          style: TextStyles.smallBoldTextStyle(context),
                        ),
                      ),

                        Visibility(
                        visible: selectedIndex5!=null?true:false,
                         child: SizedBox(
                          height: 80.h,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemExtent: 57.w,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                   HapticFeedback.vibrate();
                                  setState(() {
                                    setColorsinIndex6(index, context);
                                     selectedIndex6 = (index + 1);
                       
                                     _myHopesFulfilled = _items[index]; //array 1st item
                                      print("now selected ===> $_myHopesFulfilled");
                                      myHopesFulfilled = _items.indexOf(_myHopesFulfilled as String);
                                      print(myHopesFulfilled.toString());
                                       Provider.of<StorageProvider>(context, listen: false).audioSpeak("\"Even in difficult times I am able to remain hopeful\"");
                                      // storeValues.changeHopeImportant(_outweighsAnxiety);
                                  });
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 30,
                                     decoration: BoxDecoration(
                                        color: colors6[index],
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                        color: colorsForBorder6[index],  // Border color
                                        width: 1,  // Border width
                                      ),
                                      ),
                                       child: Center(child: Text((index + 1).toString(),  style: TextStyle(
                                       color: selectedIndex6 == (index + 1) ? Colors.white : colorsForBorder6[index],  // Change text color based on selection
                                      ),)),
                                    ),
                                 Expanded(child: Text(texts[index],style: TextStyle(fontSize: 8.sp,color: colorsForBorder[index]),))
                       
                                  ],
                                ),
                              );
                            },
                          ),
                                             ),
                       ),


                      // Container(
                      //   padding: const EdgeInsets.all(5),
                      //   decoration: dropDownBorder,
                      //   child: DropdownButtonHideUnderline(
                      //     child: DropdownButton(
                      //       hint: Padding(
                      //         padding: const EdgeInsets.all(10.0),
                      //         child: const Text("Select"),
                      //       ),
                      //       isExpanded: true,
                      //       value: _myHopesFulfilled,
                      //       icon: const Icon(Icons.keyboard_arrow_down),
                      //       items: _items.map((String items) {
                      //         return DropdownMenuItem(
                      //           value: items,
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(10.0),
                      //             child: Text(items),
                      //           ),
                      //         );
                      //       }).toList(),
                      //       onChanged: (String? newValue) {
                      //         setState(() {
                      //           _myHopesFulfilled = newValue!;
                      //           print("now selected ===> $_myHopesFulfilled");
                      //           myHopesFulfilled = _items.indexOf(newValue);
                      //           print(myHopesFulfilled);
                      //           Provider.of<StorageProvider>(context,
                      //                   listen: false)
                      //               .audioSpeak(
                      //                   "\"Even in difficult times I am able to remain hopeful\"");
                      //         });
                      //       },
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 15.h),

                      //
                       Visibility(
                        visible: selectedIndex6!=null?true:false,
                        child: Text(
                          getTranslated("evenin_difficult_time", context),
                          style: TextStyles.smallBoldTextStyle(context),
                        ),
                      ),



                       Visibility(
                        visible: selectedIndex6!=null?true:false,
                        child: SizedBox(
                          height: 80.h,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemExtent: 57.w,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                   HapticFeedback.vibrate();
                                  setState(() {
                                    setColorsinIndex7(index, context);
                                     selectedIndex7 = (index + 1);
                      
                                     _remainHopeful = _items[index]; //array 1st item
                                      print("now selected ===> $_remainHopeful");
                                      remainHopeful = _items.indexOf(_remainHopeful as String);
                                      print(remainHopeful.toString());
                                      print(remainHopeful);
                                      // storeValues.changeHopeImportant(_outweighsAnxiety);
                                  });
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 30,
                                     decoration: BoxDecoration(
                                        color: colors7[index],
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                        color: colorsForBorder7[index],  // Border color
                                        width: 1,  // Border width
                                      ),
                                      ),
                                       child: Center(child: Text((index + 1).toString(),  style: TextStyle(
                                       color: selectedIndex7 == (index + 1) ? Colors.white : colorsForBorder7[index],  // Change text color based on selection
                                      ),)),
                                    ),
                                    Expanded(child: Text(texts[index],style: TextStyle(fontSize: 8.sp,color: colorsForBorder[index]),))
                      
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),



                      // Container(
                      //   padding: const EdgeInsets.all(5),
                      //   decoration: dropDownBorder,
                      //   child: DropdownButtonHideUnderline(
                      //     child: DropdownButton(
                      //       hint: Padding(
                      //         padding: const EdgeInsets.all(10.0),
                      //         child: const Text("Select"),
                      //       ),
                      //       isExpanded: true,
                      //       value: _remainHopeful,
                      //       icon: const Icon(Icons.keyboard_arrow_down),
                      //       items: _items.map((String items) {
                      //         return DropdownMenuItem(
                      //           value: items,
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(10.0),
                      //             child: Text(items),
                      //           ),
                      //         );
                      //       }).toList(),
                      //       onChanged: (String? newValue) {
                      //         setState(() {
                      //           _remainHopeful = newValue!;
                      //           print("now selected ===> $_remainHopeful");
                      //           remainHopeful = _items.indexOf(newValue);
                      //           print(remainHopeful);
                      //         });
                      //       },
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 15.h),
                      //
                       Visibility(
                        visible: selectedIndex6!=null?true:false,
                        child: PrimaryButton(
                          title: getTranslated("continue", context),
                          onPressed: () {
                            setState(() {
                              // goPage(context, const QuizResult());
                      
                              final quesResProvider =
                                  Provider.of<QuesResProvider>(context,
                                      listen: false);
                              //!############### DropDown Validation
                              if (_hopeisImportant != null &&
                                  _outweighsAnxiety != null &&
                                  _iFeelHopeful != null &&
                                  _hopeImproveQuality != null &&
                                  _hopefulWithRegards != null &&
                                  _myHopesFulfilled != null &&
                                  _remainHopeful != null) {
                                Provider.of<StorageProvider>(context,
                                        listen: false)
                                    .registrationSafetyNet(route: QuizResult.id);
                                quesResProvider.quizResponse(
                                    option1: _hopeisImportant ?? "null",
                                    option2: _outweighsAnxiety ?? "null",
                                    option3: _iFeelHopeful ?? "null",
                                    option4: _hopeImproveQuality ?? "null",
                                    option5: _hopefulWithRegards ?? "null",
                                    option6: _myHopesFulfilled ?? "null",
                                    option7: _remainHopeful ?? "null",
                                    context: context);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      elevation: 0,
                                      title: Center(
                                        child: Text(
                                          getTranslated(
                                              "missing_Fields", context),
                                          style:
                                              TextStyles.boldTextStyle(context),
                                        ),
                                      ),
                                      content: Text(
                                        getTranslated(
                                            "one_or_more_required_field",
                                            context),
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: [
                                        Column(
                                          children: [
                                            const Divider(
                                              height: 1.0,
                                              thickness: 0.5,
                                              color: Colors.grey,
                                            ),
                                            IntrinsicHeight(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(getTranslated(
                                                    "contine", context)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                      
                              int totalScore = hopeIsImportant +
                                  outweighsAnxiety +
                                  iFeelHopeful +
                                  hopeImproveQuality +
                                  hopefulWithRegards +
                                  myHopesFulfilled +
                                  remainHopeful;
                              storeValues.updateQuizScore(totalScore);
                              print("total score ===>>> $totalScore");
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      }),
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
    Color(0xffDEB988),
    Color(0xff67C23A),
    Color(0xffE6A23C),
    Color(0xffF56C6C),
    Color(0xff909399),
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
        colors[1] = Color(0xffDEB988);
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
        colors[2] = Color(0xff67C23A);
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
        colors[3] = Color(0xffE6A23C);
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
        colors[4] = Color(0xffF56C6C);
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
        colors[5] = Color(0xff909399);
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
    } 
  }
//!==========================================================================================================================



 List<Color> colors2 = [
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
    Color(0xffDEB988),
    Color(0xff67C23A),
    Color(0xffE6A23C),
    Color(0xffF56C6C),
    Color(0xff909399),
  ];
  setColorsinIndex2(index, BuildContext context) {
    if (index == 0) {
      setState(() {
        colors2[0] = Color(0xffB50000);
        colors2[1] = Colors.white;
        colors2[2] = Colors.white;
        colors2[3] = Colors.white;
        colors2[4] = Colors.white;
        colors2[5] = Colors.white;
        colors2[6] = Colors.white;
        colors2[7] = Colors.white;
        colors2[8] = Colors.white;
        colors2[9] = Colors.white;
      });
    } else if (index == 1) {
      setState(() {
        colors2[0] = Colors.white;
         colors2[1] = Color(0xffDEB988);
        colors2[2] = Colors.white;
        colors2[3] = Colors.white;
        colors2[4] = Colors.white;
        colors2[5] = Colors.white;
        colors2[6] = Colors.white;
        colors2[7] = Colors.white;
        colors2[8] = Colors.white;
        colors2[9] = Colors.white;
      });
    } else if (index == 2) {
      setState(() {
        colors2[0] = Colors.white;
        colors2[1] = Colors.white;
         colors2[2] = Color(0xff67C23A);
        colors2[3] = Colors.white;
        colors2[4] = Colors.white;
        colors2[5] = Colors.white;
        colors2[6] = Colors.white;
        colors2[7] = Colors.white;
        colors2[8] = Colors.white;
        colors2[9] = Colors.white;
      });
    } else if (index == 3) {
      setState(() {
        colors2[0] = Colors.white;
        colors2[1] = Colors.white;
        colors2[2] = Colors.white;
        colors2[3] = Color(0xFFEFDCC4);
        colors2[4] = Colors.white;
        colors2[5] = Colors.white;
        colors2[6] = Colors.white;
        colors2[7] = Colors.white;
        colors2[8] = Colors.white;
        colors2[9] = Colors.white;
      });
    } else if (index == 4) {
      setState(() {
        colors2[0] = Colors.white;
        colors2[1] = Colors.white;
        colors2[2] = Colors.white;
        colors2[3] = Colors.white;
         colors2[4] = Color(0xffF56C6C);
        colors2[5] = Colors.white;
        colors2[6] = Colors.white;
        colors2[7] = Colors.white;
        colors2[8] = Colors.white;
        colors2[9] = Colors.white;
      });
    } else if (index == 5) {
      setState(() {
        colors2[0] = Colors.white;
        colors2[1] = Colors.white;
        colors2[2] = Colors.white;
        colors2[3] = Colors.white;
        colors2[4] = Colors.white;
         colors2[5] = Color(0xff909399);
        colors2[6] = Colors.white;
        colors2[7] = Colors.white;
        colors2[8] = Colors.white;
        colors2[9] = Colors.white;
      });
    } else if (index == 6) {
      setState(() {
        colors2[0] = Colors.white;
        colors2[1] = Colors.white;
        colors2[2] = Colors.white;
        colors2[3] = Colors.white;
        colors2[4] = Colors.white;
        colors2[5] = Colors.white;
        colors2[6] = Color(0xffE6A23C);
        colors2[7] = Colors.white;
        colors2[8] = Colors.white;
        colors2[9] = Colors.white;
      });
    } 
  }
//!==========================================================================================================================


List<Color> colors3 = [
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
    Color(0xffDEB988),
    Color(0xff67C23A),
    Color(0xffE6A23C),
    Color(0xffF56C6C),
    Color(0xff909399),
  ];
  setColorsinIndex3(index, BuildContext context) {
    if (index == 0) {
      setState(() {
        colors3[0] = Color(0xffB50000);
        colors3[1] = Colors.white;
        colors3[2] = Colors.white;
        colors3[3] = Colors.white;
        colors3[4] = Colors.white;
        colors3[5] = Colors.white;
        colors3[6] = Colors.white;
        colors3[7] = Colors.white;
        colors3[8] = Colors.white;
        colors3[9] = Colors.white;
      });
    } else if (index == 1) {
      setState(() {
        colors3[0] = Colors.white;
        colors3[1] = Color(0xffDEB988);
        colors3[2] = Colors.white;
        colors3[3] = Colors.white;
        colors3[4] = Colors.white;
        colors3[5] = Colors.white;
        colors3[6] = Colors.white;
        colors3[7] = Colors.white;
        colors3[8] = Colors.white;
        colors3[9] = Colors.white;
      });
    } else if (index == 2) {
      setState(() {
        colors3[0] = Colors.white;
        colors3[1] = Colors.white;
        colors3[2] = Color(0xff67C23A);
        colors3[3] = Colors.white;
        colors3[4] = Colors.white;
        colors3[5] = Colors.white;
        colors3[6] = Colors.white;
        colors3[7] = Colors.white;
        colors3[8] = Colors.white;
        colors3[9] = Colors.white;
      });
    } else if (index == 3) {
      setState(() {
        colors3[0] = Colors.white;
        colors3[1] = Colors.white;
        colors3[2] = Colors.white;
        colors3[3] = Color(0xffE6A23C);
        colors3[4] = Colors.white;
        colors3[5] = Colors.white;
        colors3[6] = Colors.white;
        colors3[7] = Colors.white;
        colors3[8] = Colors.white;
        colors3[9] = Colors.white;
      });
    } else if (index == 4) {
      setState(() {
        colors3[0] = Colors.white;
        colors3[1] = Colors.white;
        colors3[2] = Colors.white;
        colors3[3] = Colors.white;
        colors3[4] = Color(0xffF56C6C);
        colors3[5] = Colors.white;
        colors3[6] = Colors.white;
        colors3[7] = Colors.white;
        colors3[8] = Colors.white;
        colors3[9] = Colors.white;
      });
    } else if (index == 5) {
      setState(() {
        colors3[0] = Colors.white;
        colors3[1] = Colors.white;
        colors3[2] = Colors.white;
        colors3[3] = Colors.white;
        colors3[4] = Colors.white;
        colors3[5] = Color(0xff909399);
        colors3[6] = Colors.white;
        colors3[7] = Colors.white;
        colors3[8] = Colors.white;
        colors3[9] = Colors.white;
      });
    } else if (index == 6) {
      setState(() {
        colors3[0] = Colors.white;
        colors3[1] = Colors.white;
        colors3[2] = Colors.white;
        colors3[3] = Colors.white;
        colors3[4] = Colors.white;
        colors3[5] = Colors.white;
        colors3[6] = Color(0xffE6A23C);
        colors3[7] = Colors.white;
        colors3[8] = Colors.white;
        colors3[9] = Colors.white;
      });
    } 
  }
//!==========================================================================================================================



List<Color> colors4 = [
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
   List<Color> colorsForBorder4 = [
    Color(0xffB50000),
    Color(0xffDEB988),
    Color(0xff67C23A),
    Color(0xffE6A23C),
    Color(0xffF56C6C),
    Color(0xff909399),
  ];
  setColorsinIndex4(index, BuildContext context) {
    if (index == 0) {
      setState(() {
        colors4[0] = Color(0xffB50000);
        colors4[1] = Colors.white;
        colors4[2] = Colors.white;
        colors4[3] = Colors.white;
        colors4[4] = Colors.white;
        colors4[5] = Colors.white;
        colors4[6] = Colors.white;
        colors4[7] = Colors.white;
        colors4[8] = Colors.white;
        colors4[9] = Colors.white;
      });
    } else if (index == 1) {
      setState(() {
        colors4[0] = Colors.white;
        colors4[1] = Color(0xffDEB988);
        colors4[2] = Colors.white;
        colors4[3] = Colors.white;
        colors4[4] = Colors.white;
        colors4[5] = Colors.white;
        colors4[6] = Colors.white;
        colors4[7] = Colors.white;
        colors4[8] = Colors.white;
        colors4[9] = Colors.white;
      });
    } else if (index == 2) {
      setState(() {
        colors4[0] = Colors.white;
        colors4[1] = Colors.white;
        colors4[2] = Color(0xff67C23A);
        colors4[3] = Colors.white;
        colors4[4] = Colors.white;
        colors4[5] = Colors.white;
        colors4[6] = Colors.white;
        colors4[7] = Colors.white;
        colors4[8] = Colors.white;
        colors4[9] = Colors.white;
      });
    } else if (index == 3) {
      setState(() {
        colors4[0] = Colors.white;
        colors4[1] = Colors.white;
        colors4[2] = Colors.white;
        colors4[3] = Color(0xffE6A23C);
        colors4[4] = Colors.white;
        colors4[5] = Colors.white;
        colors4[6] = Colors.white;
        colors4[7] = Colors.white;
        colors4[8] = Colors.white;
        colors4[9] = Colors.white;
      });
    } else if (index == 4) {
      setState(() {
        colors4[0] = Colors.white;
        colors4[1] = Colors.white;
        colors4[2] = Colors.white;
        colors4[3] = Colors.white;
        colors4[4] = Color(0xffF56C6C);
        colors4[5] = Colors.white;
        colors4[6] = Colors.white;
        colors4[7] = Colors.white;
        colors4[8] = Colors.white;
        colors4[9] = Colors.white;
      });
    } else if (index == 5) {
      setState(() {
        colors4[0] = Colors.white;
        colors4[1] = Colors.white;
        colors4[2] = Colors.white;
        colors4[3] = Colors.white;
        colors4[4] = Colors.white;
        colors4[5] = Color(0xff909399);
        colors4[6] = Colors.white;
        colors4[7] = Colors.white;
        colors4[8] = Colors.white;
        colors4[9] = Colors.white;
      });
    } else if (index == 6) {
      setState(() {
        colors4[0] = Colors.white;
        colors4[1] = Colors.white;
        colors4[2] = Colors.white;
        colors4[3] = Colors.white;
        colors4[4] = Colors.white;
        colors4[5] = Colors.white;
        colors4[6] = Color(0xffE6A23C);
        colors4[7] = Colors.white;
        colors4[8] = Colors.white;
        colors4[9] = Colors.white;
      });
    }
  }
//!==========================================================================================================================





List<Color> colors5 = [
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
   List<Color> colorsForBorder5 = [
    Color(0xffB50000),
    Color(0xffDEB988),
    Color(0xff67C23A),
    Color(0xffE6A23C),
    Color(0xffF56C6C),
    Color(0xff909399),
  ];
  setColorsinIndex5(index, BuildContext context) {
    if (index == 0) {
      setState(() {
        colors5[0] = Color(0xffB50000);
        colors5[1] = Colors.white;
        colors5[2] = Colors.white;
        colors5[3] = Colors.white;
        colors5[4] = Colors.white;
        colors5[5] = Colors.white;
        colors5[6] = Colors.white;
        colors5[7] = Colors.white;
        colors5[8] = Colors.white;
        colors5[9] = Colors.white;
      });
    } else if (index == 1) {
      setState(() {
        colors5[0] = Colors.white;
        colors5[1] = Color(0xffDEB988);
        colors5[2] = Colors.white;
        colors5[3] = Colors.white;
        colors5[4] = Colors.white;
        colors5[5] = Colors.white;
        colors5[6] = Colors.white;
        colors5[7] = Colors.white;
        colors5[8] = Colors.white;
        colors5[9] = Colors.white;
      });
    } else if (index == 2) {
      setState(() {
        colors5[0] = Colors.white;
        colors5[1] = Colors.white;
        colors5[2] = Color(0xff67C23A);
        colors5[3] = Colors.white;
        colors5[4] = Colors.white;
        colors5[5] = Colors.white;
        colors5[6] = Colors.white;
        colors5[7] = Colors.white;
        colors5[8] = Colors.white;
        colors5[9] = Colors.white;
      });
    } else if (index == 3) {
      setState(() {
        colors5[0] = Colors.white;
        colors5[1] = Colors.white;
        colors5[2] = Colors.white;
        colors5[3] = Color(0xffE6A23C);
        colors5[4] = Colors.white;
        colors5[5] = Colors.white;
        colors5[6] = Colors.white;
        colors5[7] = Colors.white;
        colors5[8] = Colors.white;
        colors5[9] = Colors.white;
      });
    } else if (index == 4) {
      setState(() {
        colors5[0] = Colors.white;
        colors5[1] = Colors.white;
        colors5[2] = Colors.white;
        colors5[3] = Colors.white;
        colors5[4] = Color(0xffF56C6C);
        colors5[5] = Colors.white;
        colors5[6] = Colors.white;
        colors5[7] = Colors.white;
        colors5[8] = Colors.white;
        colors5[9] = Colors.white;
      });
    } else if (index == 5) {
      setState(() {
        colors5[0] = Colors.white;
        colors5[1] = Colors.white;
        colors5[2] = Colors.white;
        colors5[3] = Colors.white;
        colors5[4] = Colors.white;
        colors5[5] = Color(0xff909399);
        colors5[6] = Colors.white;
        colors5[7] = Colors.white;
        colors5[8] = Colors.white;
        colors5[9] = Colors.white;
      });
    } else if (index == 6) {
      setState(() {
        colors5[0] = Colors.white;
        colors5[1] = Colors.white;
        colors5[2] = Colors.white;
        colors5[3] = Colors.white;
        colors5[4] = Colors.white;
        colors5[5] = Colors.white;
        colors5[6] = Color(0xffE6A23C);
        colors5[7] = Colors.white;
        colors5[8] = Colors.white;
        colors5[9] = Colors.white;
      });
    } 
  }
//!==========================================================================================================================






List<Color> colors6 = [
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
   List<Color> colorsForBorder6 = [
    Color(0xffB50000),
    Color(0xffDEB988),
    Color(0xff67C23A),
    Color(0xffE6A23C),
    Color(0xffF56C6C),
    Color(0xff909399),
  ];
  setColorsinIndex6(index, BuildContext context) {
    if (index == 0) {
      setState(() {
        colors6[0] = Color(0xffB50000);
        colors6[1] = Colors.white;
        colors6[2] = Colors.white;
        colors6[3] = Colors.white;
        colors6[4] = Colors.white;
        colors6[5] = Colors.white;
        colors6[6] = Colors.white;
        colors6[7] = Colors.white;
        colors6[8] = Colors.white;
        colors6[9] = Colors.white;
      });
    } else if (index == 1) {
      setState(() {
        colors6[0] = Colors.white;
        colors6[1] = Color(0xffDEB988);
        colors6[2] = Colors.white;
        colors6[3] = Colors.white;
        colors6[4] = Colors.white;
        colors6[5] = Colors.white;
        colors6[6] = Colors.white;
        colors6[7] = Colors.white;
        colors6[8] = Colors.white;
        colors6[9] = Colors.white;
      });
    } else if (index == 2) {
      setState(() {
        colors6[0] = Colors.white;
        colors6[1] = Colors.white;
        colors6[2] = Color(0xff67C23A);
        colors6[3] = Colors.white;
        colors2[4] = Colors.white;
        colors6[5] = Colors.white;
        colors6[6] = Colors.white;
        colors6[7] = Colors.white;
        colors6[8] = Colors.white;
        colors6[9] = Colors.white;
      });
    } else if (index == 3) {
      setState(() {
        colors6[0] = Colors.white;
        colors6[1] = Colors.white;
        colors6[2] = Colors.white;
        colors6[3] = Color(0xffE6A23C);
        colors6[4] = Colors.white;
        colors6[5] = Colors.white;
        colors6[6] = Colors.white;
        colors6[7] = Colors.white;
        colors6[8] = Colors.white;
        colors6[9] = Colors.white;
      });
    } else if (index == 4) {
      setState(() {
        colors6[0] = Colors.white;
        colors6[1] = Colors.white;
        colors6[2] = Colors.white;
        colors6[3] = Colors.white;
        colors6[4] = Color(0xffF56C6C);
        colors6[5] = Colors.white;
        colors6[6] = Colors.white;
        colors6[7] = Colors.white;
        colors6[8] = Colors.white;
        colors6[9] = Colors.white;
      });
    } else if (index == 5) {
      setState(() {
        colors6[0] = Colors.white;
        colors6[1] = Colors.white;
        colors6[2] = Colors.white;
        colors6[3] = Colors.white;
        colors6[4] = Colors.white;
        colors6[5] = Color(0xff909399);
        colors6[6] = Colors.white;
        colors6[7] = Colors.white;
        colors6[8] = Colors.white;
        colors6[9] = Colors.white;
      });
    } else if (index == 6) {
      setState(() {
        colors6[0] = Colors.white;
        colors6[1] = Colors.white;
        colors6[2] = Colors.white;
        colors6[3] = Colors.white;
        colors6[4] = Colors.white;
        colors6[5] = Colors.white;
        colors6[6] = Color(0xffE6A23C);
        colors6[7] = Colors.white;
        colors6[8] = Colors.white;
        colors6[9] = Colors.white;
      });
    } 
  }
//!==========================================================================================================================











List<Color> colors7 = [
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
   List<Color> colorsForBorder7 = [
     Color(0xffB50000),
    Color(0xffDEB988),
    Color(0xff67C23A),
    Color(0xffE6A23C),
    Color(0xffF56C6C),
    Color(0xff909399),
  ];
  setColorsinIndex7(index, BuildContext context) {
    if (index == 0) {
      setState(() {
        colors7[0] = Color(0xffB50000);
        colors7[1] = Colors.white;
        colors7[2] = Colors.white;
        colors7[3] = Colors.white;
        colors7[4] = Colors.white;
        colors7[5] = Colors.white;
        colors7[6] = Colors.white;
        colors7[7] = Colors.white;
        colors7[8] = Colors.white;
        colors7[9] = Colors.white;
      });
    } else if (index == 1) {
      setState(() {
        colors7[0] = Colors.white;
        colors7[1] = Color(0xffDEB988);
        colors7[2] = Colors.white;
        colors7[3] = Colors.white;
        colors7[4] = Colors.white;
        colors7[5] = Colors.white;
        colors7[6] = Colors.white;
        colors7[7] = Colors.white;
        colors7[8] = Colors.white;
        colors7[9] = Colors.white;
      });
    } else if (index == 2) {
      setState(() {
        colors7[0] = Colors.white;
        colors7[1] = Colors.white;
        colors7[2] = Color(0xff67C23A);
        colors7[3] = Colors.white;
        colors7[4] = Colors.white;
        colors7[5] = Colors.white;
        colors7[6] = Colors.white;
        colors7[7] = Colors.white;
        colors7[8] = Colors.white;
        colors7[9] = Colors.white;
      });
    } else if (index == 3) {
      setState(() {
        colors7[0] = Colors.white;
        colors7[1] = Colors.white;
        colors7[2] = Colors.white;
        colors7[3] = Color(0xffE6A23C);
        colors7[4] = Colors.white;
        colors7[5] = Colors.white;
        colors7[6] = Colors.white;
        colors7[7] = Colors.white;
        colors7[8] = Colors.white;
        colors7[9] = Colors.white;
      });
    } else if (index == 4) {
      setState(() {
        colors7[0] = Colors.white;
        colors7[1] = Colors.white;
        colors7[2] = Colors.white;
        colors7[3] = Colors.white;
        colors7[4] = Color(0xffF56C6C);
        colors7[5] = Colors.white;
        colors7[6] = Colors.white;
        colors7[7] = Colors.white;
        colors7[8] = Colors.white;
        colors7[9] = Colors.white;
      });
    } else if (index == 5) {
      setState(() {
        colors7[0] = Colors.white;
        colors7[1] = Colors.white;
        colors7[2] = Colors.white;
        colors7[3] = Colors.white;
        colors7[4] = Colors.white;
        colors7[5] = Color(0xff909399);
        colors7[6] = Colors.white;
        colors7[7] = Colors.white;
        colors7[8] = Colors.white;
        colors7[9] = Colors.white;
      });
    } else if (index == 6) {
      setState(() {
        colors7[0] = Colors.white;
        colors7[1] = Colors.white;
        colors7[2] = Colors.white;
        colors7[3] = Colors.white;
        colors7[4] = Colors.white;
        colors7[5] = Colors.white;
        colors7[6] = Color(0xffE6A23C);
        colors7[7] = Colors.white;
        colors7[8] = Colors.white;
        colors7[9] = Colors.white;
      });
    } 
  }
//!==========================================================================================================================


}
