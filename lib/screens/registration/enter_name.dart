// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/text_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/registration/gender_email.dart';
import 'package:provider/provider.dart';

class EnterName extends StatefulWidget {
  static const String id = "/enterName";
  const EnterName({Key? key}) : super(key: key);

  @override
  State<EnterName> createState() => _EnterNameState();
}

class _EnterNameState extends State<EnterName> {
  final _formKey = GlobalKey<FormState>();
  final _nameContoller = TextEditingController();
  final _lastNameContoller = TextEditingController();

  bool _hideButton = false;
  bool _hideButtonSecond = false;
  bool _isVisible = false;
  bool _isVisibleSecond = false;
  bool fieldEnable = true;
  bool fieldEnableSecond = true;
  bool isMedium = false;

  @override
  void initState() {
    // Provider.of<StorageProvider>(context, listen: false).isAudio==true? speak(getTranslated('enter_name_intro', context)+"What is your first name",):speak("") ;
    Provider.of<StorageProvider>(context, listen: false).audioSpeak(
        "Hello, my name is Olga and I will help you to express your ultimate-self, to achieve your  dreams, hopes and goals and coach you to become all that you want to be." +
            "What is your first name");
    String name = Provider.of<StorageProvider>(context, listen: false).name;
     List<String> names = name.split(" "); // ["John", "Doe"]

      if (names.length > 0 && names[0].isNotEmpty) {
        _nameContoller.text = names[0];
        if (names.length > 1 && names[1].isNotEmpty) {
          _lastNameContoller.text = names[1];
        }
      }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _nameContoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StorageProvider storeValues =
        Provider.of<StorageProvider>(context, listen: false);
    return /* WillPopScope(
      onWillPop: () => onWillPopWarning(context),
      child:  */
        Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: NoBackPressAppbar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 15.sp),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          //  Provider.of<StorageProvider>(context, listen: false).audioSpeak("What is your first name");
                          // speak(getTranslated('enter_name_intro', context)+"What is your first name",);
                        },
                        child:
                            Image.asset(Images.langPlaceholder, width: 60.w)),
                    SizedBox(width: 10.w),
                    Flexible(
                      child: Text(
                        getTranslated('enter_name_intro', context),
                        textAlign: TextAlign.left,
                        style: TextStyles.smallBoldTextStyle(context),
                      ),
                    ),
                  ],
                ),
                // Text(
                //   getTranslated('enter_name_intro2', context),
                //   textAlign: TextAlign.left,
                //   style: TextStyles.smallBoldTextStyle(context),
                // ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Text(
                      getTranslated('first_name_question', context),
                      style: TextStyles.questionTextStyle(context),
                    ),
                  ],
                ),
                //
                Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        enabled: fieldEnable,
                        style: TextStyles.smallBoldTextStyle(context),
                        controller: _nameContoller,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: getTranslated("enter_name", context),
                          labelStyle: TextStyles.labelTextStyle(context),
                          suffixIcon: _hideButton
                              ? TextBtn(
                                  title: getTranslated("enter_small", context),
                                  onPressed: () {
                                    print(
                                        "inputed user name ===>>> ${_nameContoller.text}");
                                    setState(() {
                                      if (_formKey.currentState!.validate()) {
                                        Provider.of<StorageProvider>(context,
                                                listen: false)
                                            .audioSpeak(
                                                "What is your last name");
                                        setState(() {
                                          print("printing if condition");
                                          storeValues
                                              .changeName(_nameContoller.text);
                                        });
                                      } else {
                                        setState(() {
                                          print("printing else condition");
                                        });
                                      }
                                    });
                                  })
                              : null,
                        ),
                        validator: (value) {
                          if (value!.length < 3 || value.length > 25) {
                            setState(() {
                              errorSnackBar(context,
                                  "Name should be between 3-15 characters");
                            });
                          } else {
                            setState(() {
                              _hideButton = false;
                              fieldEnable = false;
                              _isVisible = true;
                              print("condition fullfill");
                            });
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              _hideButton = true;
                              print("typing.... $value");
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Visibility(
                  visible: _isVisible,
                  child: Row(
                    children: [
                      Text(
                        "What is your last name ?",
                        style: TextStyles.questionTextStyle(context),
                      ),
                    ],
                  ),
                ),
                //
                Visibility(
                  visible: _isVisible,
                  child: Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          enabled: fieldEnableSecond,
                          style: TextStyles.smallBoldTextStyle(context),
                          controller: _lastNameContoller,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText:
                                getTranslated("enter_last_name", context),
                            labelStyle: TextStyles.labelTextStyle(context),
                            suffixIcon: _hideButtonSecond
                                ? TextBtn(
                                    title:
                                        getTranslated("enter_small", context),
                                    onPressed: () {
                                        Provider.of<StorageProvider>(context, listen: false).audioSpeak( "Hi ${storeValues.name} , the main task in life is to make change from a position of 'self - knowledge' and 'strength'. I know you have solutions within you and I will work with you to set your goals and pinpoint the steps you will take and the skills to ensure your success.");
                                      print(
                                          "inputed user name ===>>> ${_lastNameContoller.text}");
                                      setState(() {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            print("printing if condition");
                                            storeValues.changeLastName(
                                                _lastNameContoller.text);
                                          });
                                        } else {
                                          setState(() {
                                            print("printing else condition");
                                          });
                                        }
                                      });
                                    })
                                : null,
                          ),
                          validator: (value) {
                            if (value!.length < 2 || value.length > 25) {
                              setState(() {
                                errorSnackBar(context,
                                    "Name should be between 2-15 characters");
                              });
                            } else {
                              setState(() {
                                _hideButtonSecond = false;
                                fieldEnableSecond = false;
                                _isVisibleSecond = true;
                                print("condition fullfill");
                              });
                            }
                            return null;
                          },
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              setState(() {
                                _hideButtonSecond = true;
                                print("typing.... $value");
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                //
                SizedBox(height: 20.sp),
                Visibility(
                  visible: _isVisibleSecond,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // speak('Hi, ${storeValues.name} ${getTranslated('the_main_task_inlife', context)}');
                            },
                            child: Image.asset(
                              Images.langPlaceholder,
                              width: 60.w,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          Flexible(
                            child: Text(
                              //"Hi ,"+ storeValues.name+getTranslated('the_main_task_inlife', context),
                              'Hi ${storeValues.name}, ${getTranslated('the_main_task_inlife', context)}',
                              textAlign: TextAlign.left,
                              style: TextStyles.smallBoldTextStyle(context),
                            ),
                          ),
                        ],
                      ),
                      // Text(
                      //   getTranslated('solutions_within_you', context),
                      //   textAlign: TextAlign.right,
                      //   style: TextStyles.smallBoldTextStyle(context),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextBtn(
                            title: getTranslated("continue_small", context),
                            onPressed: () {
                              print(_nameContoller.text);
                              setState(() {
                                _isVisible = !_isVisible;
                              });

                              if (isMedium) {
                                Provider.of<StorageProvider>(context,
                                        listen: false)
                                    .registrationSafetyNet(
                                        route: GenderEmail.id);
                              }
                              goNamedWithBool(
                                  context, GenderEmail.id, isMedium);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //),
    );
  }
  //

}
