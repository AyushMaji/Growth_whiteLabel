import 'package:flutter/material.dart';
import '../../global/methods/methods.dart';

class CoachScreen extends StatefulWidget {
  static const String id = "coach";
  const CoachScreen({Key? key}) : super(key: key);

  @override
  State<CoachScreen> createState() => _CoachScreenState();
}

class _CoachScreenState extends State<CoachScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => onWillPopExit(context, _key),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Coach"),
            automaticallyImplyLeading: false,
          ),
          key: _key,
          body:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: Column(
                  children: [
                    //
                    Text("Coach Screen"),
                  ],
                ),
              ),
          ),
          ),
        );
  }
}
