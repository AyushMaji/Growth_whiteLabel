// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/styles/box_decoration.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/text_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/auth_provider.dart';
import 'package:olga/provider/profile_provider.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:provider/provider.dart';

import 'gender_email_next.dart';

class GenderEmail extends StatefulWidget {
  static const String id = "/genderEmail";
  const GenderEmail({Key? key}) : super(key: key);

  @override
  State<GenderEmail> createState() => _GenderEmailState();
}

class _GenderEmailState extends State<GenderEmail> {
  final _formKey = GlobalKey<FormState>();
  final _emailContoller = TextEditingController();

  //
  bool visibleWidget = false;
  bool isMedium = false;

  @override
  void initState() {
    Provider.of<StorageProvider>(context, listen: false)
        .audioSpeak("How do you identify?");
    String email = Provider.of<StorageProvider>(context, listen: false).email;
    if (email.isNotEmpty) {
      _emailContoller.text = email;
      _emailActive = false;
    }
    super.initState();
  }

  bool _male = false;
  bool _female = false;
  bool _nonbinary = false;
  bool _unLockedIdentify = false;
  bool _emailActive = true;

  @override
  Widget build(BuildContext context) {
    isMedium = ModalRoute.of(context)?.settings.arguments != null
        ? (ModalRoute.of(context)?.settings.arguments as bool)
        : false;

    return /* WillPopScope(
      onWillPop: () => onWillPopWarning(context),
      child: */
        Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const NoBackPressAppbar(),
      ),
      body: SingleChildScrollView(
        child:
            Consumer<StorageProvider>(builder: (context, storeValues, child) {
          return Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              return Container(
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 15.sp),
                      Row(
                        children: [
                          SizedBox(height: 10.sp),
                          Image.asset(
                            Images.userPlaceholder,
                            width: 60.w,
                          ),
                          SizedBox(width: 10.w),
                          Flexible(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                getTranslated('how_do_identify', context),
                                style: TextStyles.smallBoldTextStyle(context),
                              ),
                            ),
                          ),
                        ],
                      ),

                      //

                      SizedBox(height: 30.sp),
                      AbsorbPointer(
                        absorbing: _unLockedIdentify,
                        child: Row(
                          children: [
                            Expanded(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Provider.of<StorageProvider>(context,
                                            listen: false)
                                        .audioSpeak("What is your email ?");
                                    setState(() {
                                      _male = true;
                                      _female = false;
                                      _nonbinary = false;
                                      visibleWidget = true;
                                      storeValues.changeGenderl("Male");
                                      storeValues.changeGenderlSelection(_male);
                                    });
                                  },
                                  child: Container(
                                    decoration: _male
                                        ? genderBoxDecoration
                                        : genderUnSelectedbox,
                                    child: Padding(
                                      padding: EdgeInsets.all(10.w),
                                      child: Text(
                                        getTranslated("male", context),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: _male
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Provider.of<StorageProvider>(context,
                                            listen: false)
                                        .audioSpeak("What is your email ?");
                                    setState(() {
                                      _male = false;
                                      _female = true;
                                      _nonbinary = false;
                                      visibleWidget = true;
                                      storeValues.changeGenderl("Female");
                                      storeValues
                                          .changeGenderlSelection(_female);
                                    });
                                  },
                                  child: Container(
                                    decoration: _female
                                        ? genderBoxDecoration
                                        : genderUnSelectedbox,
                                    child: Padding(
                                      padding: EdgeInsets.all(10.w),
                                      child: Text(
                                        getTranslated("female", context),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: _female
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Provider.of<StorageProvider>(context,
                                            listen: false)
                                        .audioSpeak("What is your email ?");
                                    setState(() {
                                      _male = false;
                                      _female = false;
                                      _nonbinary = true;
                                      visibleWidget = true;
                                      storeValues.changeGenderl("Non-Binary");
                                      storeValues
                                          .changeGenderlSelection(_nonbinary);
                                    });
                                  },
                                  child: Container(
                                    decoration: _nonbinary
                                        ? genderBoxDecoration
                                        : genderUnSelectedbox,
                                    child: Padding(
                                      padding: EdgeInsets.all(10.w),
                                      child: Text(
                                        getTranslated("non_binary", context),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: _nonbinary
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //
                          ],
                        ),
                      ),

                      Visibility(
                        visible: visibleWidget,
                        child: Column(
                          children: [
                            SizedBox(height: 20.sp),
                            //Text("${_authProvider.authModel.data?.token}"),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    getTranslated(
                                        "what_email_address", context),
                                    style: TextStyles.boldTextStyle(context),
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: TextFormField(
                                    enabled:
                                        _emailActive, // disable when successfull register
                                    style:
                                        TextStyles.smallBoldTextStyle(context),
                                    textAlign: TextAlign.end,
                                    textDirection: TextDirection.ltr,
                                    controller: _emailContoller,
                                    keyboardType: TextInputType.emailAddress,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText:
                                          getTranslated("enter_email", context),
                                      labelStyle:
                                          TextStyles.labelTextStyle(context),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Email is required";
                                      }
                                      if (!value.contains(RegExp(
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'))) {
                                        return "Enter a valid email address";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        setState(() {
                                          print("typing.... $value");
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            //

                            Visibility(
                              visible: true,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextBtn(
                                    title: getTranslated("submit", context),
                                    onPressed: () {
                                      if (_emailActive) {
                                        setState(() {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              authProvider.registerUser(
                                                  userType: "2",
                                                  email: _emailContoller.text,
                                                  password: "12345678",
                                                  firstName: storeValues.name,
                                                  lastName:
                                                      storeValues.lastName,
                                                  gender: storeValues.gender,
                                                  medium: "regular",
                                                  context: context);
                                              //hide visible button continue
                                            });
                                          }
                                        });
                                      } else {
                                        if (_formKey.currentState!.validate()) {
                                          if (isMedium) {
                                            Provider.of<StorageProvider>(
                                                    context,
                                                    listen: false)
                                                .registrationSafetyNet(
                                                    route: GenderEmailNext.id);
                                          }
                                          Provider.of<ProfileProvider>(context,
                                                  listen: false)
                                              .setProfileDetails(
                                                  firstName: storeValues.name,
                                                  lastName:
                                                      storeValues.lastName,
                                                  dateOfBirth: "",
                                                  countryOfResidence: "",
                                                  prefferedLang: "",
                                                  phoneNumber: "",
                                                  gender: storeValues.gender,
                                                  context: context);
                                        }
                                      }
                                      final storeProvider =
                                          Provider.of<StorageProvider>(context,
                                              listen: false);
                                      storeProvider.updateSavedUserEmail(
                                          _emailContoller.text);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
      // ),
    );
  }
}
