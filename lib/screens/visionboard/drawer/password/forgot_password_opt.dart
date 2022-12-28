// ignore_for_file: avoid_print
import 'package:olga/provider/storage_provider.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/provider/profile_provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'new_passwordd.dart';

class ForgotPasswordOtp extends StatefulWidget {
  static const String id = "ForgotPasswordOtp";
  const ForgotPasswordOtp({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordOtp> createState() => _ForgotPasswordOtpState();
}

class _ForgotPasswordOtpState extends State<ForgotPasswordOtp> {
  final _formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType>? errorController;
  final _emailController = TextEditingController();
  final _emailCodeController = TextEditingController();

  bool hasError = false;
  String currentText = "";
  final globalKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    
     StorageProvider _storeProvider = Provider.of<StorageProvider>(context, listen: false);

  }

  @override
  Widget build(BuildContext context) {
   StorageProvider _storeProvider =
        Provider.of<StorageProvider>(context, listen: false);
    return Scaffold(
      appBar: dashboardAppBar(
        context,
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
                  enabled: false,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.sp),
        
                  //
                  Text(getTranslated("6_digit_code", context)),
                  SizedBox(height: 30.sp),
                  Text("OTP"),
                  Text('${_profileData.authModel.data?.user?.otp}'),
                    
                    PinCodeTextField(
                      controller: _emailCodeController,
                      keyboardType: TextInputType.number,
        
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 3) {
                          return "I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeFillColor: const Color(0xFFC49898),
                        inactiveColor: const Color(0xFFA56B6B),
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
        
                      onCompleted: (v) {
                        print("Completed");
                      },
                      
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        return true;
                      },
                    ),
                  SizedBox(height: 60.sp),
                ],
              ),
            ),
          );
          }
        ),
      ),
      bottomSheet: Consumer<ProfileProvider>(
          builder: (context, _profileData, child) {
          return Padding(
          padding: EdgeInsets.only(left: 15.sp, right: 15.sp, bottom: 15.sp),
          child:  SubmitButton(
                  title: getTranslated("confirm", context),
                  onPressed: () {
                  print(_emailController.text);
                  print(_emailCodeController.text);

                  if (_emailCodeController.text != '${_profileData.authModel.data?.user?.otp}'){
                  print("opt not match ${_emailCodeController.text} != ${_profileData.authModel.data?.user?.otp}");
                      showToast("The OTP you enter is not match", context);
                  }
                   else{
                   _storeProvider.updateReceivedOtp(_emailCodeController.text);                      
                    goPage(context,const NewPassword());
                   
                   }
                    
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                      _storeProvider.updateReceivedOtp(_emailCodeController.text);                      
                        //goPage(context,const NewPassword());
                      });
                    } else {
                      showToast("Please input the OPT you have received", context);
                    }
                  },
                  buttonStyle: ButtonStyles.getCommonStyle(context),
                ),
        );
        }
      )
    );
  }
}
