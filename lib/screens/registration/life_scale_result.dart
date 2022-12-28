// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables
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
                          text: getTranslated('partof_making_change', context),
                          style: TextStyles.smallBoldTextStyle(context),
                          children: [
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
                              text: getTranslated(
                                  "partof_making_change1", context),
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
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: dropDownBorder,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: const Text("Select"),
                            ),
                            isExpanded: true,
                            value: _hopeisImportant,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: _items.map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Container(
                                  margin: const EdgeInsets.all(10),
                                  child: Text(value),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                _hopeisImportant = newValue!;
                                hopeIsImportant = _items.indexOf(newValue);
                                print(hopeIsImportant);
                                Provider.of<StorageProvider>(context,
                                        listen: false)
                                    .audioSpeak(
                                        "\"In my life, hope outweighs anxiety\"");

                                //StorageProvider quesResProvider = Provider.of<StorageProvider>(context, listen: false);
                                storeValues
                                    .changeHopeImportant(_hopeisImportant);
                              });
                              print("_hopeisImportant ===> $_hopeisImportant");
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      //
                      Text(
                        getTranslated("in_my_life", context),
                        style: TextStyles.smallBoldTextStyle(context),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: dropDownBorder,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: const Text("Select"),
                            ),
                            isExpanded: true,
                            value: _outweighsAnxiety,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: _items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(items)),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _outweighsAnxiety = newValue!;
                                outweighsAnxiety = _items.indexOf(newValue);
                                print(outweighsAnxiety);
                                print(
                                    "_outweighsAnxiety ===> $_outweighsAnxiety");
                                Provider.of<StorageProvider>(context,
                                        listen: false)
                                    .audioSpeak("\"I feel hopeful\"");
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      //
                      Text(
                        getTranslated("i_feel_hopeful", context),
                        style: TextStyles.smallBoldTextStyle(context),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: dropDownBorder,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: const Text("Select"),
                            ),
                            isExpanded: true,
                            value: _iFeelHopeful,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: _items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(items),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _iFeelHopeful = newValue!;
                                iFeelHopeful = _items.indexOf(newValue);
                                print(iFeelHopeful);
                                print("_iFeelHopeful ===> $_iFeelHopeful");
                                Provider.of<StorageProvider>(context,
                                        listen: false)
                                    .audioSpeak(
                                        "\"Hope improves the quality of my life\"");
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),

                      //
                      Text(
                        getTranslated("hope_improves", context),
                        style: TextStyles.smallBoldTextStyle(context),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: dropDownBorder,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: const Text("Select"),
                            ),
                            isExpanded: true,
                            value: _hopeImproveQuality,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: _items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(items),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _hopeImproveQuality = newValue!;
                                print("now selected ===> $_hopeImproveQuality");
                                hopeImproveQuality = _items.indexOf(newValue);
                                print(hopeImproveQuality);
                                Provider.of<StorageProvider>(context,
                                        listen: false)
                                    .audioSpeak(
                                        "\"I hopeful with regards to my life\"");
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),

                      //
                      Text(
                        getTranslated("i_am_hopeful", context),
                        style: TextStyles.smallBoldTextStyle(context),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: dropDownBorder,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Select"),
                            ),
                            isExpanded: true,
                            value: _hopefulWithRegards,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: _items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(items),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _hopefulWithRegards = newValue!.toString();
                                print("now selected ===> $_hopefulWithRegards");
                                hopefulWithRegards = _items.indexOf(newValue);
                                print(hopefulWithRegards);
                                Provider.of<StorageProvider>(context,
                                        listen: false)
                                    .audioSpeak(
                                        "\"My hopes are ususally fulfilled\"");
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),

                      //
                      Text(
                        getTranslated("my_hope_usually", context),
                        style: TextStyles.smallBoldTextStyle(context),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: dropDownBorder,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: const Text("Select"),
                            ),
                            isExpanded: true,
                            value: _myHopesFulfilled,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: _items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(items),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _myHopesFulfilled = newValue!;
                                print("now selected ===> $_myHopesFulfilled");
                                myHopesFulfilled = _items.indexOf(newValue);
                                print(myHopesFulfilled);
                                Provider.of<StorageProvider>(context,
                                        listen: false)
                                    .audioSpeak(
                                        "\"Even in difficult times I am able to remain hopeful\"");
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),

                      //
                      Text(
                        getTranslated("evenin_difficult_time", context),
                        style: TextStyles.smallBoldTextStyle(context),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: dropDownBorder,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: const Text("Select"),
                            ),
                            isExpanded: true,
                            value: _remainHopeful,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: _items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(items),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _remainHopeful = newValue!;
                                print("now selected ===> $_remainHopeful");
                                remainHopeful = _items.indexOf(newValue);
                                print(remainHopeful);
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      //
                      PrimaryButton(
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
}
