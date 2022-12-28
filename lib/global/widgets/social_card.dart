import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class SocalCard extends StatelessWidget {
  const SocalCard({
    Key? key,
    this.icon,
    this.press,
  }) : super(key: key);

  final String? icon;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    var screenWidthVar = MediaQuery.of(context).size.width;
    var screenHeightVar = MediaQuery.of(context).size.height;
    var blockSizeHorizontal = (screenWidthVar / 100);
    var blockSizeVertical = (screenHeightVar / 100);

    double getProportionateScreenHeight(double inputHeight) {
      double? screenHeight = screenHeightVar;
      // 812 is the layout height that designer use
      return (inputHeight / 812.0) * screenHeight;
    }

// Get the proportionate height as per screen size
    double getProportionateScreenWidth(double inputWidth) {
      double? screenWidth = screenWidthVar;
      // 375 is the layout width that designer use
      return (inputWidth / 375.0) * screenWidth;
    }

    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        height: getProportionateScreenHeight(40),
        width: getProportionateScreenWidth(40),
        decoration: BoxDecoration(
          color: Color(0xFFF5F6F9),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon!),
      ),
    );
  }
}
