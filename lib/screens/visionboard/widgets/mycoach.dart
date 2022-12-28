
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:olga/global/widgets/custom_widgets.dart';

class MyCoach extends StatefulWidget {
  const MyCoach({Key? key}) : super(key: key);

  @override
  State<MyCoach> createState() => _MyCoachState();
}

class _MyCoachState extends State<MyCoach> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Lottie.network(
                                'https://lottie.host/2373362d-f314-4066-a3b1-b411e7d36eb7/2KT3X5x2I1.json'),
    ],);
  }
}