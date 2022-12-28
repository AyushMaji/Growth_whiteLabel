// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/text_button.dart';
import 'package:olga/provider/auth_provider.dart';
import 'package:olga/provider/goal_planning_provider.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/registration/one_area/goal/upload_photo.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../provider/happy_life_provider.dart';

class TrackYourGoal extends StatefulWidget {
  static const String id = "/trackYourGoal";
  const TrackYourGoal({Key? key}) : super(key: key);

  @override
  State<TrackYourGoal> createState() => _TrackYourGoalState();
}

class _TrackYourGoalState extends State<TrackYourGoal> {
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //_startDateController.text = DateFormat('MM-dd-yyyy').format(DateTime.now());
    //_endDateController.text = DateFormat.yMd().format(DateTime.now());
  }

  bool isvisible = true;

  //===================================
  Future _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: selectedStartDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    if (picked != null) {
      setState(() {
        selectedStartDate = picked;
        _startDateController.text =
            DateFormat('dd/MM/yyyy').format(selectedStartDate);
      });
    }
  }

  Future _selectEndtDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: selectedEndDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    if (picked != null) {
      setState(() {
        selectedEndDate = picked;
        _endDateController.text =
            DateFormat('dd/MM/yyyy').format(selectedEndDate);
      });
    }
  }

  //====================================
  @override
  Widget build(BuildContext context) {
    final goalSetUp = Provider.of<StorageProvider>(context, listen: false);

    //*==========================  ======================*/
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff344765),
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
    //====================================================================================
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 85.h,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 17.0, right: 18, top: 10.h, bottom: 0),
                              child: Column(
                                children: [
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Text(
                                        "Active your ${goalSetUp.oneSelectedArea} goal",
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.sp,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Image.asset(
                              "assets/images/MouCrop.png", // full image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      //!========================================================>>> My goal=============================================
                      Positioned(
                        top: height < 365
                            ? 250.h // android 4.7 - 5.0
                            : height < 670
                                ? 210.h // iphone 6s
                                : height < 685
                                    ? 220.h // 5.5
                                    : height < 810
                                        ? 180.h // poco M3
                                        : height < 490
                                            ? 180.h
                                            : height < 1110 //moto g 52
                                                ? 190.h
                                                : 240.h,
                        right: 60.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "My Goal",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 12.sp,
                              ),
                            ),
    
                            //!
                            Container(
                              //color: Colors.green,
                              height: 60.h,
                              width: 105.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Flexible(
                                    child: Text(
                                      // "82KG"+
                                      goalSetUp.mainGoal,
                                      textAlign: TextAlign.end,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 7.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
    
                      // ===>>> 5th goal house
    
                      Positioned(
                        top: height < 365
                            ? 360.h // screen 4.7
                            : height < 670 // iphone 6s 4.7
                                ? 330.h
                                : height < 810
                                    ? 285.h // POCO M3
                                    : height < 485 // 480 <485
                                        ? 290.h // newscrenn height
                                        : height < 1110
                                            ? 285.h
                                            : 260.h, // by defulat
    
                        left: 285.w,
                        child: SizedBox(
                          height: 60.h,
                          width: 70.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  // "5th" +
                                  goalSetUp.fifthGoal,
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 7.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
    
                      //!=======>>>  4th goal house=========
                      //===>>> 4th goal house
    
                      Positioned(
                        top: height < 365
                            ? 440.h // screen 4.7
                            : height < 670 // iphone 6s 4.7
                                ? 405.h
                                : height < 810
                                    ? 350.h // poco m3
                                    : height < 490
                                        ? 360.h
                                        : height < 1110
                                            ? 345.h
                                            : 400.h,
                        left: 228.w,
                        child: SizedBox(
                          height: 60.h,
                          width: 120.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  // "4th" +
                                  goalSetUp.fourthGoal,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 7.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
    
                      //!=====>>> 3rd gola house====
                      // ===>>> 3rd gola house
    
                      Positioned(
                        top: height < 365
                            ? 515.h // screen 4.7 - 5.0
                            : height < 670 // ihone 6s 4.7
                                ? 475.h
                                : height < 810
                                    ? 410.h // POCO M3
                                    : height < 490
                                        ? 410.h
                                        : height < 490
                                            ? 410.h
                                            : height < 1110
                                                ? 400.h
                                                : 460.h,
                        left: 160.w,
                        child: SizedBox(
                          height: 60.h,
                          width: 170.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  //"3rd" +
                                  goalSetUp.thirdGoal,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 7.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
    
                      //!=============>>> 2nd goal house=====
                      //===>>> 2nd goal house
    
                      Positioned(
                        top: height < 365
                            ? 590.h // screen 4.7
    
                            : height < 670 // iphone 6s 4.7
                                ? 540.h
                                : height < 810
                                    ? 465.h // poco m3
    
                                    : height < 490
                                        ? 469.h
                                        : height < 1110
                                            ? 455.h
                                            : 530.h,
                        left: 105.w,
                        child: SizedBox(
                          height: 60.h,
                          width: 170.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  //"2nd" +
                                  goalSetUp.secondGoal,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 7.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
    
                      //  background
                      //!========================================================>>> 1st goal house=============================================
                      //===>>>  1st goal house
    
                      Positioned(
                        top: height < 365
                            ? 660.h // screen 4.7
    
                            : height < 670 // iphone 6s 4.7
                                ? 600.h
                                : height < 810
                                    ? 520.h // poco m3
    
                                    : height < 490
                                        ? 525.h
                                        : height < 1110
                                            ? 505.h
                                            : 680.h,
                        left: 30.w,
                        child: Container(
                          //color: Colors.green,
                          height: 70.h,
                          width: 320.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                  //"1st" +
                                  goalSetUp.firstGoal,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 7.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //
                    ],
                  ),
    
                  //
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 17, bottom: 0, right: 23),
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text: 'Tracking ',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                    text:
                                        "Set your start and end dates for your goal",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w300)),
                                // TextSpan(text: ' world!'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Start Time",
                                    style: TextStyles.smallWhiteBoldTextStyle(
                                        context),
                                  ),
                                  TextFormField(
                                    controller: _startDateController,
                                    keyboardType: TextInputType.none,
                                    onTap: () {
                                      setState(() {
                                        _selectStartDate(context);
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'DD/MM/YYYY',
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _selectStartDate(context);
                                          });
                                        },
                                        icon: const Icon(Icons.calendar_month),
                                        color: Colors.black,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Start Date can't be empty!";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      //
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("End Time",
                                      style: TextStyles.smallWhiteBoldTextStyle(
                                          context)),
                                  TextFormField(
                                    controller: _endDateController,
                                    keyboardType: TextInputType.none,
                                    onTap: () {
                                      setState(() {
                                        _selectEndtDate(context);
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'DD/MM/YYYY',
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _selectEndtDate(context);
                                          });
                                        },
                                        icon: const Icon(Icons.calendar_month),
                                        color: Colors.black,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "End Date can't be empty!";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      //
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextBtn(
                            title: "Submit",
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
    
                              String _startDate = DateFormat('MM/dd/yyyy')
                                  .format(selectedStartDate);
                              String _endDate = DateFormat('MM/dd/yyyy')
                                  .format(selectedEndDate);
                              goalSetUp.changeStartDate(_startDate);
                              goalSetUp.changeEndDate(_endDate);
                              print(" =============== >>>>> ");
                              print(_startDate);
                              print("===============");
                              print(_endDate);
                              print(" <<<<< =============== ");
    
                              final _happyLifeSurveyId =
                                  Provider.of<HappyLifeSurvey>(context,
                                      listen: false);
                              _happyLifeSurveyId.happyLifeId;
                              print(
                                  "here is the happy life survey ID ===>>> ${_happyLifeSurveyId.happyLifeId}");
                              Provider.of<StorageProvider>(context, listen: false)
                                  .registrationSafetyNet(route: UploadPhoto.id);
                              Provider.of<GoalPlanningProvider>(context, listen: false).createaGoal(
                                  happyLifeSurveyId:
                                      _happyLifeSurveyId.happyLifeId.toString(),
                                  goalCategory: prefs.getString("oneSelectedAreaId") ??
                                      goalSetUp.oneSelectedAreaId,
                                  goal: prefs.getString("mainGoal") ??
                                      goalSetUp.mainGoal,
                                  dailyAffirmation: prefs.getString("mindset") ??
                                      goalSetUp.mindset,
                                  promiseToAchieveGoal:
                                      prefs.getString("assurance") ??
                                          goalSetUp.assurance,
                                  firstStepToAchieveGoal:
                                      prefs.getString("firstGoal") ??
                                          goalSetUp.firstGoal,
                                  secondStepToAchieveGoal:
                                      prefs.getString("secondGoal") ??
                                          goalSetUp.secondGoal,
                                  thirdStepToAchieveGoal:
                                      prefs.getString("thirdGoal") ??
                                          goalSetUp.thirdGoal,
                                  fourthStepToAchieveGoal:
                                      prefs.getString("fourthGoal") ??
                                          goalSetUp.fourthGoal,
                                  fifthStepToAchieveGoal:
                                      prefs.getString("fifthGoal") ?? goalSetUp.fifthGoal,
                                  goalStartDate: _startDate,
                                  goalEndDate: _endDate,
                                  context: context);
                              // goPageWithName(context, UploadPhoto.id);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
