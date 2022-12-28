import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRichText extends StatelessWidget {
  final String titleText;
  final String description;
  const CustomRichText({Key? key, required this.titleText, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        text: titleText,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ),
        children:  <TextSpan>[
          TextSpan(
              text: description,
              style: const TextStyle(fontWeight: FontWeight.w300)),
          // TextSpan(text: ' world!'),
        ],
      ),
    );
  }
}
