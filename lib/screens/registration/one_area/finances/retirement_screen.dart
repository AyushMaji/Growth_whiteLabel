import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/happy_life_provider.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/registration/one_area/finances/credit_screen.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../global/constants/images.dart';
import 'finance_different_areas.dart';


class RetirementScreen extends StatefulWidget {
  static const String id = "/retirementScreen";
  const RetirementScreen({Key? key}) : super(key: key);

  @override
  State<RetirementScreen> createState() => _RetirementScreenState();
}

class _RetirementScreenState extends State<RetirementScreen> {
 
  bool isValueGiven = false;
  bool showButton = false;
  bool absoreTap = false;
  int selectedIndex = 0;

  @override
     void initState() {
    super.initState();
    Provider.of<StorageProvider>(context, listen: false).audioSpeak("How satisfied are you that your retirement savings plan is on track.");
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
                   Image.asset(Images.finances,
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
                                radius: '26%',
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
              SizedBox(height: 15.sp),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                     // getTranslated("on_scale_1_10", context),
                     "How satisfied are you that your retirement savings plan is on track.",
                      style: TextStyles.smallBoldTextStyle(context),
                    ),
                    // SizedBox(height: 20.sp),
                    // Text(
                    //   getTranslated("finance", context),
                    //   style: TextStyles.smallBoldTextStyle(context),
                    // ),
                    SizedBox(height: 10.sp),
                    Text(
                      // getTranslated('happy_with_investments', context),
                      "Retirement",
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
                  child: 
                  
                  // SizedBox(
                  //   height: 20.h,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: ListView.builder(
                  //     itemExtent: 33.w,
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.horizontal,
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     itemCount: 10,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return InkWell(
                  //         onTap: () {
                  //           setState(() {
                  //             setColorsinIndex(index, context);
                  //            storageValue.updateResponse8(index);
                  //             selectedIndex = index;
                  //             showButton = true;
                  //             absoreTap = true;                                            
                  //           });
                  //         },
                  //         child: Card(
                  //           child: Container(
                  //             color: colors[index],
                  //             height: 20,
                  //             width: 30,
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),


                   SizedBox(
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
                                 HapticFeedback.vibrate();
                                setState(() {
                                  // setColorsinIndex(index, context);
                                  //  storageValue.updateResponse2(index);
                                  //  selectedIndex = (index + 1);
                                  // showButton = true;
                                  // absoreTap = true;
                                   setColorsinIndex(index, context);
                                  storageValue.updateResponse8(index);
                                  selectedIndex = (index+1);
                                  showButton = true;
                                  absoreTap = true;  
                                });
                              },
                              child: Container(
                                height: 20,
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
                goPageWithName(context, CreditScreen.id);
              print('registering new user ');
            },
            buttonStyle: ButtonStyles.getCommonStyle(context),
          ),
        ),
      ),
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
    Color(0xffB50000),
    Color(0xffDEB988),
    Color(0xffDEB988),
    Color(0xff67C23A),
    Color(0xff67C23A),
    Color(0xffE6A23C),
    Color(0xffE6A23C),
    Color(0xffF56C6C),
    Color(0xffF56C6C),
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
        colors[1] = Color(0xffB50000);
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
        colors[2] = Color(0xFFF2E3CF);
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
        colors[3] = Color(0xFFEFDCC4);
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
        colors[4] = Color(0xff67C23A);
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
        colors[5] = Color(0xff67C23A);
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
    } else if (index == 7) {
      setState(() {
        colors[0] = Colors.white;
        colors[1] = Colors.white;
        colors[2] = Colors.white;
        colors[3] = Colors.white;
        colors[4] = Colors.white;
        colors[5] = Colors.white;
        colors[6] = Colors.white;
        colors[7] = Color(0xffE6A23C);
        colors[8] = Colors.white;
        colors[9] = Colors.white;
      });
    } else if (index == 8) {
      setState(() {
        colors[0] = Colors.white;
        colors[1] = Colors.white;
        colors[2] = Colors.white;
        colors[3] = Colors.white;
        colors[4] = Colors.white;
        colors[5] = Colors.white;
        colors[6] = Colors.white;
        colors[7] = Colors.white;
        colors[8] = Color(0xffF56C6C);
        colors[9] = Colors.white;
      });
    } else if (index == 9) {
      setState(() {
        colors[0] = Colors.white;
        colors[1] = Colors.white;
        colors[2] = Colors.white;
        colors[3] = Colors.white;
        colors[4] = Colors.white;
        colors[5] = Colors.white;
        colors[6] = Colors.white;
        colors[7] = Colors.white;
        colors[8] = Colors.white;
        colors[9] = Color(0xffF56C6C);
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
