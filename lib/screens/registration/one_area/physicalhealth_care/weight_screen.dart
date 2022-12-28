// ignore_for_file: avoid_print, prefer_const_constructors
import 'package:olga/provider/storage_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/constants/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/provider/happy_life_provider.dart';
import 'package:olga/screens/registration/one_area/physicalhealth_care/fitness_screen.dart';
import '../../../../global/widgets/custom_widgets.dart';
import '../../../../localization/language_constrants.dart';

class WeightScreen extends StatefulWidget {
  static const String id = "/weightScreen";
  const WeightScreen({Key? key}) : super(key: key);

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  bool showButton = false;
  bool isButtonActive = true;
  bool absoreTap = false;

  int selectedIndex = 0;

        @override
  void initState() {
    super.initState();
    Provider.of<StorageProvider>(context, listen: false).audioSpeak("Why don't we start by setting a goal for your Physical Health & Self-Care. Before we do that, let's first understand how happy you are with the different aspects of your Physical Health & Self-Care ....... On a scale of 1-10 rate the following ...... Physical Health & Self-Care ..... Are you happy with your level of physcial activity?");
  }

  @override
  Widget build(BuildContext context) {
    //###############################################################
    StorageProvider storageValue =
        Provider.of<StorageProvider>(context, listen: false);
    //###############################################################
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    getTranslated('why_dont_we_start_agoal', context),
                    style: TextStyles.regularBoldTextStyle(context),
                  ),
                ),
                Image.asset(
                  Images.selectedArea2,
                  width: 120.sp,
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
                    getTranslated("on_scale_1_10", context),
                    style: TextStyles.smallBoldTextStyle(context),
                  ),
                  SizedBox(height: 20.sp),
                  Text(
                    getTranslated("physical_health", context),
                    style: TextStyles.smallBoldTextStyle(context),
                  ),
                  SizedBox(height: 10.sp),
                  Text(
                    getTranslated('are_you_happy', context),
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.sp),

            //
            AbsorbPointer(
              absorbing: false,
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
                          setState(() {
                            setColorsinIndex(index, context);
                            storageValue.updateResponse1(index);
                            selectedIndex = index;
                            showButton = true;
                            absoreTap = true;
                          });
                        },
                        child: Card(
                          child: Container(
                            color: colors[index],
                            height: 20,
                            width: 30,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            //
            //! Text((storageValue.weightScaleValue + 1).toString()), //##

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(getTranslated("unsatisfied", context)),
                Text(
                  getTranslated("satisfied", context),
                  textAlign: TextAlign.right,
                ),
              ],
            )
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
                //storageValue.updateWeightScaleValue(selectedIndex);
                goPageWithName(context, FitnessScreen.id);

                print('selected index ===>>> $selectedIndex');
                print('submiteed');
              });
            },
            buttonStyle: ButtonStyles.getCommonStyle(context),
          ),
        ),
      ),
    );
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

  setColorsinIndex(index, BuildContext context) {
    if (index == 0) {
      setState(() {
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
      });
    } else if (index == 1) {
      setState(() {
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
      });
    } else if (index == 2) {
      setState(() {
        colors[index] = Color(0xFFF2E3CF);
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
      });
    } else if (index == 3) {
      setState(() {
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
      });
    } else if (index == 4) {
      setState(() {
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
      });
    } else if (index == 5) {
      setState(() {
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
      });
    } else if (index == 6) {
      setState(() {
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
      });
    } else if (index == 7) {
      setState(() {
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
      });
    } else if (index == 8) {
      setState(() {
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
      });
    } else if (index == 9) {
      setState(() {
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
      });
    }
  }
}
