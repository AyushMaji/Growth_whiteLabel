import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
   final InputDecoration inputDecoration;
 // final String labelText2;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.inputDecoration,
    //required this.labelText2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: "labelText2",
          errorText: "Text only",
          errorStyle: const TextStyle(
            color: Colors.red,
          )),
    );
  }
}
