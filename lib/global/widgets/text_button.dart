import 'package:flutter/material.dart';
import 'package:olga/global/styles/text_styles.dart';

class TextBtn extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const TextBtn({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyles.gestureContinueStyle(context),
        ),
      ),
    );
  }
}

//GestureDectector

class GestureNavigator extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const GestureNavigator({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyles.regularBoldTextStyle(context),
      ),
    );
  }
}
