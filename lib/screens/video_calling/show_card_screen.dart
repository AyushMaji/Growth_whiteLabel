// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/color_resources.dart';
import 'package:olga/global/widgets/calling_primary_button.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ShowCradScreen extends StatefulWidget {
  static const id = "/showCardScreen";
  const ShowCradScreen({Key? key}) : super(key: key);

  @override
  State<ShowCradScreen> createState() => _ShowCradScreenState();
}

class _ShowCradScreenState extends State<ShowCradScreen> {
  var _saveCard = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const NoBackPressAppbar(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        '27.95 USD',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "poppins",
                          color: Color(0xffB50000),
                        ),
                      ),
                      Text(
                        '31 Jan, at 10:15 AM',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: "poppins",
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // height: 900,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffF0F0F0),
                    //color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Choose your payment method:',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/images/visa.png",
                            width: 55.w,
                          ),
                          Image.asset(
                            "assets/images/mastercard.png",
                            width: 55.w,
                          ),
                          Image.asset(
                            "assets/images/paypal.png",
                            width: 55.w,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Enter your card details',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "poppins",
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorResources.getRed(context),
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                              child: GestureDetector(
                                child: Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        width: 340.w,
                        height: 210.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          color: ColorResources.getRed(context),
                          image: DecorationImage(
                            image: AssetImage("assets/images/gradient.png"),
                            fit: BoxFit.fitHeight,
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset('assets/images/simcard.png',
                                      width: 34.w),
                                  Text(
                                    'Card Type',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.sp),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'XXXX XXXX XXXX XXXX',
                                style: TextStyle(
                                    fontSize: 25.sp, color: Colors.white),
                              ),
                              // SizedBox(
                              //   height: 10.h,
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'CVPP',
                                    style: TextStyle(
                                        fontSize: 14.sp, color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Card Holder',
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.white),
                                  ),
                                  Text(
                                    'Expiry Date',
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.white),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Enter your name',
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.white),
                                  ),
                                  Text(
                                    'MM/YYYY',
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Save this card',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          // Switch.adaptive(
                          //   value: _saveCard,
                          //   onChanged: (value) => setState(
                          //     () {
                          //       _saveCard = value;
                          //     },
                          //   ),
                          // )
                          FlutterSwitch(
                            value: _saveCard,
                            height: 25.h,
                            width: 48.w,
                            toggleSize: 18.0.h,
                            activeColor: Color(0xffDEB988),
                            onToggle: (val) {
                              setState(
                                () {
                                  _saveCard = val;
                                },
                              );
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 75.h,
                      ),
                      VideoCallingPrimaryButton(
                        icon: Icons.lock_rounded,
                        title: getTranslated("pay", context),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomSheet: Padding(
      //   padding: const EdgeInsets.all(10.0),
      //   child: VideoCallingPrimaryButton(
      //     title: getTranslated("book_appointment", context),
      //     onPressed: () {},
      //   ),
      // ),
    );
  }
}
