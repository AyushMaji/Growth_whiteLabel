import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/screens/visionboard/visionboard.dart';

class Successful extends StatefulWidget {
  static const String id = "Successful";
  const Successful({Key? key}) : super(key: key);

  @override
  State<Successful> createState() => _SuccessfulState();
}

class _SuccessfulState extends State<Successful> {
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                  'https://lottie.host/81093053-c2f3-4c45-aee1-16b34dfb7cc4/5moWYz1eIO.json'),
              SizedBox(height: 40.sp),
              SizedBox(height: 15.sp),
              const Text(
                "Thank you for contacting us!  we will get back to you soon",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.sp),
              SubmitButton(
                title: "OKAY",
                onPressed: () {
                  setState(() {
                    goPageWithName(context, VisionBoard.id);
                  });
                },
                buttonStyle: ButtonStyles.getCommonStyle(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
