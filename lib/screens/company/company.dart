import 'package:flutter/material.dart';

class CompanyScreen extends StatefulWidget {
  static const String id = "/companyScreen";
  const CompanyScreen({Key? key}) : super(key: key);

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Company Screen"),
      ),
      body: Container(
        child: Column(
          children: [
            //
            Text("Company Screen"),
          ],
        ),
      ),
    );
  }
}
