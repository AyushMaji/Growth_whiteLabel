// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:olga/provider/ques_res_provider.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../global/styles/text_styles.dart';
import '../../../global/widgets/custom_widgets.dart';
import '../../../global/widgets/text_button.dart';
import '../../../localization/language_constrants.dart';
import '../one_area/one_area.dart';
import '../widgets/deeper_widget.dart';
import 'package:provider/provider.dart';

class LifeWheel extends StatefulWidget {
  static const String id = "/lifeWheel";
  const LifeWheel({Key? key}) : super(key: key);

  @override
  State<LifeWheel> createState() => _LifeWheelState();
}

class _LifeWheelState extends State<LifeWheel> {
  //
  List<Color> palette = const <Color>[
    Color.fromRGBO(75, 135, 185, 1),
    Color.fromRGBO(192, 108, 132, 1),
    Color.fromRGBO(246, 114, 128, 1),
    Color.fromRGBO(248, 177, 149, 1),
    Color.fromRGBO(118, 180, 155, 1),
    Color.fromRGBO(0, 168, 181, 1),
    Color.fromRGBO(73, 76, 162, 1),
    Color.fromRGBO(255, 205, 96, 1),
    Color.fromRGBO(255, 240, 219, 1),
    Color.fromRGBO(238, 238, 238, 1)
  ];
  String? selectedValue ;
  var userInputChartValue1 = "0";
  var userInputChartValue2 = "0";
  var userInputChartValue3 = "0";
  var userInputChartValue4 = "0";
  var userInputChartValue5 = "0";
  var userInputChartValue6 = "0";
  var userInputChartValue7 = "0";
  var userInputChartValue8 = "0";
  var userInputChartValue9 = "0";
  var userInputChartValue10 = "0";

  List<String> allValues = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
  ];

  @override
  void initState() {
    super.initState();
    //initialText = getTranslated("friends", context);
    //Provider.of<StorageProvider>(context, listen: false).audioSpeak("Now that we’ve established where you are, let’s focus on2 where you want to get to.....Did you know... “Hopeful people” are found to experience greater success, life meaning, health & wellbeing, academic success, along with fewer symptoms of depression and anxiety.....(Cheavens, Feldam, Gum, Scott and Snyder, 2006)");

  }

  String initialText = "Friends";
  String speakInitialText = "";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var screenWidth =  MediaQuery.of(context).size.width;
    var pixWidth = WidgetsBinding.instance.window.physicalSize.width;
    var pixHeight = WidgetsBinding.instance.window.physicalSize.height;
    print("Screen height===>"'${height}');
    print("Screen WIDTH===>"'${screenWidth}');
    print("Screen pix Width===>"'${pixWidth}');
    print("Screen pix Height===>"'${pixHeight}');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DeeperWidget(),
              Text(
                initialText,
                style: TextStyles.smallBoldTextStyle(context),
                textAlign: TextAlign.start,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // width: 163,
                    height: 40,
                    decoration: BoxDecoration(
                      //color: Colors.green,
                      border: Border.all(
                        color: Color(0xff8E8E8E),
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    margin: EdgeInsets.only(top: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        hint: Text("Select",),
                        underline: Container(),
                        icon: Icon(Icons.keyboard_arrow_down),
                        iconSize: 24,
                        isExpanded: true,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        value: selectedValue,
                        items: allValues
                            .map((state) => DropdownMenuItem(
                                  value: state,
                                  child: Text(
                                    state,
                                    maxLines: 2,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextBtn(
                      onPressed: () {
                        //selectedValue = '1';
                        setState(() {
                          // selectedValue = '1';
                          if (userInputChartValue1 == "0") {
                            initialText = getTranslated("family", context);
                            userInputChartValue1 = selectedValue!;
                            Provider.of<StorageProvider>(context, listen: false).audioSpeak("Family");
                          } else if (userInputChartValue2 == "0" &&
                              userInputChartValue1 != "0") {
                            initialText =
                                getTranslated("romance_intimacy", context);
                            userInputChartValue2 = selectedValue!;
                            Provider.of<StorageProvider>(context, listen: false).audioSpeak("Romance and Intimacy");
                          } else if (userInputChartValue3 == "0" &&
                              userInputChartValue2 != "0") {
                            initialText = getTranslated("finance", context);
                            userInputChartValue3 = selectedValue!;
                            Provider.of<StorageProvider>(context, listen: false).audioSpeak("Finance");

                          } else if (userInputChartValue4 == "0" &&
                              userInputChartValue3 != "0") {
                            initialText =
                                getTranslated("physical_health", context);
                            userInputChartValue4 = selectedValue!;
                            Provider.of<StorageProvider>(context, listen: false).audioSpeak("Physical health and Self-care");
                          } else if (userInputChartValue5 == "0" &&
                              userInputChartValue4 != "0") {
                            initialText = getTranslated("hobbies_fun", context);
                            userInputChartValue5 = selectedValue!;
                            Provider.of<StorageProvider>(context, listen: false).audioSpeak("Hobbies or Recreation or Fun");
                          } else if (userInputChartValue6 == "0" &&
                              userInputChartValue5 != "0") {
                            initialText =
                                getTranslated("emotional_health", context);
                            userInputChartValue6 = selectedValue!;
                            Provider.of<StorageProvider>(context, listen: false).audioSpeak("Emotional Health");
                          } else if (userInputChartValue7 == "0" &&
                              userInputChartValue6 != "0") {
                            initialText = getTranslated("career_work", context);
                            userInputChartValue7 = selectedValue!;
                            Provider.of<StorageProvider>(context, listen: false).audioSpeak("Career and Work");
                          } else if (userInputChartValue8 == "0" &&
                              userInputChartValue7 != "0") {
                            initialText =
                                getTranslated("spirituality", context);
                            userInputChartValue8 = selectedValue!;
                            Provider.of<StorageProvider>(context, listen: false).audioSpeak("Spirituality");
                          } else if (userInputChartValue9 == "0" &&
                              userInputChartValue8 != "0") {
                            initialText = getTranslated("living_env", context);
                            userInputChartValue9 = selectedValue!;
                            Provider.of<StorageProvider>(context, listen: false).audioSpeak("Living Environment");
                          } else if (userInputChartValue10 == "0" &&
                              userInputChartValue9 != "0") {
                            //initialText = getTranslated("physical_health", context);
                            userInputChartValue10 = selectedValue!;
                            final quesResProvider =
                                Provider.of<QuesResProvider>(context,
                                    listen: false);
                                    Provider.of<StorageProvider>(context, listen: false)
                  .registrationSafetyNet(route: OneArea.id);
                            quesResProvider.lifeWheelSurvey(
                              friendsRating: userInputChartValue1,
                              familyRating: userInputChartValue2,
                              romanceIntimacyRating: userInputChartValue3,
                              financesRating: userInputChartValue4,
                              physicalHealthRating: userInputChartValue5,
                              hobbiesRating: userInputChartValue6,
                              emotionalHealthRating: userInputChartValue7,
                              careerRating: userInputChartValue8,
                              spiritualityRating: userInputChartValue9,
                              livingEnvironmentRating: userInputChartValue10,
                              context: context,
                            );
                            //goPage(context, const OneArea());
                            final storageProvider =
                                Provider.of<StorageProvider>(context,
                                    listen: false);
                            storageProvider.updateFriends(userInputChartValue1);
                            storageProvider.updateFamily(userInputChartValue2);
                            storageProvider.updateRomance(userInputChartValue3);
                            storageProvider
                                .updateFinances(userInputChartValue4);
                            storageProvider
                                .updatePhysicalHealth(userInputChartValue5);
                            storageProvider.updateHobbies(userInputChartValue6);
                            storageProvider
                                .updateEmotionalHealth(userInputChartValue7);
                            storageProvider.updateCareer(userInputChartValue8);
                            storageProvider
                                .updateSpiritual(userInputChartValue9);
                            storageProvider
                                .updateLivingEnv(userInputChartValue10);
                          }
                        });
                         selectedValue = null;
                      },
                      title: getTranslated("continue", context),
                    ),
                  ),
                  SizedBox(height: 15.h),

                  //Text((int.parse('9' + '0') - 5).toString() + "%"),
                  //Text((int.parse(userInputChartValue1 + '0') - 5).toString() + "%"),

                  Column(
                    children: [
                      Stack(
                        children: [
                           Image.asset("assets/images/wheelH.png",fit: BoxFit.contain,),


                            Positioned(
                      top: MediaQuery.of(context).size.height * -0.00100,
                      left: MediaQuery.of(context).size.width * -0.0,
                      right: MediaQuery.of(context).size.width * -0.0,
                      bottom: MediaQuery.of(context).size.width * 0.00,
                      child: Transform(
                        transform: Matrix4.rotationZ(0.30), 
                            //=============================== Transform to rotated the graph
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
                                            9,
                                            (userInputChartValue1 == '10')
                                                ? '82%'
                                                : (userInputChartValue1 == '9')
                                                    ? '75%'
                                                    : (userInputChartValue1 ==
                                                            '8')
                                                        ? '68%'
                                                        : (userInputChartValue1 ==
                                                                '7')
                                                            ? '61%'
                                                            : (userInputChartValue1 ==
                                                                    '6')
                                                                ? '54%'
                                                                : (userInputChartValue1 ==
                                                                        '5')
                                                                    ? '47%'
                                                                    : (userInputChartValue1 ==
                                                                            '4')
                                                                        ? '40%'
                                                                        : (userInputChartValue1 ==
                                                                                '3')
                                                                            ? '34%'
                                                                            : (userInputChartValue1 == '2')
                                                                                ? '27%'
                                                                                : (userInputChartValue1 == '1')
                                                                                    ? '20%'
                                                                                    : "0"),
                                        ChartData(
                                            'USA',
                                            9,
                                            (userInputChartValue2 == '10')
                                                ? '82%'
                                                : (userInputChartValue2 == '9')
                                                    ? '74%'
                                                    : (userInputChartValue2 ==
                                                            '8')
                                                        ? '68%'
                                                        : (userInputChartValue2 ==
                                                                '7')
                                                            ? '61%'
                                                            : (userInputChartValue2 ==
                                                                    '6')
                                                                ? '54%'
                                                                : (userInputChartValue2 ==
                                                                        '5')
                                                                    ? '47%'
                                                                    : (userInputChartValue2 ==
                                                                            '4')
                                                                        ? '40%'
                                                                        : (userInputChartValue2 ==
                                                                                '3')
                                                                            ? '34%'
                                                                            : (userInputChartValue2 == '2')
                                                                                ? '27%'
                                                                                : (userInputChartValue2 == '1')
                                                                                    ? '20%'
                                                                                    : "0"),
                                        ChartData(
                                            'USA',
                                            10,
                                            (userInputChartValue3 == '10')
                                                ? '82%'
                                                : (userInputChartValue3 == '9')
                                                    ? '74%'
                                                    : (userInputChartValue3 ==
                                                            '8')
                                                        ? '68%'
                                                        : (userInputChartValue3 ==
                                                                '7')
                                                            ? '61%'
                                                            : (userInputChartValue3 ==
                                                                    '6')
                                                                ? '54%'
                                                                : (userInputChartValue3 ==
                                                                        '5')
                                                                    ? '47%'
                                                                    : (userInputChartValue3 ==
                                                                            '4')
                                                                        ? '40%'
                                                                        : (userInputChartValue3 ==
                                                                                '3')
                                                                            ? '34%'
                                                                            : (userInputChartValue3 == '2')
                                                                                ? '27%'
                                                                                : (userInputChartValue3 == '1')
                                                                                    ? '20%'
                                                                                    : "0"),
                                        ChartData(
                                            'USA',
                                            8,
                                            (userInputChartValue4 == '10')
                                                ? '82%'
                                                : (userInputChartValue4 == '9')
                                                    ? '74%'
                                                    : (userInputChartValue4 ==
                                                            '8')
                                                        ? '68%'
                                                        : (userInputChartValue4 ==
                                                                '7')
                                                            ? '61%'
                                                            : (userInputChartValue4 ==
                                                                    '6')
                                                                ? '54%'
                                                                : (userInputChartValue4 ==
                                                                        '5')
                                                                    ? '47%'
                                                                    : (userInputChartValue4 ==
                                                                            '4')
                                                                        ? '40%'
                                                                        : (userInputChartValue4 ==
                                                                                '3')
                                                                            ? '34%'
                                                                            : (userInputChartValue4 == '2')
                                                                                ? '27%'
                                                                                : (userInputChartValue4 == '1')
                                                                                    ? '20%'
                                                                                    : "0"),
                                        ChartData(
                                            'USA',
                                            10,
                                            (userInputChartValue5 == '10')
                                                ? '82%'
                                                : (userInputChartValue5 == '9')
                                                    ? '74%'
                                                    : (userInputChartValue5 ==
                                                            '8')
                                                        ? '68%'
                                                        : (userInputChartValue5 ==
                                                                '7')
                                                            ? '61%'
                                                            : (userInputChartValue5 ==
                                                                    '6')
                                                                ? '54%'
                                                                : (userInputChartValue5 ==
                                                                        '5')
                                                                    ? '47%'
                                                                    : (userInputChartValue5 ==
                                                                            '4')
                                                                        ? '40%'
                                                                        : (userInputChartValue5 ==
                                                                                '3')
                                                                            ? '34%'
                                                                            : (userInputChartValue5 == '2')
                                                                                ? '27%'
                                                                                : (userInputChartValue5 == '1')
                                                                                    ? '20%'
                                                                                    : "0"),
                                        ChartData(
                                            'USA',
                                            9,
                                            (userInputChartValue6 == '10')
                                                ? '82%'
                                                : (userInputChartValue6 == '9')
                                                    ? '74%'
                                                    : (userInputChartValue6 ==
                                                            '8')
                                                        ? '68%'
                                                        : (userInputChartValue6 ==
                                                                '7')
                                                            ? '61%'
                                                            : (userInputChartValue6 ==
                                                                    '6')
                                                                ? '54%'
                                                                : (userInputChartValue6 ==
                                                                        '5')
                                                                    ? '47%'
                                                                    : (userInputChartValue6 ==
                                                                            '4')
                                                                        ? '40%'
                                                                        : (userInputChartValue6 ==
                                                                                '3')
                                                                            ? '34%'
                                                                            : (userInputChartValue6 == '2')
                                                                                ? '27%'
                                                                                : (userInputChartValue6 == '1')
                                                                                    ? '20%'
                                                                                    : "0"),
                                        ChartData(
                                            'USA',
                                            9,
                                            (userInputChartValue7 == '10')
                                                ? '82%'
                                                : (userInputChartValue7 == '9')
                                                    ? '74%'
                                                    : (userInputChartValue7 ==
                                                            '8')
                                                        ? '68%'
                                                        : (userInputChartValue7 ==
                                                                '7')
                                                            ? '61%'
                                                            : (userInputChartValue7 ==
                                                                    '6')
                                                                ? '54%'
                                                                : (userInputChartValue7 ==
                                                                        '5')
                                                                    ? '47%'
                                                                    : (userInputChartValue7 ==
                                                                            '4')
                                                                        ? '40%'
                                                                        : (userInputChartValue7 ==
                                                                                '3')
                                                                            ? '34%'
                                                                            : (userInputChartValue7 == '2')
                                                                                ? '27%'
                                                                                : (userInputChartValue7 == '1')
                                                                                    ? '20%'
                                                                                    : "0"),
                                        ChartData(
                                            'USA',
                                            9,
                                            (userInputChartValue8 == '10')
                                                ? '82%'
                                                : (userInputChartValue8 == '9')
                                                    ? '74%'
                                                    : (userInputChartValue8 ==
                                                            '8')
                                                        ? '68%'
                                                        : (userInputChartValue8 ==
                                                                '7')
                                                            ? '61%'
                                                            : (userInputChartValue8 ==
                                                                    '6')
                                                                ? '54%'
                                                                : (userInputChartValue8 ==
                                                                        '5')
                                                                    ? '47%'
                                                                    : (userInputChartValue8 ==
                                                                            '4')
                                                                        ? '40%'
                                                                        : (userInputChartValue8 ==
                                                                                '3')
                                                                            ? '34%'
                                                                            : (userInputChartValue8 == '2')
                                                                                ? '27%'
                                                                                : (userInputChartValue8 == '1')
                                                                                    ? '20%'
                                                                                    : "0"),
                                        ChartData(
                                            'USA',
                                            9,
                                            (userInputChartValue9 == '10')
                                                ? '82%'
                                                : (userInputChartValue9 == '9')
                                                    ? '74%'
                                                    : (userInputChartValue9 ==
                                                            '8')
                                                        ? '68%'
                                                        : (userInputChartValue9 ==
                                                                '7')
                                                            ? '61%'
                                                            : (userInputChartValue9 ==
                                                                    '6')
                                                                ? '54%'
                                                                : (userInputChartValue9 ==
                                                                        '5')
                                                                    ? '47%'
                                                                    : (userInputChartValue9 ==
                                                                            '4')
                                                                        ? '40%'
                                                                        : (userInputChartValue9 ==
                                                                                '3')
                                                                            ? '34%'
                                                                            : (userInputChartValue9 == '2')
                                                                                ? '27%'
                                                                                : (userInputChartValue9 == '1')
                                                                                    ? '20%'
                                                                                    : "0"),
                                        ChartData(
                                            'USA',
                                            9,
                                            (userInputChartValue10 == '10')
                                                ? '82%'
                                                : (userInputChartValue10 == '9')
                                                    ? '74%'
                                                    : (userInputChartValue10 ==
                                                            '8')
                                                        ? '68%'
                                                        : (userInputChartValue10 ==
                                                                '7')
                                                            ? '61%'
                                                            : (userInputChartValue10 ==
                                                                    '6')
                                                                ? '54%'
                                                                : (userInputChartValue10 ==
                                                                        '5')
                                                                    ? '47%'
                                                                    : (userInputChartValue10 ==
                                                                            '4')
                                                                        ? '40%'
                                                                        : (userInputChartValue10 ==
                                                                                '3')
                                                                            ? '34%'
                                                                            : (userInputChartValue10 == '2')
                                                                                ? '27%'
                                                                                : (userInputChartValue10 == '1')
                                                                                    ? '20%'
                                                                                    : "0"),
                                    
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
                      )
                    ],
                  )

                 
                ],
              ),
            ],
          ),
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