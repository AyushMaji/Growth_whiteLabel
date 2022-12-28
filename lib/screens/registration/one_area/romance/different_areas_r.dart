// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/widgets/primary_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../provider/storage_provider.dart';
import 'package:provider/provider.dart';

import '../deep/goal_deep_care.dart';

class DifferentAreasForRomance extends StatefulWidget {
  static const String id = "/differentAreasForRomance";
  const DifferentAreasForRomance({Key? key}) : super(key: key);

  @override
  State<DifferentAreasForRomance> createState() =>
      _DifferentAreasForRomanceState();
}

class _DifferentAreasForRomanceState extends State<DifferentAreasForRomance> {

   @override
  void initState() {
    super.initState();
     //###############################################################
    StorageProvider storageValue =
        Provider.of<StorageProvider>(context, listen: false);
    //###############################################################
    Provider.of<StorageProvider>(context, listen: false).audioSpeak("Well done on looking deep within to identify how you feel about the different areas related to your ${storageValue.oneSelectedArea}");
  }

  @override
  Widget build(BuildContext context) {
    //###############################################################
    StorageProvider storageValue =
        Provider.of<StorageProvider>(context, listen: false);
    //###############################################################
    return Scaffold(
      appBar: newAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Stack(
                children: [
                  Image.asset(
                    Images.romance_Intimacy,
                    //Images.healthCare,
                   fit: BoxFit.cover,
                  ),
                  Positioned(
                      // top: 21,
                      // left: 20.5,
                      top: MediaQuery.of(context).size.height * -0.0,
                      left: MediaQuery.of(context).size.width * -0.0,
                      right: MediaQuery.of(context).size.width * -0.0,
                      bottom: MediaQuery.of(context).size.width * -0.0,
                      // top: -0.9.h,
                      // left: -0.5.w,
                      child: Transform(
                        transform: Matrix4.rotationZ(
                            0.30), //===============================Transform to rotated the graph
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
                                          ? '81%'
                                          : (((storageValue.response1 + 1)
                                                      .toString() ==
                                                  '9')
                                              ? '74%'
                                              : (((storageValue.response1 + 1)
                                                          .toString() ==
                                                      '8')
                                                  ? '68%'
                                                  : (((storageValue.response1 + 1)
                                                              .toString() ==
                                                          '7')
                                                      ? '60%'
                                                      : (((storageValue.response1 + 1)
                                                                  .toString() ==
                                                              '6')
                                                          ? '54%'
                                                          : (((storageValue.response1 + 1)
                                                                      .toString() ==
                                                                  '5')
                                                              ? '47%'
                                                              : (((storageValue.response1 + 1)
                                                                          .toString() ==
                                                                      '4')
                                                                  ? '41%'
                                                                  : (((storageValue.response1 + 1).toString() ==
                                                                          '3')
                                                                      ? '34%'
                                                                      : (((storageValue.response1 + 1).toString() == '2')
                                                                          ? '26%'
                                                                          : (((storageValue.response1 + 1).toString() == '1')
                                                                              ? '20%'
                                                                              : "0")))))))))),
                                  ChartData(
                                      'USA',
                                      12,
                                      ((storageValue.response2 + 1)
                                                  .toString() ==
                                              '10')
                                          ? '81%'
                                          : (((storageValue.response2 + 1)
                                                      .toString() ==
                                                  '9')
                                              ? '74%'
                                              : (((storageValue.response2 + 1)
                                                          .toString() ==
                                                      '8')
                                                  ? '68%'
                                                  : (((storageValue.response2 + 1)
                                                              .toString() ==
                                                          '7')
                                                      ? '60%'
                                                      : (((storageValue.response2 + 1)
                                                                  .toString() ==
                                                              '6')
                                                          ? '54%'
                                                          : (((storageValue.response2 + 1)
                                                                      .toString() ==
                                                                  '5')
                                                              ? '47%'
                                                              : (((storageValue.response2 + 1)
                                                                          .toString() ==
                                                                      '4')
                                                                  ? '41%'
                                                                  : (((storageValue.response2 + 1).toString() ==
                                                                          '3')
                                                                      ? '34%'
                                                                      : (((storageValue.response2 + 1).toString() == '2')
                                                                          ? '26%'
                                                                          : (((storageValue.response2 + 1).toString() == '1')
                                                                              ? '20%'
                                                                              : "0")))))))))),
                                  ChartData(
                                      'USA',
                                      12,
                                      ((storageValue.response3 + 1)
                                                  .toString() ==
                                              '10')
                                          ? '81%'
                                          : (((storageValue.response3 + 1)
                                                      .toString() ==
                                                  '9')
                                              ? '74%'
                                              : (((storageValue.response3 + 1)
                                                          .toString() ==
                                                      '8')
                                                  ? '68%'
                                                  : (((storageValue.response3 + 1)
                                                              .toString() ==
                                                          '7')
                                                      ? '60%'
                                                      : (((storageValue.response3 + 1)
                                                                  .toString() ==
                                                              '6')
                                                          ? '54%'
                                                          : (((storageValue.response3 + 1)
                                                                      .toString() ==
                                                                  '5')
                                                              ? '47%'
                                                              : (((storageValue.response3 + 1)
                                                                          .toString() ==
                                                                      '4')
                                                                  ? '41%'
                                                                  : (((storageValue.response3 + 1).toString() ==
                                                                          '3')
                                                                      ? '34%'
                                                                      : (((storageValue.response3 + 1).toString() == '2')
                                                                          ? '26%'
                                                                          : (((storageValue.response3 + 1).toString() == '1')
                                                                              ? '20%'
                                                                              : "0")))))))))),
     
                                  ChartData(
                                      'USA',
                                      12,
                                      ((storageValue.response4 + 1)
                                                  .toString() ==
                                              '10')
                                          ? '81%'
                                          : (((storageValue.response4 + 1)
                                                      .toString() ==
                                                  '9')
                                              ? '74%'
                                              : (((storageValue.response4 + 1)
                                                          .toString() ==
                                                      '8')
                                                  ? '68%'
                                                  : (((storageValue.response4 + 1)
                                                              .toString() ==
                                                          '7')
                                                      ? '60%'
                                                      : (((storageValue.response4 + 1)
                                                                  .toString() ==
                                                              '6')
                                                          ? '54%'
                                                          : (((storageValue.response4 + 1)
                                                                      .toString() ==
                                                                  '5')
                                                              ? '47%'
                                                              : (((storageValue.response4 + 1)
                                                                          .toString() ==
                                                                      '4')
                                                                  ? '41%'
                                                                  : (((storageValue.response4 + 1).toString() ==
                                                                          '3')
                                                                      ? '34%'
                                                                      : (((storageValue.response4 + 1).toString() == '2')
                                                                          ? '26%'
                                                                          : (((storageValue.response4 + 1).toString() == '1')
                                                                              ? '20%'
                                                                              : "0")))))))))),
     
                                  ChartData(
                                      'USA',
                                      12,
                                      ((storageValue.response5 + 1)
                                                  .toString() ==
                                              '10')
                                          ? '81%'
                                          : (((storageValue.response5 + 1)
                                                      .toString() ==
                                                  '9')
                                              ? '74%'
                                              : (((storageValue.response5 + 1)
                                                          .toString() ==
                                                      '8')
                                                  ? '68%'
                                                  : (((storageValue.response5 + 1)
                                                              .toString() ==
                                                          '7')
                                                      ? '60%'
                                                      : (((storageValue.response5 + 1)
                                                                  .toString() ==
                                                              '6')
                                                          ? '54%'
                                                          : (((storageValue.response5 + 1)
                                                                      .toString() ==
                                                                  '5')
                                                              ? '47%'
                                                              : (((storageValue.response5 + 1)
                                                                          .toString() ==
                                                                      '4')
                                                                  ? '41%'
                                                                  : (((storageValue.response5 + 1).toString() ==
                                                                          '3')
                                                                      ? '34%'
                                                                      : (((storageValue.response5 + 1).toString() == '2')
                                                                          ? '26%'
                                                                          : (((storageValue.response5 + 1).toString() == '1')
                                                                              ? '20%'
                                                                              : "0")))))))))),
     
                                  ChartData(
                                      'USA',
                                      12,
                                      ((storageValue.response6 + 1)
                                                  .toString() ==
                                              '10')
                                          ? '81%'
                                          : (((storageValue.response6 + 1)
                                                      .toString() ==
                                                  '9')
                                              ? '74%'
                                              : (((storageValue.response6 + 1)
                                                          .toString() ==
                                                      '8')
                                                  ? '68%'
                                                  : (((storageValue.response6 + 1)
                                                              .toString() ==
                                                          '7')
                                                      ? '60%'
                                                      : (((storageValue.response6 + 1)
                                                                  .toString() ==
                                                              '6')
                                                          ? '54%'
                                                          : (((storageValue.response6 + 1)
                                                                      .toString() ==
                                                                  '5')
                                                              ? '47%'
                                                              : (((storageValue.response6 + 1)
                                                                          .toString() ==
                                                                      '4')
                                                                  ? '41%'
                                                                  : (((storageValue.response6 + 1).toString() ==
                                                                          '3')
                                                                      ? '34%'
                                                                      : (((storageValue.response6 + 1).toString() == '2')
                                                                          ? '26%'
                                                                          : (((storageValue.response6 + 1).toString() == '1')
                                                                              ? '20%'
                                                                              : "0")))))))))),
     
                                  ChartData(
                                      'USA',
                                      12,
                                      ((storageValue.response7 + 1)
                                                  .toString() ==
                                              '10')
                                          ? '81%'
                                          : (((storageValue.response7 + 1)
                                                      .toString() ==
                                                  '9')
                                              ? '74%'
                                              : (((storageValue.response7 + 1)
                                                          .toString() ==
                                                      '8')
                                                  ? '68%'
                                                  : (((storageValue.response7 + 1)
                                                              .toString() ==
                                                          '7')
                                                      ? '60%'
                                                      : (((storageValue.response7 + 1)
                                                                  .toString() ==
                                                              '6')
                                                          ? '54%'
                                                          : (((storageValue.response7 + 1)
                                                                      .toString() ==
                                                                  '5')
                                                              ? '47%'
                                                              : (((storageValue.response7 + 1)
                                                                          .toString() ==
                                                                      '4')
                                                                  ? '41%'
                                                                  : (((storageValue.response7 + 1).toString() ==
                                                                          '3')
                                                                      ? '34%'
                                                                      : (((storageValue.response7 + 1).toString() == '2')
                                                                          ? '26%'
                                                                          : (((storageValue.response7 + 1).toString() == '1')
                                                                              ? '20%'
                                                                              : "0")))))))))),
     
                                  ChartData(
                                      'USA',
                                      12,
                                      ((storageValue.response8 + 1)
                                                  .toString() ==
                                              '10')
                                          ? '81%'
                                          : (((storageValue.response8 + 1)
                                                      .toString() ==
                                                  '9')
                                              ? '74%'
                                              : (((storageValue.response8 + 1)
                                                          .toString() ==
                                                      '8')
                                                  ? '68%'
                                                  : (((storageValue.response8 + 1)
                                                              .toString() ==
                                                          '7')
                                                      ? '60%'
                                                      : (((storageValue.response8 + 1)
                                                                  .toString() ==
                                                              '6')
                                                          ? '54%'
                                                          : (((storageValue.response8 + 1)
                                                                      .toString() ==
                                                                  '5')
                                                              ? '47%'
                                                              : (((storageValue.response8 + 1)
                                                                          .toString() ==
                                                                      '4')
                                                                  ? '41%'
                                                                  : (((storageValue.response8 + 1).toString() ==
                                                                          '3')
                                                                      ? '34%'
                                                                      : (((storageValue.response8 + 1).toString() == '2')
                                                                          ? '26%'
                                                                          : (((storageValue.response8 + 1).toString() == '1')
                                                                              ? '20%'
                                                                              : "0")))))))))),
     
                                  ChartData(
                                      'USA',
                                      12,
                                      ((storageValue.response9 + 1)
                                                  .toString() ==
                                              '10')
                                          ? '81%'
                                          : (((storageValue.response9 + 1)
                                                      .toString() ==
                                                  '9')
                                              ? '74%'
                                              : (((storageValue.response9 + 1)
                                                          .toString() ==
                                                      '8')
                                                  ? '68%'
                                                  : (((storageValue.response9 + 1)
                                                              .toString() ==
                                                          '7')
                                                      ? '60%'
                                                      : (((storageValue.response9 + 1)
                                                                  .toString() ==
                                                              '6')
                                                          ? '54%'
                                                          : (((storageValue.response9 + 1)
                                                                      .toString() ==
                                                                  '5')
                                                              ? '47%'
                                                              : (((storageValue.response9 + 1)
                                                                          .toString() ==
                                                                      '4')
                                                                  ? '41%'
                                                                  : (((storageValue.response9 + 1).toString() ==
                                                                          '3')
                                                                      ? '34%'
                                                                      : (((storageValue.response9 + 1).toString() == '2')
                                                                          ? '26%'
                                                                          : (((storageValue.response9 + 1).toString() == '1')
                                                                              ? '20%'
                                                                              : "0")))))))))),
     
                                  ChartData(
                                      'USA',
                                      12,
                                      ((storageValue.response10 + 1)
                                                  .toString() ==
                                              '10')
                                          ? '81%'
                                          : (((storageValue.response10 + 1)
                                                      .toString() ==
                                                  '9')
                                              ? '74%'
                                              : (((storageValue.response10 + 1)
                                                          .toString() ==
                                                      '8')
                                                  ? '68%'
                                                  : (((storageValue.response10 + 1)
                                                              .toString() ==
                                                          '7')
                                                      ? '60%'
                                                      : (((storageValue.response10 + 1)
                                                                  .toString() ==
                                                              '6')
                                                          ? '54%'
                                                          : (((storageValue.response10 + 1)
                                                                      .toString() ==
                                                                  '5')
                                                              ? '47%'
                                                              : (((storageValue.response10 + 1)
                                                                          .toString() ==
                                                                      '4')
                                                                  ? '41%'
                                                                  : (((storageValue.response10 + 1).toString() ==
                                                                          '3')
                                                                      ? '34%'
                                                                      : (((storageValue.response10 + 1).toString() == '2')
                                                                          ? '26%'
                                                                          : (((storageValue.response10 + 1).toString() == '1')
                                                                              ? '20%'
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
              SizedBox(height: 10.h),
              Row(
                children: [
                  SizedBox(height: 10.h),
                  Flexible(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        getTranslated('deep_look_in_career_goal', context) +
                            "${storageValue.oneSelectedArea}",
                        //style: TextStyles.regularBoldTextStyle(context),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Image.asset(
                    Images.selectedArea2,
                    width: 120.w,
                  ),
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.fromLTRB(15.sp, 15.sp, 0, 15.sp),
        child: PrimaryButton(
          title: getTranslated('continue', context),
          onPressed: () {
            goPageWithName(context, GoalDeepCare.id);

            print('submiteed');
          },
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.xVal, this.yVal, this.radius);
  final String xVal;
  final int yVal;
  final String radius;
}
