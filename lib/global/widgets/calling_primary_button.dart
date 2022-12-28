import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/color_resources.dart';

class VideoCallingPrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData? icon;
  //final Color? color;

  const VideoCallingPrimaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.icon,
    //required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 45.h,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon(icon),
            // SizedBox(
            //   width: 15.w,
            // ),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16.sm,
                fontWeight: FontWeight.bold,
              ),
            ),
            // const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            ColorResources.getVideoButtonCalicoColor(context),
          ),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
    );
  }
}
