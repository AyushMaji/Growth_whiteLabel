import 'package:flutter/material.dart';
import 'package:olga/global/widgets/custom_widgets.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/happy_life_provider.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'hobbies_different_areas.dart';
import 'happy_with_enough_time.dart';
import 'happy_with_interest.dart';

class HappyWithEnoughTime extends StatefulWidget {
  static const String id = "/happyWithEnoughTime";
  const HappyWithEnoughTime({Key? key}) : super(key: key);

  @override
  State<HappyWithEnoughTime> createState() => _HappyWithEnoughTimeState();
}

class _HappyWithEnoughTimeState extends State<HappyWithEnoughTime> {
 
  bool isValueGiven = false;
  bool showButton = false;
  bool absoreTap = false;

  int selectedIndex = 0;

  @override
     void initState() {
    super.initState();
    Provider.of<StorageProvider>(context, listen: false).audioSpeak(" On a scale of 1-10 rate the following ...... Hobbies or Recreation or Fun ..... Are you happy that you have enough me time ?");
  }

  @override
  Widget build(BuildContext context) {
    //###############################################################
    StorageProvider storageValue =
        Provider.of<StorageProvider>(context, listen: false);
    //###############################################################
    HappyLifeSurvey happyLifeSurvey =
        Provider.of<HappyLifeSurvey>(context, listen: false);
    //
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.w),
          child: Column(
            children: [
              SizedBox(height: 10.sp),
              Stack(
                children: [
                 Transform(
                        transform: Matrix4.rotationZ(
                            -0.999000), //===============================Transform to rotated the graph
                        alignment: FractionalOffset.center,
                    child: Image.asset(
                      'assets/images/HobbiesRecreationFun.png',
                      //Images.healthCare,
                      width: 260.w,
                    ),
                  ),
                  Positioned(
                      // top: 21,
                      // left: 20.5,
                      top: MediaQuery.of(context).size.height * -0.0,
                      left: MediaQuery.of(context).size.width * -0.0,
                      right: MediaQuery.of(context).size.width * -0.0,
                      bottom: MediaQuery.of(context).size.width * -0.0,
                      child: Transform(
                        transform: Matrix4.rotationZ(
                            -0.999000), //===============================Transform to rotated the graph
                        alignment: FractionalOffset.center,
                        child: Opacity(
                          opacity: 0.5,
                          child: SfCircularChart(
                            palette: <Color>[
                              Color.fromARGB(144, 229, 199, 160),
                              Colors.brown,
                              Colors.green,
                              Colors.redAccent,
                              Colors.blueAccent,
                              Colors.teal
                            ],
                            series: <DoughnutSeries<ChartData, String>>[
                              DoughnutSeries<ChartData, String>(
                                //opacity: 100,
                                radius: '14%',
                                dataSource: <ChartData>[
                                  //===========================================================

                                 ChartData(
                                      'USA',
                                      12,
                                      ((storageValue.response1 + 1)
                                                  .toString() ==
                                              '10')
                                          ? '84.5%'
                                          : (((storageValue.response1 + 1)
                                                      .toString() ==
                                                  '9')
                                              ? '75.5%'
                                              : (((storageValue.response1 + 1)
                                                          .toString() ==
                                                      '8')
                                                  ? '67%'
                                                  : (((storageValue.response1 + 1)
                                                              .toString() ==
                                                          '7')
                                                      ? '59%'
                                                      : (((storageValue.response1 + 1)
                                                                  .toString() ==
                                                              '6')
                                                          ? '52%'
                                                          : (((storageValue.response1 + 1)
                                                                      .toString() ==
                                                                  '5')
                                                              ? '44%'
                                                              : (((storageValue.response1 + 1)
                                                                          .toString() ==
                                                                      '4')
                                                                  ? '37%'
                                                                  : (((storageValue.response1 + 1).toString() ==
                                                                          '3')
                                                                      ? '29%'
                                                                      : (((storageValue.response1 + 1).toString() == '2')
                                                                          ? '22%'
                                                                          : (((storageValue.response1 + 1).toString() == '1')
                                                                              ? '14%'
                                                                              : "0")))))))))),
                                 ChartData(
                                      'USA',
                                      12,
                                      ((storageValue.response2 + 1)
                                                  .toString() ==
                                              '10')
                                          ? '84.5%'
                                          : (((storageValue.response2 + 1)
                                                      .toString() ==
                                                  '9')
                                              ? '75.5%'
                                              : (((storageValue.response2 + 1)
                                                          .toString() ==
                                                      '8')
                                                  ? '67%'
                                                  : (((storageValue.response2 + 1)
                                                              .toString() ==
                                                          '7')
                                                      ? '59%'
                                                      : (((storageValue.response2 + 1)
                                                                  .toString() ==
                                                              '6')
                                                          ? '52%'
                                                          : (((storageValue.response2 + 1)
                                                                      .toString() ==
                                                                  '5')
                                                              ? '44%'
                                                              : (((storageValue.response2 + 1)
                                                                          .toString() ==
                                                                      '4')
                                                                  ? '37%'
                                                                  : (((storageValue.response2 + 1).toString() ==
                                                                          '3')
                                                                      ? '29%'
                                                                      : (((storageValue.response2 + 1).toString() == '2')
                                                                          ? '22%'
                                                                          : (((storageValue.response2 + 1).toString() == '1')
                                                                              ? '14%'
                                                                              : "0")))))))))),
                                  ChartData(
                                      'USA',
                                      12,
                                      ((storageValue.response3 + 1)
                                                  .toString() ==
                                              '10')
                                          ? '84.5%'
                                          : (((storageValue.response3 + 1)
                                                      .toString() ==
                                                  '9')
                                              ? '75.5%'
                                              : (((storageValue.response3 + 1)
                                                          .toString() ==
                                                      '8')
                                                  ? '67%'
                                                  : (((storageValue.response3 + 1)
                                                              .toString() ==
                                                          '7')
                                                      ? '59%'
                                                      : (((storageValue.response3 + 1)
                                                                  .toString() ==
                                                              '6')
                                                          ? '52%'
                                                          : (((storageValue.response3 + 1)
                                                                      .toString() ==
                                                                  '5')
                                                              ? '44%'
                                                              : (((storageValue.response3 + 1)
                                                                          .toString() ==
                                                                      '4')
                                                                  ? '37%'
                                                                  : (((storageValue.response3 + 1).toString() ==
                                                                          '3')
                                                                      ? '29%'
                                                                      : (((storageValue.response3 + 1).toString() == '2')
                                                                          ? '22%'
                                                                          : (((storageValue.response3 + 1).toString() == '1')
                                                                              ? '14%'
                                                                              : "0")))))))))),
                                ],
                                xValueMapper: (ChartData data, _) => data.xVal,
                                yValueMapper: (ChartData data, _) => data.yVal,
                                pointRadiusMapper: (ChartData data, _) =>
                                    data.radius,
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(height: 15.sp),
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
                      getTranslated("hobbies_fun", context),
                      style: TextStyles.smallBoldTextStyle(context),
                    ),
                    SizedBox(height: 10.sp),
                    Text(
                      getTranslated('happy_with_enough_time', context),
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
                              storageValue.updateResponse2(index);  
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
              //!Text((storageValue.fitnessScaleValue + 1).toString()),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(getTranslated("unsatisfied", context)),
                  Text(
                    getTranslated("satisfied", context),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              SizedBox(height: 50.sp),
            ],
          ),
        ),
      ),
      bottomSheet: Visibility(
        visible: showButton,
        child: Padding(
          padding: EdgeInsets.only(left: 15.sp, right: 15.sp, bottom: 15.sp),
          child: SubmitButton(
            title: getTranslated('submit', context),
            onPressed: () {
             
                goPageWithName(context, HappayWithIterest.id);

              print('registering new user ');
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

class ChartData {
  ChartData(this.xVal, this.yVal, this.radius);
  final String xVal;
  final int yVal;
  final String radius;
}
