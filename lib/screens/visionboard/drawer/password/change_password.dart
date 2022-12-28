// ignore_for_file: avoid_print
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/global/widgets/text_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/provider/profile_provider.dart';
import 'forgot_password.dart';

class ChangePassword extends StatefulWidget {
  static const String id = "ChangePassword";
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();
  bool showError1 = false;
  bool showError2 = false;
  bool showError3 = false;

  String? password;

  bool _isPasswordSixtoTenChars = true;
  bool _hasPasswordLowerUpper = true;
  bool _hasPasswordAlphanumaric = true;

  final _currentPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _currentPassword.dispose();
    _newPassword.dispose();
    _confirmPassword.dispose();
  }

  @override
  void initState() {
    super.initState();
    ProfileProvider profileData =
        Provider.of<ProfileProvider>(context, listen: false);

    print("======================");
    print("${profileData.profileModel.msg}");
  }

  @override
  Widget build(BuildContext context) {
    /*    
    String errorMessage1 = getTranslated("6_10_characters", context);
    String errorMessage2 = getTranslated("upper_and_lower_case", context);
    String errorMessage3 = getTranslated("one_alphanumeric", context); 
    */

    return Scaffold(
      appBar: dashboardAppBar(
        context,
        getTranslated("change_password", context),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.sp),
                Text(getTranslated("current_password", context)),
                TextFormField(
                  controller: _currentPassword,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: "******",
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextBtn(
                      title: getTranslated("forgot_password", context),
                      onPressed: () {
                        goPage(context, const ForgotPassword());
                      }),
                ),
                SizedBox(height: 30.sp),

                //
                Text(getTranslated("new_password", context)),
                TextFormField(
                  controller: _newPassword,
                  obscureText: false,
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
                        //showToast("message", context);
                      }

                      //
                      _hasPasswordAlphanumaric = false;
                      if (!password.contains(RegExp("^(?=.*?[!@#\$&*~])"))) {
                        _hasPasswordAlphanumaric = true;
                      }
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

                _isPasswordSixtoTenChars
                    ? const Text("Password must be 6-10 characters")
                    //: const Text(""), //if we want to show any success message
                    : const SizedBox.shrink(),
                _hasPasswordLowerUpper
                    ? const Text("Include upper and lower case characters")
                    : const SizedBox.shrink(),
                _hasPasswordAlphanumaric
                    ? const Text("Include one alphanumeric character")
                    : const SizedBox.shrink(),
                const SizedBox(height: 10),
                //
                SizedBox(height: 15.sp),
                Text(getTranslated("confirm_password", context)),
                TextFormField(
                  controller: _confirmPassword,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: "******",
                  ),
                  validator: (String? value) {
                    print("confirm password is ===>>> $value");
                    if (value != _newPassword.text) {
                      return "Password doesn't match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 80.h),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(10),
        child: SubmitButton(
          title: getTranslated("save", context),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
            ProfileProvider profileProvider = Provider.of<ProfileProvider>(context, listen: false);
             Provider.of<ProfileProvider>(context, listen: false)
                    .changePassword(
                        oldPassword: _currentPassword.text,
                        newPassword: _newPassword.text,
                        confirmPassword: _confirmPassword.text,
                        context: context)
                    .then((value) {
                  
                  print("uploaded");
                });
              setState(() {
                 if ( profileProvider.postResponse['statuscode']  == 200){
                  _currentPassword.text = '';
                  _newPassword.text = '';
                  _confirmPassword.text = '';
             }
              });

             
             
            } else {
              showToast("All fields are required", context);
            }
           
          },

          buttonStyle: ButtonStyles.getCommonStyle(context),
        ),
      ),
    );
  }
}
