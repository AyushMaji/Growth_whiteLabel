// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:olga/screens/visionboard/visionboard.dart';

class FeedBackScreenAnimated extends StatefulWidget {
  const FeedBackScreenAnimated({Key? key}) : super(key: key);

  @override
  State<FeedBackScreenAnimated> createState() => _FeedBackScreenAnimatedState();
}

class _FeedBackScreenAnimatedState extends State<FeedBackScreenAnimated> {
  @override
  void initState() {
    super.initState();
    _navigateToVisionBoard();
  }

  _navigateToVisionBoard() async {
    await Future.delayed(const Duration(milliseconds: 3200), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const VisionBoard()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Lottie.asset('assets/images/thank-you2.json'),
        ),
      ),
    );
  }
}
