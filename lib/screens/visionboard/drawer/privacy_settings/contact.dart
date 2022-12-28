// ignore_for_file: avoid_print
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/common_provider.dart';

import '../../../../provider/profile_provider.dart';

class Contact extends StatefulWidget {
  static const String id = "Contact us";
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _titleController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();


     @override
  void initState() {
    super.initState();
    ProfileProvider profileData =Provider.of<ProfileProvider>(context, listen: false);

    profileData.viewUserProfileDetails();
    _emailController.text = profileData.profileModel.data?.userDetails?.email ?? "";
    _firstNameController.text = profileData.profileModel.data?.userDetails?.firstName ?? "";
    _lastNameController.text = profileData.profileModel.data?.userDetails?.lastName ?? "";

  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardAppBar(
        context,
        getTranslated("contact", context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w),
          child: Form(
            key: AppConstants.globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Text(
                  getTranslated("contact", context),
                  style: TextStyles.boldTextStyle(context),
                ),
                Text(getTranslated("if_youhave_gota_question", context)),
                SizedBox(height: 30.h),

                Text(getTranslated("we_strive_evolve", context)),

                SizedBox(height: 15.h),
                Text(getTranslated("got_any_question_check_faq", context)),
                SizedBox(height: 5.h),
                Text(getTranslated("read_privacy_policy", context)),

                //
                SizedBox(height: 20.sp),
                Text(
                  getTranslated("contact_title", context),
                  style: TextStyles.smallBoldTextStyle(context),
                ),
                TextFormField(
                  controller: _titleController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onChanged: (val) {
                    setState(() {
                      print("typing title ===>> $val");
                    });
                  },
                ),

                //
                SizedBox(height: 20.sp),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getTranslated("first_name", context),
                            style: TextStyles.smallBoldTextStyle(context),
                          ),
                          TextFormField(
                            controller: _firstNameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            onChanged: (val) {
                              setState(() {
                                print("typing first name ===>> $val");
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.sp),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getTranslated("last_name", context),
                            style: TextStyles.smallBoldTextStyle(context),
                          ),
                          TextFormField(
                            controller: _lastNameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            onChanged: (val) {
                              setState(() {
                                print("typing last name ===>> $val");
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.sp),

                Text(
                  getTranslated("email_address", context),
                  style: TextStyles.smallBoldTextStyle(context),
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onChanged: (val) {
                    setState(() {
                      print("typing email ===>> $val");
                    });
                  },
                ),

                SizedBox(height: 20.sp),

                Text(
                  getTranslated("message", context),
                  style: TextStyles.smallBoldTextStyle(context),
                ),
                TextFormField(
                  controller: _messageController,
                  keyboardType: TextInputType.text,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onChanged: (val) {
                    setState(() {
                      print("typing message ===>> $val");
                    });
                  },
                ),
                SizedBox(height: 20.sp),

                SubmitButton(
                  title: getTranslated("submit", context),
                  onPressed: () {
                    _sendDataAndNavigate();
                  },
                  buttonStyle: ButtonStyles.getCommonStyle(context),
                ),
                SizedBox(height: 20.sp),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _sendDataAndNavigate() {
    var _title = _titleController.text;
    var _firstName = _firstNameController.text;
    var _lastName = _lastNameController.text;
    var _email = _emailController.text;
    var _message = _messageController.text;

    CommonProvider _contactUs =
        Provider.of<CommonProvider>(context, listen: false);
    _contactUs.contactUs(
        title: _title,
        firstName: _firstName,
        lastName: _lastName,
        email: _email,
        message: _message,
        context: context);
    // goPage(context, const PaymentInfo());
  }
}
