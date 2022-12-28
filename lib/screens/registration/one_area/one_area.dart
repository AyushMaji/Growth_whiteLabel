// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:olga/screens/registration/one_area/physicalhealth_care/weight_screen.dart';
import 'package:olga/screens/registration/one_area/spirituality/spirituality.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/box_decoration.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/registration/one_area/one_area_video.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../global/constants/images.dart';
import '../../../provider/goal_planning_provider.dart';
import '../../visionboard/visionboard.dart';
import 'career_work/career_work.dart';
import 'common/quesion_one.dart';
import 'emotional_health/emotional_health.dart';
import 'family/family.dart';
import 'finances/finance.dart';
import 'friends/friends.dart';
import 'hobbies_fun/hobbies_fun.dart';
import 'living_env/living_env.dart';

class OneArea extends StatefulWidget {
  static const String id = "/oneArea";
  const OneArea({Key? key}) : super(key: key);

  @override
  State<OneArea> createState() => _OneAreaState();
}

class _OneAreaState extends State<OneArea> {
  //
  bool _romanceIntimacy = true;
  bool _friends = true;
  bool _family = true;
  bool _physicalHealth = true;
  bool _hobbiesFun = true;
  bool _finances = true;
  bool _emotionalHealth = true;
  bool _careerWork = true;
  bool _spirituality = true;
  bool _livingEnv = true;
  bool _isChecked = false;

  String oneSelectedAre = "";
  String oneSelectedAreId = "";

  void _loadGoalCategoryData(context) async {

    final goalPlanningProvider = Provider.of<GoalPlanningProvider>(context, listen: false);
    goalPlanningProvider.getAllGoalCategories();
    print("category ==>> ${goalPlanningProvider.getGoalsModel.msg}");
  
  }

  @override
  void initState() {
    super.initState();
    Provider.of<StorageProvider>(context, listen: false).audioSpeak("From your life wheel, select the first area you would like to start working on to help you move towards your ideal life");


  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadGoalCategoryData(context);
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
    onWillPop: () => onWillPopWarningInClass(context),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Image.asset(Images.appBarBG, fit: BoxFit.cover, height: MediaQuery.of(context).size.height),
          leadingWidth: 20.w,
          leading: IconButton(
            onPressed: () {
            setState(() {
              onWillPopWarningInClass(context);              
            });
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          title: Text(
            getTranslated('back', context),
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          actions: [
            //!========================================= For Text To Speach ====================================
          Provider.of<StorageProvider>(context, listen: true).isAudio==true?
          IconButton(
          icon: Icon(Icons.volume_up,color: Colors.white,),
          onPressed: () {
            Provider.of<StorageProvider>(context, listen: false).changeAudio(false);
          },
        )
        
        : 
          IconButton(
          icon: Icon(Icons.volume_off,color: Colors.white,),
          onPressed: () {
             Provider.of<StorageProvider>(context, listen: false).changeAudio(true);
          
          },
        )
        //!========================================= For Text To Speach ====================================
          ],
        ),
        body: Consumer<GoalPlanningProvider>(
              builder: (context, goalPlanningProvider, child) {
                return  Consumer<StorageProvider>(
              builder: (context, storeValues, child) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(15.w),
                    child: Column(
                      children: [
                        //Text("${_goalPlanningProvider.getGoalsModel.data?.goalCategories?[0].id}".toString()),
                        //Text("${_goalPlanningProvider.getGoalsModel.data?.goalCategories?[0].category}".toString()),
                        Row(
                          children: [
                            SizedBox(height: 10.h),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: Text(
                                 // getTranslated('life_wheel', context),
                                 "From your life wheel, select the first area you would like to start working on to help you move towards your ideal life",
                                  style: TextStyles.smallBoldTextStyle(context),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Flexible(child: WheelWidget()),
                          ],
                        ),
                        SizedBox(height: 10.sp),
              
                        //
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: _romanceIntimacy ? normalBox : creamBgBox,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _romanceIntimacy = !_romanceIntimacy;
                                    _friends = true;
                                    _family = true;
                                    _physicalHealth = true;
                                    _hobbiesFun = true;
                                    _finances = true;
                                    _emotionalHealth = true;
                                    _careerWork = true;
                                    _spirituality = true;
                                    _livingEnv = true;
                                    _isChecked = true;
                                    oneSelectedAre = "Romance & Intimacy";
                                    oneSelectedAreId = "9";
                                    print("now selected ===>>> $oneSelectedAre");
                                    
                                    Provider.of<StorageProvider>(context, listen: false).audioSpeak(oneSelectedAre);

                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(12.sp),
                                  child: Text(
                                    getTranslated('romance_intimacy', context),
                                    style: TextStyle(
                                        color: _romanceIntimacy
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5.sp),
              
                            //
                            Flexible(
                              child: Container(
                                decoration: _friends ? normalBox : creamBgBox,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _romanceIntimacy = true;
                                      _friends = !_friends;
                                      _family = true;
                                      _physicalHealth = true;
                                      _hobbiesFun = true;
                                      _finances = true;
                                      _emotionalHealth = true;
                                      _careerWork = true;
                                      _spirituality = true;
                                      _livingEnv = true;
                                      _isChecked = true;
                                      oneSelectedAre = "Friends";
                                      oneSelectedAreId = "5";
                                      print("now selected ===>>> $oneSelectedAre");
                                      print("now selected id ===>>> $oneSelectedAreId");
                                      Provider.of<StorageProvider>(context, listen: false).audioSpeak(oneSelectedAre);
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(12.sp),
                                    child: Text(
                                      getTranslated('friends', context),
                                      style: TextStyle(
                                          color: _friends ? Colors.black : Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.sp),
              
                        Row(
                          children: [
                            Flexible(
                              child: Container(
                                decoration: _family ? normalBox : creamBgBox,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _romanceIntimacy = true;
                                      _friends = true;
                                      _family = !_family;
                                      _physicalHealth = true;
                                      _hobbiesFun = true;
                                      _finances = true;
                                      _emotionalHealth = true;
                                      _careerWork = true;
                                      _spirituality = true;
                                      _livingEnv = true;
                                      _isChecked = true;
                                      oneSelectedAre = "Family";
                                      oneSelectedAreId = "3";
                                      Provider.of<StorageProvider>(context, listen: false).audioSpeak(oneSelectedAre);
        
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(12.sp),
                                    child: Text(
                                      getTranslated('family', context),
                                      style: TextStyle(
                                          color: _family ? Colors.black : Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5.sp),
                            Container(
                              decoration: _physicalHealth ? normalBox : creamBgBox,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _romanceIntimacy = true;
                                    _friends = true;
                                    _family = true;
                                    _physicalHealth = !_physicalHealth;
                                    _hobbiesFun = true;
                                    _finances = true;
                                    _emotionalHealth = true;
                                    _careerWork = true;
                                    _spirituality = true;
                                    _livingEnv = true;
                                    _isChecked = true;
                                    oneSelectedAre = "Physical Health & Self-care";
                                    oneSelectedAreId = "8";
                                    Provider.of<StorageProvider>(context, listen: false).audioSpeak(oneSelectedAre);
        
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(12.sp),
                                  child: Text(
                                    getTranslated('physical_health', context),
                                    style: TextStyle(
                                        color: _physicalHealth
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.sp),
              
                        //
                        Row(
                          children: [
                            Container(
                              decoration: _hobbiesFun ? normalBox : creamBgBox,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _romanceIntimacy = true;
                                    _friends = true;
                                    _family = true;
                                    _physicalHealth = true;
                                    _hobbiesFun = !_hobbiesFun;
                                    _finances = true;
                                    _emotionalHealth = true;
                                    _careerWork = true;
                                    _spirituality = true;
                                    _livingEnv = true;
                                    _isChecked = true;
                                    oneSelectedAre = "Hobbies/Recreation/Fun";
                                    oneSelectedAreId = "6";
                                    Provider.of<StorageProvider>(context, listen: false).audioSpeak(oneSelectedAre);
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(12.sp),
                                  child: Text(
                                    getTranslated('hobbies_fun', context),
                                    style: TextStyle(
                                        color: _hobbiesFun ? Colors.black : Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5.sp),
                            Flexible(
                              child: Container(
                                decoration: _finances ? normalBox : creamBgBox,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _romanceIntimacy = true;
                                      _friends = true;
                                      _family = true;
                                      _physicalHealth = true;
                                      _hobbiesFun = true;
                                      _finances = !_finances;
                                      _emotionalHealth = true;
                                      _careerWork = true;
                                      _spirituality = true;
                                      _livingEnv = true;
                                      _isChecked = true;
                                      oneSelectedAre = "Finances";
                                      oneSelectedAreId = "4";
                                      Provider.of<StorageProvider>(context, listen: false).audioSpeak(oneSelectedAre);
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(12.sp),
                                    child: Text(
                                      getTranslated('finance', context),
                                      style: TextStyle(
                                          color: _finances ? Colors.black : Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.sp),
              
                        //
                        Row(
                          children: [
                            Flexible(
                                child: Container(
                                    decoration: _emotionalHealth ? normalBox : creamBgBox,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _romanceIntimacy = true;
                                          _friends = true;
                                          _family = true;
                                          _physicalHealth = true;
                                          _hobbiesFun = true;
                                          _finances = true;
                                          _emotionalHealth = !_emotionalHealth;
                                          _careerWork = true;
                                          _spirituality = true;
                                          _livingEnv = true;
                                          _isChecked = true;
                                          oneSelectedAre = "Emotional Health";
                                          oneSelectedAreId = "2";
                                          Provider.of<StorageProvider>(context, listen: false).audioSpeak(oneSelectedAre);
                                        });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(12.sp),
                                        child: Text(
                                          getTranslated('emotional_health', context),
                                          style: TextStyle(
                                              color: _emotionalHealth
                                                  ? Colors.black
                                                  : Colors.white),
                                        ),
                                      ),
                                    ))),
                            SizedBox(width: 5.sp),
                            Flexible(
                              child: Container(
                                decoration: _careerWork ? normalBox : creamBgBox,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _romanceIntimacy = true;
                                      _friends = true;
                                      _family = true;
                                      _physicalHealth = true;
                                      _hobbiesFun = true;
                                      _finances = true;
                                      _emotionalHealth = true;
                                      _careerWork = !_careerWork;
                                      _spirituality = true;
                                      _livingEnv = true;
                                      _isChecked = true;
                                      oneSelectedAre = "Career & Work";
                                      oneSelectedAreId = "1";  
                                      Provider.of<StorageProvider>(context, listen: false).audioSpeak(oneSelectedAre);     
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(12.sp),
                                    child: Text(
                                      getTranslated('career_work', context),
                                      style: TextStyle(
                                          color:  _careerWork ? Colors.black : Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.sp),
              
                        //
                        Row(
                          children: [
                            Flexible(
                              child: Container(
                                decoration: _spirituality ? normalBox : creamBgBox,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _romanceIntimacy = true;
                                      _friends = true;
                                      _family = true;
                                      _physicalHealth = true;
                                      _hobbiesFun = true;
                                      _finances = true;
                                      _emotionalHealth = true;
                                      _careerWork = true;
                                      _spirituality = !_spirituality;
                                      _livingEnv = true;
                                      _isChecked = true;
                                      oneSelectedAre = "Spirituality";
                                      oneSelectedAreId = "10";
                                      Provider.of<StorageProvider>(context, listen: false).audioSpeak(oneSelectedAre);
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(12.sp),
                                    child: Text(getTranslated('spirituality', context),
                                      style: TextStyle(
                                          color: _spirituality
                                              ? Colors.black
                                              : Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5.sp),
                            Flexible(
                              child: Container(
                                decoration: _livingEnv ? normalBox : creamBgBox,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _romanceIntimacy = true;
                                      _friends = true;
                                      _family = true;
                                      _physicalHealth = true;
                                      _hobbiesFun = true;
                                      _finances = true;
                                      _emotionalHealth = true;
                                      _careerWork = true;
                                      _spirituality = true;
                                      _livingEnv = !_livingEnv;
                                      _isChecked = true;
                                      oneSelectedAre = "Living Environment";
                                      oneSelectedAreId = "7";
                                      Provider.of<StorageProvider>(context, listen: false).audioSpeak(oneSelectedAre);
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(12.sp),
                                    child: Text(
                                      getTranslated('living_env', context),
                                      style: TextStyle(
                                          color:
                                              _livingEnv ? Colors.black : Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 60.sp),
                      ],
                    ),
                  ),
                );
            }
          );
          }
        ),
        bottomSheet:  Consumer<StorageProvider>(builder: (context, _storeValues, child){
       return Padding(
          padding: EdgeInsets.fromLTRB(15.sp, 0, 15.sp, 15.sp),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 40.h,
            child: ElevatedButton(
              style: ButtonStyles.getCommonStyle(context),
              onPressed: _isChecked
                  ? () {
                      print("now selected ===>>> $oneSelectedAre");
                      print("now selected Id ===>>> $oneSelectedAreId");
                      final storeValues = Provider.of<StorageProvider>(context, listen: false);
                      storeValues.addOneSelectedAre(oneSelectedAre);
                      storeValues.updateSelectedAreId(oneSelectedAreId);
                  //     Provider.of<StorageProvider>(context, listen: false)
                  // .registrationSafetyNet(route: OneAreaVideo.id);
                  //     goPageWithName(context, OneAreaVideo.id);
                      print("===>>> going to user choice screen");
                      if (_storeValues.oneSelectedArea ==
                                "Romance & Intimacy") {
                              Provider.of<StorageProvider>(context,
                                      listen: false)
                                  .registrationSafetyNet(
                                      route: RomanceIntimacyGoal.id);
                              goPageWithName(context, RomanceIntimacyGoal.id);
                              print("romanceIntimacy");
                            } else if (_storeValues.oneSelectedArea ==
                                "Friends") {
                              Provider.of<StorageProvider>(context,
                                      listen: false)
                                  .registrationSafetyNet(route: Friends.id);
                              goPageWithName(context, Friends.id);
                              print("friends");
                            } else if (_storeValues.oneSelectedArea ==
                                "Family") {
                              Provider.of<StorageProvider>(context,
                                      listen: false)
                                  .registrationSafetyNet(route: Family.id);
                              goPageWithName(context, Family.id);
                              print("family");
                            } else if (_storeValues.oneSelectedArea ==
                                "Physical Health & Self-care") {
                              Provider.of<StorageProvider>(context,
                                      listen: false)
                                  .registrationSafetyNet(
                                      route: WeightScreen.id);
                              goPageWithName(context, WeightScreen.id);
                              print("physicalHealth");
                            } else if (_storeValues.oneSelectedArea ==
                                "Hobbies/Recreation/Fun") {
                              Provider.of<StorageProvider>(context,
                                      listen: false)
                                  .registrationSafetyNet(route: HobbiesFun.id);
                              goPageWithName(context, HobbiesFun.id);
                              print("hobbiesFun");
                            } else if (_storeValues.oneSelectedArea ==
                                "Finances") {
                              Provider.of<StorageProvider>(context,
                                      listen: false)
                                  .registrationSafetyNet(route: Finances.id);
                              goPageWithName(context, Finances.id);
                              print("finances");
                            } else if (_storeValues.oneSelectedArea ==
                                "Emotional Health") {
                              Provider.of<StorageProvider>(context,
                                      listen: false)
                                  .registrationSafetyNet(
                                      route: EmotionalHealth.id);
                              goPageWithName(context, EmotionalHealth.id);
                              print("emotionalHealth");
                            } else if (_storeValues.oneSelectedArea ==
                                "Career & Work") {
                              Provider.of<StorageProvider>(context,
                                      listen: false)
                                  .registrationSafetyNet(route: CareerWork.id);
                              goPageWithName(context, CareerWork.id);
                              print("careerWork");
                            } else if (_storeValues.oneSelectedArea ==
                                "Spirituality") {
                              Provider.of<StorageProvider>(context,
                                      listen: false)
                                  .registrationSafetyNet(
                                      route: Spirituality.id);
                              goPageWithName(context, Spirituality.id);
                              print("spirituality");
                            } else if (_storeValues.oneSelectedArea ==
                                "Living Environment") {
                              Provider.of<StorageProvider>(context,
                                      listen: false)
                                  .registrationSafetyNet(route: LivingEnv.id);
                              goPageWithName(context, LivingEnv.id);
                              print("livingEnv");
                            } else {
                              print("this area is not selected");
                            }
                    }
                  : null,
              child: Text(
                getTranslated("submit", context).toUpperCase(),
              ),
            ),
          ),
        );}
      ),
    ));
  }
}

class WheelWidget extends StatelessWidget {
  const WheelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StorageProvider storeValues =
        Provider.of<StorageProvider>(context, listen: false);
    String friend = storeValues.friendsValue;
    String family = storeValues.familyValue;
    var size = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 160,
      width: 160,
      //width: double.infinity,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: size < 370 ? 5 : 8,
              child: Image.asset(
                "assets/images/Wheel.png",
                height: 155,
              )),
          Positioned(
            top: 1.5,
            left: size < 370 ? -72 : -75,
            child: SizedBox(
              height: 150,
              child: Transform(
                transform: Matrix4.rotationZ(0.320000),
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
                        radius: '30%',
                        dataSource: <ChartData>[
                          ChartData(
                              'USA',
                              9,
                              ((storeValues.friendsValue) == '10')
                                  ? '93%'
                                  : (storeValues.friendsValue == '9')
                                      ? '85%'
                                      : (storeValues.friendsValue == '8')
                                          ? '79%'
                                          : (storeValues.friendsValue == '7')
                                              ? '71%'
                                              : (storeValues.friendsValue ==
                                                      '6')
                                                  ? '63%'
                                                  : (storeValues.friendsValue ==
                                                          '5')
                                                      ? '55%'
                                                      : (storeValues
                                                                  .friendsValue ==
                                                              '4')
                                                          ? '47%'
                                                          : (storeValues
                                                                      .friendsValue ==
                                                                  '3')
                                                              ? '39%'
                                                              : (storeValues
                                                                          .friendsValue ==
                                                                      '2')
                                                                  ? '31%'
                                                                  : (storeValues
                                                                              .friendsValue ==
                                                                          '1')
                                                                      ? '23%'
                                                                      : "0"),
                         
                          ChartData(
                              'USA',
                              9,
                              (storeValues.familyValue == '10')
                                  ? '93%'
                                  : (storeValues.familyValue == '9')
                                      ? '85%'
                                      : (storeValues.familyValue == '8')
                                          ? '79%'
                                          : (storeValues.familyValue == '7')
                                              ? '71%'
                                              : (storeValues.familyValue == '6')
                                                  ? '63%'
                                                  : (storeValues.familyValue ==
                                                          '5')
                                                      ? '55%'
                                                      : (storeValues
                                                                  .familyValue ==
                                                              '4')
                                                          ? '47%'
                                                          : (storeValues
                                                                      .familyValue ==
                                                                  '3')
                                                              ? '39%'
                                                              : (storeValues
                                                                          .familyValue ==
                                                                      '2')
                                                                  ? '31%'
                                                                  : (storeValues
                                                                              .familyValue ==
                                                                          '1')
                                                                      ? '24%'
                                                                      : "0"),
                          ChartData(
                              'USA',
                              9,
                              (storeValues.romance == '10')
                                  ? '93%'
                                  : (storeValues.romance == '9')
                                      ? '85%'
                                      : (storeValues.romance == '8')
                                          ? '79%'
                                          : (storeValues.romance == '7')
                                              ? '71%'
                                              : (storeValues.romance == '6')
                                                  ? '63%'
                                                  : (storeValues.romance == '5')
                                                      ? '55%'
                                                      : (storeValues.romance ==
                                                              '4')
                                                          ? '47%'
                                                          : (storeValues
                                                                      .romance ==
                                                                  '3')
                                                              ? '39%'
                                                              : (storeValues
                                                                          .romance ==
                                                                      '2')
                                                                  ? '31%'
                                                                  : (storeValues
                                                                              .romance ==
                                                                          '1')
                                                                      ? '24%'
                                                                      : "0"),
                          ChartData(
                              'USA',
                              9,
                              (storeValues.finances == '10')
                                  ? '93%'
                                  : (storeValues.finances == '9')
                                      ? '85%'
                                      : (storeValues.finances == '8')
                                          ? '79%'
                                          : (storeValues.finances == '7')
                                              ? '71%'
                                              : (storeValues.finances == '6')
                                                  ? '63%'
                                                  : (storeValues.finances ==
                                                          '5')
                                                      ? '55%'
                                                      : (storeValues.finances ==
                                                              '4')
                                                          ? '47%'
                                                          : (storeValues
                                                                      .finances ==
                                                                  '3')
                                                              ? '39%'
                                                              : (storeValues
                                                                          .finances ==
                                                                      '2')
                                                                  ? '31%'
                                                                  : (storeValues
                                                                              .finances ==
                                                                          '1')
                                                                      ? '24%'
                                                                      : "0"),
                          ChartData(
                              'USA',
                              9,
                              (storeValues.physicalHealth == '10')
                                  ? '93%'
                                  : (storeValues.physicalHealth == '9')
                                      ? '85%'
                                      : (storeValues.physicalHealth == '8')
                                          ? '79%'
                                          : (storeValues.physicalHealth == '7')
                                              ? '71%'
                                              : (storeValues.physicalHealth ==
                                                      '6')
                                                  ? '63%'
                                                  : (storeValues
                                                              .physicalHealth ==
                                                          '5')
                                                      ? '55%'
                                                      : (storeValues
                                                                  .physicalHealth ==
                                                              '4')
                                                          ? '47%'
                                                          : (storeValues
                                                                      .physicalHealth ==
                                                                  '3')
                                                              ? '39%'
                                                              : (storeValues
                                                                          .physicalHealth ==
                                                                      '2')
                                                                  ? '31%'
                                                                  : (storeValues
                                                                              .physicalHealth ==
                                                                          '1')
                                                                      ? '24%'
                                                                      : "0"),
                          ChartData(
                              'USA',
                              9,
                              (storeValues.hobbies == '10')
                                  ? '93%'
                                  : (storeValues.hobbies == '9')
                                      ? '85%'
                                      : (storeValues.hobbies == '8')
                                          ? '79%'
                                          : (storeValues.hobbies == '7')
                                              ? '71%'
                                              : (storeValues.hobbies == '6')
                                                  ? '63%'
                                                  : (storeValues.hobbies == '5')
                                                      ? '55%'
                                                      : (storeValues.hobbies ==
                                                              '4')
                                                          ? '47%'
                                                          : (storeValues
                                                                      .hobbies ==
                                                                  '3')
                                                              ? '39%'
                                                              : (storeValues
                                                                          .hobbies ==
                                                                      '2')
                                                                  ? '31%'
                                                                  : (storeValues
                                                                              .hobbies ==
                                                                          '1')
                                                                      ? '24%'
                                                                      : "0"),
                          ChartData(
                              'USA',
                              9,
                              (storeValues.emotionalHealth == '10')
                                  ? '93%'
                                  : (storeValues.emotionalHealth == '9')
                                      ? '85%'
                                      : (storeValues.emotionalHealth == '8')
                                          ? '79%'
                                          : (storeValues.emotionalHealth == '7')
                                              ? '71%'
                                              : (storeValues.emotionalHealth ==
                                                      '6')
                                                  ? '63%'
                                                  : (storeValues
                                                              .emotionalHealth ==
                                                          '5')
                                                      ? '55%'
                                                      : (storeValues
                                                                  .emotionalHealth ==
                                                              '4')
                                                          ? '47%'
                                                          : (storeValues
                                                                      .emotionalHealth ==
                                                                  '3')
                                                              ? '39%'
                                                              : (storeValues
                                                                          .emotionalHealth ==
                                                                      '2')
                                                                  ? '31%'
                                                                  : (storeValues
                                                                              .emotionalHealth ==
                                                                          '1')
                                                                      ? '24%'
                                                                      : "0"),
                          ChartData(
                              'USA',
                              9,
                              (storeValues.career == '10')
                                  ? '93%'
                                  : (storeValues.career == '9')
                                      ? '85%'
                                      : (storeValues.career == '8')
                                          ? '77%'
                                          : (storeValues.career == '7')
                                              ? '71%'
                                              : (storeValues.career == '6')
                                                  ? '63%'
                                                  : (storeValues.career == '5')
                                                      ? '55%'
                                                      : (storeValues.career ==
                                                              '4')
                                                          ? '47%'
                                                          : (storeValues
                                                                      .career ==
                                                                  '3')
                                                              ? '39%'
                                                              : (storeValues
                                                                          .career ==
                                                                      '2')
                                                                  ? '31%'
                                                                  : (storeValues
                                                                              .career ==
                                                                          '1')
                                                                      ? '24%'
                                                                      : "0"),
                          ChartData(
                              'USA',
                              9,
                              (storeValues.spiritual == '10')
                                  ? '93%'
                                  : (storeValues.spiritual == '9')
                                      ? '85%'
                                      : (storeValues.spiritual == '8')
                                          ? '79%'
                                          : (storeValues.spiritual == '7')
                                              ? '71%'
                                              : (storeValues.spiritual == '6')
                                                  ? '63%'
                                                  : (storeValues.spiritual ==
                                                          '5')
                                                      ? '55%'
                                                      : (storeValues
                                                                  .spiritual ==
                                                              '4')
                                                          ? '47%'
                                                          : (storeValues
                                                                      .spiritual ==
                                                                  '3')
                                                              ? '39%'
                                                              : (storeValues
                                                                          .spiritual ==
                                                                      '2')
                                                                  ? '31%'
                                                                  : (storeValues
                                                                              .spiritual ==
                                                                          '1')
                                                                      ? '24%'
                                                                      : "0"),
                          ChartData(
                              'USA',
                              9,
                              (storeValues.livingEnv == '10')
                                  ? '93%'
                                  : (storeValues.livingEnv == '9')
                                      ? '85%'
                                      : (storeValues.livingEnv == '8')
                                          ? '79%'
                                          : (storeValues.livingEnv == '7')
                                              ? '71%'
                                              : (storeValues.livingEnv == '6')
                                                  ? '63%'
                                                  : (storeValues.livingEnv ==
                                                          '5')
                                                      ? '55%'
                                                      : (storeValues
                                                                  .livingEnv ==
                                                              '4')
                                                          ? '47%'
                                                          : (storeValues
                                                                      .livingEnv ==
                                                                  '3')
                                                              ? '39%'
                                                              : (storeValues
                                                                          .livingEnv ==
                                                                      '2')
                                                                  ? '31%'
                                                                  : (storeValues
                                                                              .livingEnv ==
                                                                          '1')
                                                                      ? '24%'
                                                                      : "0"),

                          //
                        ],
                        xValueMapper: (ChartData data, _) => data.xVal,
                        yValueMapper: (ChartData data, _) => data.yVal,
                        pointRadiusMapper: (ChartData data, _) => data.radius,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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

//* ======== |> will be back where we want || for ios app <| ========== */
Future<bool> onWillPopWarningInClass(BuildContext context) async {
  return (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // insetPadding: EdgeInsets.zero,
            elevation: 0,
            title: Center(
              child: Text(
                "Attention",
                style: TextStyles.boldTextStyle(context),
              ),
            ),
            content: Text("By clicking continue you will be redirected to your Vision Board",
              //getTranslated("strat_from_initial", context),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            goPageWithName(context, VisionBoard.id);
                          },
                          child: Text("Continue",
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          width: 1.0,
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancel"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      )) ??
      false;
}
