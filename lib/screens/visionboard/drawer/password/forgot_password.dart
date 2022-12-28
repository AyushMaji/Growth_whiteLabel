// ignore_for_file: avoid_print
import 'package:olga/provider/storage_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/provider/profile_provider.dart';

class ForgotPassword extends StatefulWidget {
  static const String id = "ForgotPassword";
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardAppBar(context,
        getTranslated("forgot_password", context),
      ),
      body: SingleChildScrollView(
        child:  Consumer<ProfileProvider>(
          builder: (context, _profileData, child) {
          return Padding(
            padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.sp),
                  Text(getTranslated("register_email", context)),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: "test@example.com",
                    ),
                    validator: (val) {
                      if (val!.isEmpty) return "Email field can not be empty";
                      return null;
                    },
                  ),
                  SizedBox(height: 40.sp),
                ],
              ),
            ),
          );
          }
        ),
      ),
      bottomSheet: Consumer<ProfileProvider>(
          builder: (context, _profileData, child) {
          return Consumer<StorageProvider>(
          builder: (context, _storeProvider, child) {
          return Padding(
            padding: EdgeInsets.only(left: 15.sp, right: 15.sp, bottom: 15.sp),
            child:  SubmitButton(
                    title: getTranslated("submit", context),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() { 
                      _profileData.sendOTP(email: _emailController.text, context: context);
                                 
                        });
                      }
                            
                    },
                    buttonStyle: ButtonStyles.getCommonStyle(context),
                  )
               
                  );
                  }
          );
        }
      )
    );
  }
}
