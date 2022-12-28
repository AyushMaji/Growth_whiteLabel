// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:olga/screens/registration/one_area/emotional_health/emotional_health.dart';
import 'package:olga/screens/registration/one_area/family/family.dart';
import 'package:olga/screens/registration/one_area/finances/finance.dart';
import 'package:olga/screens/registration/one_area/hobbies_fun/hobbies_fun.dart';
import 'package:olga/screens/registration/one_area/living_env/living_env.dart';
import 'package:olga/screens/registration/one_area/romance/romance_intimacy.dart';
import 'package:olga/screens/registration/one_area/spirituality/spirituality.dart';
import 'package:provider/provider.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/registration/one_area/physicalhealth_care/weight_screen.dart';
import 'package:video_player/video_player.dart';
import 'career_work/career_work.dart';
import 'friends/friends.dart';

class OneAreaVideo extends StatefulWidget {
  static const String id = "/oneAreaVideo";
  const OneAreaVideo({Key? key}) : super(key: key);

  @override
  State<OneAreaVideo> createState() => _OneAreaVideoState();
}

class _OneAreaVideoState extends State<OneAreaVideo> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    setState(() {
      _controller = VideoPlayerController.asset(
        Images.video2,
      )..initialize().then((_) {
          _controller.setLooping(true);
          _controller.value.isInitialized;
          _controller.value.isPlaying;
          _controller.play();
        });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(),
      ),
      body: Consumer<StorageProvider>(builder: (context, _storeValues, child) {
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _controller.value.isInitialized
                ? const SizedBox.shrink()
                : AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
            Positioned(
              top: 500.h,
              child: Container(
                  height: 120.h,
                  width: 367.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        // Color(0x9E616161),
                        // Color(0xFF616161),
                        Color(0xFF040404),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: TextButton(
                          onPressed: () {
                            _controller.pause();
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
                          },
                          child: Text(
                            "Skip This",
                            //style: TextStyle(color: Colors.white),
                            style: TextStyle(
                              //letterSpacing: 2,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                          child: Icon(
                        Icons.keyboard_double_arrow_right_outlined,
                        size: 22.sp,
                        color: Colors.white,
                      )),
                    ],
                  )),
            ),
          ],
        );
      }),
    );
  }
}
