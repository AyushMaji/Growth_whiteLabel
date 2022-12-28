// ignore_for_file: avoid_print
import 'package:olga/provider/storage_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/provider/profile_provider.dart';

class NewPassword extends StatefulWidget {
  static const String id = "NewPassword";
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordSixtoTenChars = true;
  bool _hasPasswordLowerUpper = true;
  bool _hasPasswordAlphanumaric = true;

  @override
  void dispose() {
    super.dispose();

    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
  StorageProvider _storeProvider =
        Provider.of<StorageProvider>(context, listen: false);
         ProfileProvider _profileData = Provider.of<ProfileProvider>(context, listen: false);

    return Scaffold(
      appBar: dashboardAppBar(
        context,
        getTranslated("change_password", context),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.sp),
                Text(getTranslated("new_password", context)),
                TextFormField(
                  controller: _newPasswordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: "******",
                  ),
                  onChanged: (password) {
                    setState(() {
                      //
                      _isPasswordSixtoTenChars = false;
                      if (password.length < 6 || password.length > 10) {
                        _isPasswordSixtoTenChars = true;
                      }
                      //
                      _hasPasswordLowerUpper = false;
                      if (!password
                          .contains(RegExp("^(?=.*?[A-Z])(?=.*?[a-z])"))) {
                        _hasPasswordLowerUpper = true;
                      }
                      //
                      _hasPasswordAlphanumaric = false;
                      if (!password.contains(RegExp("^(?=.*?[!@#\$&*~])"))) {
                        _hasPasswordAlphanumaric = true;
                      }
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) return "password is required";
                    return null;
                  },
                ),
                //const SizedBox(height: 10),
                _isPasswordSixtoTenChars
                    ? const Text("Password must be 6-10 characters")
                    : const SizedBox.shrink(),
                _hasPasswordLowerUpper
                    ? const Text("Include upper and lower case characters")
                    : const SizedBox.shrink(),
                _hasPasswordAlphanumaric
                    ? const Text("Include one alphanumeric character")
                    : const SizedBox.shrink(),
                // const SizedBox(height: 10),
                //
                SizedBox(height: 15.sp),
                Text(getTranslated("confirm_password", context)),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: "******",
                  ),
                  validator: (value) {
                    if (value! != _newPasswordController.text) {
                      return "password doesn't match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 100.h),
                //Text('${_storeProvider.receivedOtp}'.toString()),
                //Text('${_profileData.authModel.data?.user?.otp}')
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Consumer<ProfileProvider>(
        builder: (context, _profileProvider, child) {
          return Consumer<StorageProvider>(
            builder: (context, _storeProvider, child) {
            return Padding(
            padding: const EdgeInsets.all(10),
            child: SubmitButton(
              title: getTranslated("submit", context),
              onPressed: () async {
      
               print('${_profileData.authModel.data?.user?.otp}'.toString());
               //print("${_storeProvider.receivedOtp}".toString());
               print("opt not match ${_storeProvider.receivedOtp} != ${_profileData.authModel.data?.user?.otp}");
 
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    Provider.of<ProfileProvider>(context, listen: false).resetForgotPassword(
                      email: '${_profileData.authModel.data?.user?.email}',
                      newPassword: _newPasswordController.text,
                      confirmPassword: _confirmPasswordController.text,
                      otp: '${_profileData.authModel.data?.user?.otp}',
                      context: context,
                    )
                        .then((value) {
                      print(value);
                      print("uploaded");
                    });
                  });
                } 
      
              },
              buttonStyle: ButtonStyles.getCommonStyle(context),
            ),
          );}
        ); 
        },
      ),
    );
  }
}
