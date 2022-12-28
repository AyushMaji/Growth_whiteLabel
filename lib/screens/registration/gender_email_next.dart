// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/box_decoration.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/primary_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/auth_provider.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/registration/life_scale.dart';
import 'package:provider/provider.dart';

class GenderEmailNext extends StatefulWidget {
  static const String id = "/genderEmailNext";
  const GenderEmailNext({Key? key}) : super(key: key);

  @override
  State<GenderEmailNext> createState() => _GenderEmailNextState();
}

class _GenderEmailNextState extends State<GenderEmailNext> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailContoller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailContoller.dispose();
  }

  //
  bool visibleWidget = false; //
  bool secondVisibleWidget = false; //secondVisibleWidget

  bool _male = false;
  bool _female = false;
  bool _nonbinary = false;

  @override
  void initState() {
    super.initState();
    final storeProvider = Provider.of<StorageProvider>(context, listen: false);
    Provider.of<StorageProvider>(context, listen: false)
        .audioSpeak("${storeProvider.name},  let's take the next step to better understand where you are at in your life and where you would like to get to.");
    _emailContoller.text = storeProvider.email;
    print(" ========> First Time Initial Running <======== ");
    print(storeProvider.gender);
    if (storeProvider.gender == "Male") {
      setState(() {
        _male = true;
      });
    }
    if (storeProvider.gender == "Female") {
      setState(() {
        _female = true;
      });
    }
    if (storeProvider.gender == "Non-Binary") {
      setState(() {
        _nonbinary = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        absorbing: true,
                        child: Row(
                          children: [
                            Expanded(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _male = true;
                                      _female = false;
                                      _nonbinary = false;
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
                                    setState(() {
                                      _male = false;
                                      _female = true;
                                      _nonbinary = false;
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
                                    setState(() {
                                      _male = false;
                                      _female = false;
                                      _nonbinary = true;
                                      visibleWidget = true;
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
                        visible: true,
                        child: Column(
                          children: [
                            SizedBox(height: 20.sp),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  getTranslated("what_email_address", context),
                                  style: TextStyles.boldTextStyle(context),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextFormField(
                                      enabled:
                                          false, // disable when successfull register
                                      style: TextStyles.smallBoldTextStyle(
                                          context),
                                      textAlign: TextAlign.right,
                                      controller: _emailContoller,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintText: storeValues.email,
                                        border: InputBorder.none,
                                        labelText: getTranslated(
                                            "enter_email", context),
                                        labelStyle:
                                            TextStyles.labelTextStyle(context),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //

                            //
                            Visibility(
                              visible: true,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(height: 10.sp),
                                      Image.asset(
                                        Images.userPlaceholder,
                                        width: 60.w,
                                      ),
                                      SizedBox(width: 10.sp),
                                      Flexible(
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "${storeValues.name},  let's take the next step to better understand where you are at in your life and where you would like to get to.",
                                            style:
                                                TextStyles.smallBoldTextStyle(
                                                    context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                        Images.creativeTeam,
                                        width: 200.w,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  SizedBox(height: 10.h),
                                ],
                              ),
                            ),

                            //
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
      bottomSheet: Padding(
        padding: const EdgeInsets.all(10),
        child: PrimaryButton(
            title: getTranslated('continue', context),
            onPressed: () {
              Provider.of<StorageProvider>(context, listen: false)
                  .registrationSafetyNet(route: LifeScale.id);
              goPageWithName(context, LifeScale.id);
              // call the profile details API
              print('enter');
            }),
      ),
      //),
    );
  }
}
