// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:olga/models/data_model/goal_data_model.dart';
import 'package:olga/models/data_model/profile_model.dart';
import 'package:olga/provider/visionboard_provider.dart';
import 'package:provider/provider.dart';
import 'package:olga/provider/profile_provider.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';

//
class Learn extends StatefulWidget {
  static const String id = "Learn";
  const Learn({Key? key}) : super(key: key);

  @override
  State<Learn> createState() => _LearnState();
}

class _LearnState extends State<Learn> {

  ProfileModel profileModel = ProfileModel();
  GoalDataModel goalDataModel = GoalDataModel();

  @override
  void initState() {
    super.initState();
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);

         VisionboardProvider visionboardProvider =
        Provider.of<VisionboardProvider>(context, listen: false);
    profileProvider.viewUserProfileDetails();

    visionboardProvider.viewGoalDetails();
  }

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);

         VisionboardProvider visionboardProvider =
        Provider.of<VisionboardProvider>(context, listen: false);

    return Material(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.network(
                                'https://lottie.host/2373362d-f314-4066-a3b1-b411e7d36eb7/2KT3X5x2I1.json'),
          //
          // Text("${visionboardProvider.goalData.msg}"),
          // Text("${visionboardProvider.goalData.statuscode}"),
          // //Text("${visionboardProvider.goalData.data?.goal}"),
          // Text("${visionboardProvider.goalData.data}"),
          // //Text("${visionboardProvider.goalData.data?.dailyAffirmation}"),
          ],
        ),
      ),
    );
  }
}
