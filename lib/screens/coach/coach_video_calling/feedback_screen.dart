import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/color_resources.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:olga/screens/coach/coach_video_calling/appointments_screen.dart';
import '../../../localization/language_constrants.dart';
import '../../visionboard/visionboard.dart';

class FeedBackScreen extends StatefulWidget {
  static const id = '/feedBackScreen';
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  final _textController = TextEditingController();
  var _audioRating = 0.0;
  Color? color;
  bool _isSelected = false;
  String _title = "Vision Dashboard";
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const NoBackPressAppbar(),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   getTranslated("give_feedback_and_rate", context),
              // )
              SizedBox(height: 10.h),
              Text(
                'Give Feedback & Rate',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorResources.getRed(context),
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'If you would like to leave us a message or a comment, please use the “Message” box below. ',
                style: TextStyle(
                  color: Color(0xffB3B3B3),
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Message',
                style: TextStyle(
                    color: Color(0xff2E2E2E),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5.h),
              TextField(
                controller: _textController,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff2E2E2E), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff2E2E2E), width: 1),
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Audio Quality',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  RatingBar.builder(
                    updateOnDrag: true,
                    itemSize: 25,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, _) =>
                        const Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) => setState(() {
                      _audioRating = rating;
                    }),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Video Quality',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  RatingBar.builder(
                    updateOnDrag: true,
                    itemSize: 25,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, _) =>
                        const Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) => setState(() {
                      _audioRating = rating;
                    }),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Body Language',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  RatingBar.builder(
                    updateOnDrag: true,
                    itemSize: 25,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, _) =>
                        const Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) => setState(() {
                      _audioRating = rating;
                    }),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Overall Experience',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  RatingBar.builder(
                    updateOnDrag: true,
                    itemSize: 25,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, _) =>
                        const Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (rating) => setState(() {
                      _audioRating = rating;
                    }),
                  )
                ],
              ),
              SizedBox(height: 40.h),
              SubmitButton(
                title: getTranslated('submit', context),
                onPressed: () {
                  goPage(context, const VisionBoard());
                },
                buttonStyle: ButtonStyles.getCommonStyle(context),
              ),
              SizedBox(height: 10.h),
              SubmitButton(
                title: getTranslated('maybe_next_time', context),
                onPressed: () {
                  goPage(context, const AppointmentsScreen());
                },
                buttonStyle: ButtonStyles.getLightGreyStyle(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
