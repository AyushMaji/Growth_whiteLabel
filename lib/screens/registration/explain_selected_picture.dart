// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:olga/global/styles/box_decoration.dart';
import 'package:olga/provider/ques_res_provider.dart';
import 'package:provider/provider.dart';
import 'package:olga/global/constants/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/primary_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/registration/select_one_word.dart';

class ExplainSelectedPicture extends StatefulWidget {
  static const String id = "/explainSelectedImage";
  const ExplainSelectedPicture({Key? key}) : super(key: key);

  @override
  State<ExplainSelectedPicture> createState() => _ExplainSelectedPictureState();
}

class _ExplainSelectedPictureState extends State<ExplainSelectedPicture> {
  String? _selectedOneWordDropDown;
  bool showButton = false;

  final List<String> _indexZeroAnxious = [
    'Absorbed',
    'Creative',
    'Curious',
    'Dreamer',
    'Engrossed',
    'Fascinated',
    'Inquisitive',
    'Intrigued',
    'Nosy',
    'None of the above',
  ];

  final List<String> _indexOneBored = [
    'Animated',
    'Courageous',
    'Energetic',
    'Free',
    'Optimistic',
    'Playful',
    'Wonderful',
    'None of the above'
  ];

  final List<String> _indexTwoConfused = [
    'Delighted ',
    'Fortunate',
    'Great',
    'Joyful',
    'Lucky',
    'Overjoyed ',
    'Thankful',
    'None of the above'
  ];

  final List<String> _indexThreeDisorganized = [
    'Affectionate',
    'Comforted',
    'Loved',
    'Loving',
    'Passionate',
    'Warm',
    'None of the above'
  ];

  final List<String> _indexFourEngagedLife = [
    'Confident',
    'Determined',
    'Enthusiastic',
    'Excited',
    'Hopeful',
    'Inspired',
    'Optimistic',
    'None of the above'
  ];

  final List<String> _indexFive = [
    'At Ease',
    'Blessed',
    'Calm',
    'Comfortable',
    'Content',
    'Encouraged',
    'Free & Easy',
    'Peaceful',
    'None of the above'
  ];

  final List<String> _indexSix = [
    'Accepting',
    'Confident',
    'Free',
    'Interesting Life',
    'Kind',
    'Open',
    'Receptive',
    'Understanding',
    'None of the above'
  ];

  final List<String> _indexSeven = [
    'Certain',
    'Dynamic',
    'Free',
    'Rebellious',
    'Secure',
    'Sure',
    'Tenacious',
    'Unique',
    'None of the above'
  ];

  final List<String> _indexEight = [
    'Affectionate',
    'Comforted',
    'Loved',
    // 'Loved',
    'Passionate',
    'Warm',
    'Thankful',
    'None of the above'
  ];
  final List<String> _indexNine = [
    'Confident',
    'Comforted',
    'Determined',
    'Enthusiastic',
    'Excited',
    'Hopeful',
    'Inspired',
    'Optimistic',
    'None of the above'
  ];
  final List<String> _indexTen = [
    'Affectionate',
    'At Ease',
    'Blessed',
    'Calm',
    'Comfortable',
    'Content',
    'Encouraged',
    'Free & Easy',
    'Peaceful',
    'None of the above'
  ];
  final List<String> _indexElevenSatisfied = [
    'Accepting',
    'Confident',
    'Free',
    'Interesting Life',
    'Kind',
    'Open',
    'Receptive',
    'Understanding',
    'None of the above'
  ];

  final List<String> _indexTwelveStressed = [
    'A Sense of Loss',
    'Disappointed',
    'Discouraged',
    'Dissatisfied',
    'Miserable',
    'Overloaded',
    'Powerless',
    'None of the above',
  ];
  final List<String> _indexThirteenStrong = [
    'Certain',
    'Dynamic',
    'Free',
    'Rebellious',
    'Secure',
    'Sure ',
    'Tenacious',
    'Unique',
    'None of the above'
  ];
  final List<String> _indexFourtheenUnhappy = [
    'Depressed',
    'Down & Out',
    'Let Down',
    'Lonely',
    'Pessimistic',
    'Sad',
    'None of the above'
  ];
  final List<String> _indexFifteenUpset = [
    'Annoyed',
    'Bitter',
    'Cross',
    'Irrittated',
    'Resentful',
    'Upset',
    'None of the above'
  ];

  final List _imageName = [
    Images.row1Icon1,
    Images.row1Icon2,
    Images.row1Icon3,
    Images.row1Icon4,
    Images.row2Icon1,
    Images.row2Icon2,
    Images.row2Icon3,
    Images.row2Icon4,
    Images.row3Icon1,
    Images.row3Icon2,
    Images.row3Icon3,
    Images.row3Icon4,
    Images.row4Icon1,
    Images.row4Icon2,
    Images.row4Icon3,
    Images.row4Icon4,
  ];


      @override
  void initState(){
     super.initState();
     Provider.of<StorageProvider>(context, listen: false).audioSpeak("Use the free text box below to type a statement that describes what you feel when you look at this picture.");
  }

  @override
  Widget build(BuildContext context) {
    StorageProvider storeValues =
        Provider.of<StorageProvider>(context, listen: false);
    int oneWordIndex = storeValues.selectOneWord;
    print(oneWordIndex);

    //
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context)
            .unfocus(), //!##### By  tapping anywhere on screen keyboard will hide.
        child: SingleChildScrollView(
          child: Container(
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
                          getTranslated('use_the_free_text', context),
                          style: TextStyles.smallBoldTextStyle(context),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                //
               /*  Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    getTranslated('this_section_optional', context),
                    textAlign: TextAlign.start,
                  ),
                ), */
                SizedBox(
                  height: 85.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: FocusScope(
                          onFocusChange: (value) {
                                if (!value) {Provider.of<StorageProvider>(context, listen: false).audioSpeak("Choose one word from the list below that best captures what you have described above.");

                                }
                              },
                          
                          child: TextFormField(
                            //expands: true,
                            maxLines: 3,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFFDEB988), width: 2.0),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              helperMaxLines: 4,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xffB50000).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                              color: const Color(0xffB50000), width: 0.5),
                        ),
                        child:ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            _imageName[storeValues.chooseOnePicture],
                            width: 57.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),

                //
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
                          getTranslated('choose_one_word', context),
                          style: TextStyles.smallBoldTextStyle(context),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),

                //
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: dropDownBorder,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Select"),
                      ),
                      isExpanded: true,
                      value: _selectedOneWordDropDown,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: oneWordIndex == 0 //
                          ? _indexZeroAnxious.map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Text(value),
                                ),
                              );
                            }).toList()
                          : oneWordIndex == 1 //
                              ? _indexOneBored.map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      child: Text(value),
                                    ),
                                  );
                                }).toList()
                              : oneWordIndex == 2 //
                                  ? _indexTwoConfused.map((String value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Container(
                                          margin: const EdgeInsets.all(10),
                                          child: Text(value),
                                        ),
                                      );
                                    }).toList()
                                  : oneWordIndex == 3 //
                                      ? _indexThreeDisorganized
                                          .map((String value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Container(
                                              margin: const EdgeInsets.all(10),
                                              child: Text(value),
                                            ),
                                          );
                                        }).toList()
                                      : oneWordIndex == 4 //
                                          ? _indexFourEngagedLife
                                              .map((String value) {
                                              return DropdownMenuItem(
                                                value: value,
                                                child: Container(
                                                  margin:
                                                      const EdgeInsets.all(10),
                                                  child: Text(value),
                                                ),
                                              );
                                            }).toList()
                                          : oneWordIndex == 5 //
                                              ? _indexFive.map((String value) {
                                                  return DropdownMenuItem(
                                                    value: value,
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Text(value),
                                                    ),
                                                  );
                                                }).toList()
                                              : oneWordIndex == 6 //
                                                  ? _indexSix
                                                      .map((String value) {
                                                      return DropdownMenuItem(
                                                        value: value,
                                                        child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          child: Text(value),
                                                        ),
                                                      );
                                                    }).toList()
                                                  : oneWordIndex == 7 //
                                                      ? _indexSeven
                                                          .map((String value) {
                                                          return DropdownMenuItem(
                                                            value: value,
                                                            child: Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .all(10),
                                                              child:
                                                                  Text(value),
                                                            ),
                                                          );
                                                        }).toList()
                                                      : oneWordIndex == 8 //
                                                          ? _indexEight.map(
                                                              (String value) {
                                                              return DropdownMenuItem(
                                                                value: value,
                                                                child:
                                                                    Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .all(10),
                                                                  child: Text(
                                                                      value),
                                                                ),
                                                              );
                                                            }).toList()
                                                          : oneWordIndex == 9 //
                                                              ? _indexNine.map(
                                                                  (String
                                                                      value) {
                                                                  return DropdownMenuItem(
                                                                    value:
                                                                        value,
                                                                    child:
                                                                        Container(
                                                                      margin:
                                                                          const EdgeInsets.all(
                                                                              10),
                                                                      child: Text(
                                                                          value),
                                                                    ),
                                                                  );
                                                                }).toList()
                                                              : oneWordIndex ==
                                                                      10 //
                                                                  ? _indexTen.map(
                                                                      (String
                                                                          value) {
                                                                      return DropdownMenuItem(
                                                                        value:
                                                                            value,
                                                                        child:
                                                                            Container(
                                                                          margin:
                                                                              const EdgeInsets.all(10),
                                                                          child:
                                                                              Text(value),
                                                                        ),
                                                                      );
                                                                    }).toList()
                                                                  : oneWordIndex ==
                                                                          11 //
                                                                      ? _indexElevenSatisfied.map(
                                                                          (String
                                                                              value) {
                                                                          return DropdownMenuItem(
                                                                            value:
                                                                                value,
                                                                            child:
                                                                                Container(
                                                                              margin: const EdgeInsets.all(10),
                                                                              child: Text(value),
                                                                            ),
                                                                          );
                                                                        }).toList()
                                                                      : oneWordIndex ==
                                                                              12 //
                                                                          ? _indexTwelveStressed.map((String
                                                                              value) {
                                                                              return DropdownMenuItem(
                                                                                value: value,
                                                                                child: Container(
                                                                                  margin: const EdgeInsets.all(10),
                                                                                  child: Text(value),
                                                                                ),
                                                                              );
                                                                            }).toList()
                                                                          : oneWordIndex == 13 //
                                                                              ? _indexThirteenStrong.map((String value) {
                                                                                  return DropdownMenuItem(
                                                                                    value: value,
                                                                                    child: Container(
                                                                                      margin: const EdgeInsets.all(10),
                                                                                      child: Text(value),
                                                                                    ),
                                                                                  );
                                                                                }).toList()
                                                                              : oneWordIndex == 14 //
                                                                                  ? _indexFourtheenUnhappy.map((String value) {
                                                                                      return DropdownMenuItem(
                                                                                        value: value,
                                                                                        child: Container(
                                                                                          margin: const EdgeInsets.all(10),
                                                                                          child: Text(value),
                                                                                        ),
                                                                                      );
                                                                                    }).toList()
                                                                                  : oneWordIndex == 15 //
                                                                                      ? _indexFifteenUpset.map((String value) {
                                                                                          return DropdownMenuItem(
                                                                                            value: value,
                                                                                            child: Container(
                                                                                              margin: const EdgeInsets.all(10),
                                                                                              child: Text(value),
                                                                                            ),
                                                                                          );
                                                                                        }).toList()
                                                                                      : null,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedOneWordDropDown = newValue!;
                          print(
                              "selected word ===>>> $_selectedOneWordDropDown");
                          showButton = true;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Visibility(
        visible: showButton,
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: PrimaryButton(
            title: getTranslated("continue", context),
            onPressed: () {
              setState(() {
                print("selectedOneWordDropDown ===> $_selectedOneWordDropDown");
                               
                    Provider.of<QuesResProvider>(context, listen: false).viewPctureResponse(
                    pictureResponse: _selectedOneWordDropDown ?? "null",
                    context: context);
              });
              Provider.of<StorageProvider>(context, listen: false)
                  .registrationSafetyNet(route: SelectOneWord.id);
                goPageWithName(context, SelectOneWord.id);
            },
          ),
        ),
      ),
    );
  }
}
