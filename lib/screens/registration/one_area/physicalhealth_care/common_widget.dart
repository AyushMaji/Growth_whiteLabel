import 'package:flutter/material.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhysicalHealthCare extends StatelessWidget {
  const PhysicalHealthCare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          getTranslated("on_scale_1_10", context),
          style: TextStyles.smallBoldTextStyle(context),
        ),
        SizedBox(height: 20.sp),
        Text(
          getTranslated("physical_health", context),
          style: TextStyles.smallBoldTextStyle(context),
        ),
        SizedBox(height: 10.sp),
        Text(getTranslated('with_my_fitness', context)),
      ],
    );
  }
}
