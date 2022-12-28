// ignore_for_file: avoid_print
import 'package:olga/global/methods/methods.dart';
import 'package:olga/provider/happy_life_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/storage_provider.dart';
import '../../../../../global/constants/color_resources.dart';
import 'important_ofgoal.dart';

class GoalDeepCare extends StatefulWidget {
  static const String id = "/goalDeepCare";
  const GoalDeepCare({Key? key}) : super(key: key);

  @override
  State<GoalDeepCare> createState() => _GoalDeepCareState();
}

class _GoalDeepCareState extends State<GoalDeepCare> {
  final _formKey = GlobalKey<FormState>();

  final _beneefitsController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    _beneefitsController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
    void initState() {
    super.initState();
    Provider.of<StorageProvider>(context, listen: false).registrationSafetyNet(route: GoalDeepCare.id);
    StorageProvider storageValue =Provider.of<StorageProvider>(context, listen: false);
    Provider.of<StorageProvider>(context, listen: false).audioSpeak("Imagine that you wake up in the morning and that your ${storageValue.oneSelectedArea} are exactly how you would like them to be. By building your emotional skills and capabilities you will create clear pathways to ensure the cost of change does not outweigh the benefits!  So with that in mind, write one sentence on what the BENEFITS will be for you, if you accomplish this goal?  ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(),
      ),
      body: Consumer<StorageProvider>(builder: (context, storeValues, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            reverse: true,
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: Image.asset(
                          Images.lifeScaleFlip2,
                          width: 80.w,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child:
                          
                           storeValues.oneSelectedArea =="Friends" || storeValues.oneSelectedArea =="Finances"  || storeValues.oneSelectedArea =="Hobbies/Recreation/Fun" || storeValues.oneSelectedArea =="Career & Work"
                           ? Text( getTranslated('imagine_that_wakeup_morning', context) + storeValues.oneSelectedArea + getTranslated('are_exactly_how', context)+ getTranslated('then_to_be', context),style: TextStyle(
                              color:
                                  ColorResources.getButtonCalicoColor(context),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 16.sp,
                            ),
                            textAlign: TextAlign.start,
                          )
                           :
                           Text( getTranslated('imagine_that_wakeup_morning', context) + storeValues.oneSelectedArea + getTranslated('is_exactly_how', context) + getTranslated('then_to_be', context),

                            style: TextStyle(
                              color:
                                  ColorResources.getButtonCalicoColor(context),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 16.sp,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.sp, 0, 15.sp, 15.sp),
                    child: Column(
                      children: [
                        // Text(
                        //   getTranslated('then_to_be', context),
                        //   style: TextStyle(
                        //     color: ColorResources.getButtonCalicoColor(context),
                        //     fontWeight: FontWeight.bold,
                        //     fontFamily: 'Poppins',
                        //     fontSize: 16.sp,
                        //   ),
                        //   textAlign: TextAlign.start,
                        // ),
                        SizedBox(height: 10.h),
                        //
                        RichText(
                          text: TextSpan(
                            text:
                                getTranslated('so_with_that_in_mind', context),
                            style: TextStyles.regularBoldTextStyle(context),
                            children: [
                              TextSpan(
                                text: getTranslated('benefits', context),
                                style: TextStyles.smallBoldTextStyle(context),
                              ),
                              TextSpan(
                                text: getTranslated('will_be_for_you', context),
                                style: TextStyles.regularBoldTextStyle(context),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        //

                         FocusScope(
                          onFocusChange: (value) {
                            if (!value) {
                               Provider.of<StorageProvider>(context, listen: false).audioSpeak("Now ask yourself, what will the PRICE be if you don't achieve this goal? Again, write one sentence for this. ");
                            }
                          },
                          child: TextFormField(
                            controller: _beneefitsController,
                            //expands: true,
                            maxLines: 3,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFFDEB988), width: 2.0),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              helperMaxLines: 4,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) return "This field is required";
                              return null;
                            },
                            onChanged: (value) {
                              print("typying === >>> $value");
                            },
                          ),
                        ),
                        SizedBox(height: 20.sp),
                        //
                        RichText(
                          text: TextSpan(
                            text: getTranslated('now_ask_yourself', context),
                            style: TextStyles.regularBoldTextStyle(context),
                            children: [
                              TextSpan(
                                text: getTranslated('price', context),
                                style: TextStyles.smallBoldTextStyle(context),
                              ),
                              TextSpan(
                                text: getTranslated('be_if_you', context),
                                style: TextStyles.regularBoldTextStyle(context),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 15.sp),
                        TextFormField(
                          controller: _priceController,
                          //expands: true,
                          maxLines: 3,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xFFDEB988), width: 2.0),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            helperMaxLines: 4,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty)
                              return "This field also required";

                            return null;
                          },
                          onChanged: (value) {
                            print("typying === >>> $value");
                          },
                        ),
                        SizedBox(height: 50.sp),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
      bottomSheet: Padding(
        padding: EdgeInsets.only(left: 15.sp, right: 15.sp, bottom: 15.sp),
        child: SubmitButton(
          title: getTranslated('submit', context),
          onPressed: () {
            final storeValues =
                Provider.of<StorageProvider>(context, listen: false);
            if (_formKey.currentState!.validate()) {
              storeValues.updateBeneefits(_beneefitsController.text);
              storeValues.updatePrice(_priceController.text);
              goPageWithName(context, ImportantOfGoal.id);
              print('=========wrong is here ===========');
            }
          },
          buttonStyle: ButtonStyles.getCommonStyle(context),
        ),
      ),
    );
  }
}
