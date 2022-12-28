import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/images.dart';

BoxDecoration imageBoxDecoration(color) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(5.0),
    border: Border.all(width: 0.5.sp),
    image: const DecorationImage(
      image: AssetImage(Images.buttonBG),
      fit: BoxFit.cover,
    ),
    color: color,
  );
}

//:::::::::::::: DropDown Border Style
BoxDecoration dropDownBorder = BoxDecoration(
  borderRadius: BorderRadius.circular(6),
  border: Border.all(
    color: const Color(0xFF8E8E8E),
    style: BorderStyle.solid,
    width: 1.0,
  ),
);

//::::::::::::::
BoxDecoration normalBox = BoxDecoration(
  borderRadius: BorderRadius.circular(25),
  color: Color(0xFFE6E2DD),
);

//::::::::::::::
BoxDecoration creamBgBox = BoxDecoration(
  borderRadius: BorderRadius.circular(25),
  color: Color(0xFFDEB988),
);

//::::::::::::::
BoxDecoration pressedBox = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: const Color(0xFFDEB988),
);

//::::::::::::::
BoxDecoration boxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  color: const Color(0xFFDEB988),
);
//:::::::::::::: unselected box
BoxDecoration unSelectedbox = BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  color: const Color(0xFFE7E7E7),
);

//::::::::::::::
BoxDecoration genderBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(20.0),
  color: const Color(0xFFDEB988),
);
//:::::::::::::: unselected box
BoxDecoration genderUnSelectedbox = BoxDecoration(
  borderRadius: BorderRadius.circular(20.0),
  color: const Color(0xFFE7E7E7),
);

//::::::::::::::
BoxDecoration boxDecorationNormal = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  gradient: const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFFBA6E6E),
      Color(0xFFBA6E6E),
      Color(0xFFBA6E6E),
    ],
  ),
);

//:::::::::::::: Backup`
BoxDecoration boxDecorationBackup = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  gradient: const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFFB130AA),
      Color(0xFF362477),
      Color(0xFF362477),
    ],
  ),
);
