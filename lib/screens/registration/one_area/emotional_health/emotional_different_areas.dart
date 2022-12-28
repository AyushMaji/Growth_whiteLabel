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



class DifferentAreasForEmotionalHealth extends StatefulWidget {
  static const String id = "/differentAreasForEmotionalHealth";
  const DifferentAreasForEmotionalHealth({Key? key}) : super(key: key);

  @override
  State<DifferentAreasForEmotionalHealth> createState() => _DifferentAreasForEmotionalHealthState();
}

class _DifferentAreasForEmotionalHealthState extends State<DifferentAreasForEmotionalHealth> {

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: newAppBar(context),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.w),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Stack(
                children: [
                   Transform(
                        transform: Matrix4.rotationZ(
                            -0.999000), //===============================Transform to rotated the graph
                        alignment: FractionalOffset.center,
                    child: Image.asset(
                      Images.emotional_Health,
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
                      // top: -0.9.h,
                      // left: -0.5.w,
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
                                 ChartData(
                                      'USA',
                                      12,
                                      ((storageValue.response4 + 1)
                                                  .toString() ==
                                              '10')
                                          ? '84.5%'
                                          : (((storageValue.response4 + 1)
                                                      .toString() ==
                                                  '9')
                                              ? '75.5%'
                                              : (((storageValue.response4 + 1)
                                                          .toString() ==
                                                      '8')
                                                  ? '67%'
                                                  : (((storageValue.response4 + 1)
                                                              .toString() ==
                                                          '7')
                                                      ? '59%'
                                                      : (((storageValue.response4 + 1)
                                                                  .toString() ==
                                                              '6')
                                                          ? '52%'
                                                          : (((storageValue.response4 + 1)
                                                                      .toString() ==
                                                                  '5')
                                                              ? '44%'
                                                              : (((storageValue.response4 + 1)
                                                                          .toString() ==
                                                                      '4')
                                                                  ? '37%'
                                                                  : (((storageValue.response4 + 1).toString() ==
                                                                          '3')
                                                                      ? '29%'
                                                                      : (((storageValue.response4 + 1).toString() == '2')
                                                                          ? '22%'
                                                                          : (((storageValue.response4 + 1).toString() == '1')
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
              SizedBox(height: 10.h),
              Row(
                children: [
                  SizedBox(height: 10.h),
                  Flexible(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        getTranslated('deep_look_in_emotional_health', context),
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
