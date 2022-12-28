// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/localization/language_constrants.dart';

class FAQ extends StatefulWidget {
  static const String id = "FAQ";

  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  final List _payments = [];
  final List _notificationErrorMessage = [];
  @override
  Widget build(BuildContext context) {
    final List _accountInfo = [];
    //
    return Scaffold(
      appBar: dashboardAppBar(
        context,
        getTranslated("faqs", context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //
            SizedBox(height: 10.sp),
            ExpansionTile(
              title: Text(
                getTranslated("account_info", context),
                style: TextStyles.normalBoldTextStyle(context),
              ),
              children: [
                 Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  getTranslated("what_account_info", context),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A. You can access your provided personal information (name, email, password, date of birth) via the Your Profile screen, and your payment information, past orders."),
                        )
                      ],
                    ),
                  ),
                ),

                // //!###########################################################################

                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("why_do_you_need_email", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                  Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                    //  padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                   getTranslated("why_do_you_need_email", context),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child:
                           Text("A. Having a confirmed identity for app users will allow Olga to better serve our customers and deliver personalized Offers. It is also a security measure to reduce fraud. If you are signed up to receive Olga’s Emails, we will also use your email address to communicate with you regarding the app, events, promotions, Rewards, and what we are doing to give back."),
                        )
                      ],
                    ),
                  ),
                ),

                // //!###########################################################################

                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("same_email_multiple_devices", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),

                 Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                   getTranslated("same_email_multiple_devices", context),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child:
                           Text("A. Yes, you should use the same email address on multiple devices."),
                        )
                      ],
                    ),
                  ),
                ),

                // //!###########################################################################

                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("how_do_remove_app", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                     Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                      //padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                   getTranslated("how_do_remove_app", context),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child:
                           Text("A. We hope you never need to delete the Olga app, but if you do, here’s how...iPhone® users: hold your finger over the app until the “x” appears, then tap the “x” to remove the app from your phone. Android™ users: select Settings -> Manage Applications -> Downloaded. Choose the Olga app and press Uninstall. On some devices, such as Google Pixel, you can also hold the app icon and drag into the trash can. Note: removing the app from your phone does not delete your Olga account with the Centre for Positive Change."),
                        )
                      ],
                    ),
                  ),
                ),

                // //!###########################################################################

                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("how_do_delete_account", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                  Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                    //  padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                   getTranslated("how_do_delete_account", context),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child:
                           Text("A. We hope you don’t want to! But if you do, just launch the app and access the Olga Profile Screen from the Menu. When your Profile Screen has loaded, scroll down and select Delete Account. We hope this isn’t goodbye..."),
                        )
                      ],
                    ),
                  ),
                ),

                // //!###########################################################################

                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("how_do_update_name", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                 Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                      //padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                   getTranslated("how_do_update_name", context),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child:
                           Text("A. Launch the app and log in if you aren’t already. Access the Olga Your Profile screen from the menu. From here, go into the Personal Settings screen and view and edit your first and last name."),
                        )
                      ],
                    ),
                  ),
                ),

                // //!###########################################################################

                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("how_do_change_password", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                  Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                   getTranslated("how_do_change_password", context),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child:
                           Text("A. Launch the app and log in if you aren’t already. Access the Olga Your Profile screen from the menu. From here, go into the Personal Settings screen and select the Change Password option. Her you can update your password."),
                        )
                      ],
                    ),
                  ),
                ),

                // //!###########################################################################

                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("how_do_change_email", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),

                 Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  getTranslated("how_do_change_email", context),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child:
                           Text("A. Launch the app and log in if you aren’t already. Access the Olga Your Profile screen from the menu. From here, go into the Personal Settings screen and view and edit your email address."),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1.sp),
              ],
            ),

            // Payments
            ExpansionTile(
              title: Text(
                getTranslated("payments", context),
                style: TextStyles.normalBoldTextStyle(context),
              ),
              children: [
                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("how_do_subscribe", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                   Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                   getTranslated("how_do_subscribe", context),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("We’ve made signing up to Olga as easy as possible. You can choose from one of the following options: \n\n    ●  Start your 14-day free trial: for new Olga customers only. \n    ●  Sign in: for existing or returning Olga customers.\n\nOnce you have selected your subscription type, select your preferred language. Now you are active, it’stime to start setting up and personalising your profile by skipping straight to the action and setting yourfist goal."),
                        )
                      ],
                    ),
                  ),
                ),

                //!###########################################################################
                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("how_to_change_payment_card", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),

                 Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Q: What is the difference between basic and premium membership?"
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A. When you sign up to Olga, there are two subscription options that you can choose from – Basic and Premium. Olga’s Basic subscription allows you limited access to certain parts of the app. Olga’s Premium subscription provides access to all areas of the app and will only be restricted when you request an appointed with one of Olga’s coached for a one-on-one session which requires additional payment for the service."),
                        )
                      ],
                    ),
                  ),
                ),
                //!###########################################################################

                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("what_type_of_payment", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                 Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Q: Why am I seeing an error message about my payment card?"
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A. Every now and then you may receive an error message when trying to make a payment in the Olga app. In the event you do experience one of these messages, please try restarting your phone. If you are still experiencing issues when you restart your phone, please delete the app and reinstall it on your phone. If after trying both these measures you are still experiencing error messages, please email us at olga@centreforpositivechange.com.au."),
                        )
                      ],
                    ),
                  ),
                ),
                //!###########################################################################

                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated(
                //               "does_olga_app_charge_register", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                 Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Q:  What type of payment cards can I register to use with the app?"
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A: You can register your Visa, MasterCard and AMEX. Olga also accepts payments from WeChat Pay and Alipay"),
                        )
                      ],
                    ),
                  ),
                ),
                //!###########################################################################

                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("can_i_register_apple_pay", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                 Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Q:  Does Olga charge me to register a payment card?"
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A:  No, Olga does not charge for card registration. When you register a payment card to use with Olga, Olga’s third party provider sends an authentication request to your payment card issuer. This request may be reflected as a temporary transaction on your account. For most card brands, this is a temporary \$0 transaction; however, use of some payment card brands may reflect a temporary \$1 transaction that is subsequently reversed. Each card issuer and payment card brand is different, so please check with your payment card issuer for more information."),
                        )
                      ],
                    ),
                  ),
                ),
                //!###########################################################################

                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("add_edit_remove_payment", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                 Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Q:  Can I register Apple Pay, Android Pay or my mobile wallet to use with Olga?"
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A:   No, unfortunately you cannot yet register Apple Pay, Android Pay or your mobile wallet for automatic payment of your orders at this time. Olga does accept WeChat and Alipay as alternative payment methods."),
                        )
                      ],
                    ),
                  ),
                ),
                //!###########################################################################

                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("when_payment_card_charged", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                 Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Q:  How do I add, remove, and edit payment card information?"
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A:   You can only add or remove card information from the Payment Information page and checkout screens. To add a payment card, simply enter details as prompted on the form and click “Add Card”. To remove a payment card, visit the Payment Methods page in the Payment Information section and delete your account by selecting the rubbish bin icon beside the card you wish to delete."),
                        )
                      ],
                    ),
                  ),
                ),
                //!###########################################################################

                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("who_charges_my_card", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),

                Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Q:  When is my payment card charged?"
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A:   Your payment card will not be charged until you click the Confirm Payment button to finalise your purchase. You will be emailed a receipt of purchase to the email you provided to Olga."),
                        )
                      ],
                    ),
                  ),
                ),
                //!###########################################################################

                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("issue_with_payment", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                 Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Q:   Who charges my payment card when I complete an order?"
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A:   Olga is a trading name of the Centre for Positive Change, a division of Power Coaching Global Pty. Ltd.Once transaction has been finalised your bank statement will show Power Coaching Global Pty. Ltd. as the merchant accepting payment."),
                        )
                      ],
                    ),
                  ),
                ),
                //!###########################################################################

                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("how_do_get_receipt", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Q: What if I have an issue with payment or want a refund?"
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A:   Please contact your bank if you have any questions about charges reflected on your payment card statement (i.e., errors, duplicate charges, etc.). To dispute a Olga transaction for a duplicate charge on your debit or credit card, you need to follow-up with your bank or credit card provider and they will research and take the appropriate action. Also, please be sure to view the receipt we emailed you after your purchase."),
                        )
                      ],
                    ),
                  ),
                ),
                // //!===============================================================


                Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Q: How do I get a receipt for my order?"
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A:    You will receive an email receipt of your order upon successful completion of your purchase and transaction."),
                        )
                      ],
                    ),
                  ),
                ),
                // //!===============================================================
              ],
            ),

            //notification_error_message
            ExpansionTile(
              title: Text(
                getTranslated("notification_error_message", context),
                style: TextStyles.normalBoldTextStyle(context),
              ),
              children: [
                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated(
                //               "why_seeing_eror_about_payment", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                   Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Q: Why am I seeing an error message about my payment card?"
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A: Every now and then you may receive an error message when trying to make a payment in the Olga app. In the event you do experience one of these messages, please first check you have sufficient funds in your account. If upon checking you have sufficient funds, you are still not able to process a payment in the Olga app, please email us at olga@centreforpositivechange.com.au."),
                        )
                      ],
                    ),
                  ),
                ),

//!===================================================================================================

                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated(
                //               "paid_but_cannot_access_anything", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),

                 Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Q:  I have paid for my membership but cannot access anything because it is locked?"
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A: If you are unable to access the Olga app after having made a payment and received an invoice in your email inbox, please email us at olga@centreforpositivechange.com.au."),
                        )
                      ],
                    ),
                  ),
                ),
                //!###########################################################################
                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("why_i_am_getting_error", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),


                  Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "Q: Why am I getting error messages on the Olga app?"
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A: Every now and then you may receive an error message when trying to use the Olga app. In the event you do experience one of these messages, please try restarting your phone. If you are still experiencing issues when you restart your phone, please delete the app and reinstall it on your phone. If after trying both these measures you are still experiencing error messages, please email us at olga@centreforpositivechange.com.au."),
                        )
                      ],
                    ),
                  ),
                ),



                //!###########################################################################

                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("unable_to_log_into_olga_app", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),

                  Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                   getTranslated("unable_to_log_into_olga_app", context),
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A: If you're unable to log into your Olga account, try changing your password or send yourself a password reset email. Please also ensure and confirm your phone number and email address in account settings are correct."),
                        )
                      ],
                    ),
                  ),
                ),

                //!###########################################################################
                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated(
                //               "what_can_i_do_if_i_forgot_password", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                 Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                   getTranslated("what_can_i_do_if_i_forgot_password", context),),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A: . If you can't remember your password, you can reset it using your email address. To reset your password, first open Olga app. From there:\n\n1.On the login screen, tap “Forgot Password” below \“Sign In\”.\n\n2.Enter email.\n\n3.Tap “Continue” and follow the on-screen instructions."),
                        )
                      ],
                    ),
                  ),
                ),
                //!###########################################################################
                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated(
                //               "what_can_do_ifnot_receive_resetpasswor",
                //               context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),

                 Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                   getTranslated(
                              "what_can_do_ifnot_receive_resetpasswor",
                              context),),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A: . If you're not receiving the password reset email, it's possible the email is going in your email's spam filter. It may also be possible that you mistyped your email when you first signed up for Olga.\n\nTo find your password reset email, try:\n\n  ●  Checking the spam filter on your email account\n  ● Getting in touch with your email service provider to make sure you're able to get emails from the @olga.com domain.Getting in touch with your email service provider to make sure you're able to get emails from the @olga.com domain.\n\nIf you mistyped your email address when signing up for your account, we're not able to give you access to this account."),
                        )
                      ],
                    ),
                  ),
                ),
                //!###########################################################################
                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("olga_account_disable", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),

                 Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                    getTranslated("olga_account_disable", context),),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A: . If your Olga account was disabled, you’ll see a message telling you when you try to log in. Accounts that don't follow our Terms of Use may be disabled without warning. We suggest that you review the Terms of Use carefully. Keep in mind; we may permanently remove an account that repeatedly violates the Terms of Use.\n\nIf you think your account was disabled by mistake, you may be able to appeal the decision by opening the app, entering your username and password and following the on-screen instructions.\n\nIf you don’t see a disabled message, you may be experiencing a login issue. If your account was deleted by you or someone with your password, there's no way to restore it. You can create a new account with the same email address you used before."),
                        )
                      ],
                    ),
                  ),
                ),
                //!###########################################################################
                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("change_email_phone_number", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),

                Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                    getTranslated("olga_account_disable", context),),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A:  If you can't regain access to the email or phone number you used to sign up for Olga, you'll need to log into Olga and change the email or phone number on your profile with a new email account that you can access. This is necessary to ensure you can continue to access Olga and to ensure someone else can't gain access to your Olga account with an email or phone number you no longer use.\n\nNote: Before you begin, make sure you can already access Olga with your email. If you can't access Olga and reach your Olga profile settings, you won't be able to continue.\n\nAfter you've changed your Olga email, the new email will receive a pin code to enter into the app to confirm or deny the change."),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.sp),

            //location_service
            ExpansionTile(
              title: Text(
                getTranslated("location_service", context),
                style: TextStyles.normalBoldTextStyle(context),
              ),
              children: [
                //!###########################################################################
                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("what_are_location_service", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                  Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                     getTranslated("what_are_location_service", context),
                                     ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A:  Location services is a setting in the Olga app that lets us know where you are in the vicinity of your order location, so we can link you to a coach closest to you. You have choices as to location services: “Never”, “While using app”, or “Always”. If you choose “While using app”, or “Always” Olga will use your current location."),
                        )
                      ],
                    ),
                  ),
                ),
                //!###########################################################################
                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("why_should_location_service", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                     getTranslated("why_should_location_service", context),
                                     ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A: If you choose “while using the app” or “Always”, Olga will use your current location to locate nearby coaches. The location is key to placing you with a coach that is as culturally sensitive to your surroundings as possible."),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.sp),

            // Feedback/Contact us
            ExpansionTile(
              title: Text(
                getTranslated("feedback_contact", context),
                style: TextStyles.normalBoldTextStyle(context),
              ),
              children: [
                //!###########################################################################
                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated("how_can_provide_feedback", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                Theme(
                          data:
                              Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                   getTranslated("how_can_provide_feedback", context),
                                     ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A: . Please visit www.centreforpositivechange.com.au/olga-feedback-form and follow the prompts to provide us with feedback on your experience"),
                        )
                      ],
                    ),
                  ),
                ),
                //!###########################################################################
                // Container(
                //   color: Colors.grey.shade200,
                //   padding: EdgeInsets.all(10.sp),
                //   margin: EdgeInsets.all(10.sp),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Flexible(
                //         child: Text(
                //           getTranslated(
                //               "how_can_contact_adminidtrator", context),
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Icon(
                //           Icons.arrow_forward_ios_rounded,
                //           color: Color(0xFFB5B5BF),
                //         ),
                //       )
                //     ],
                //   ),
                // ),

                Theme(
                          data: Theme.of(context).copyWith(dividerColor: Colors.transparent,indicatorColor: Colors.red),
                  child: Container(
                     // padding: EdgeInsets.all(10.sp),
                         margin: EdgeInsets.all(10.sp),
                     color: Colors.grey.shade200,
                    child: ExpansionTile(
                               expandedAlignment: Alignment.centerLeft,
                     title: Container(
                          //: Colors.grey.shade200,
                          // padding: EdgeInsets.all(10.sp),
                          // margin: EdgeInsets.all(10.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  getTranslated( "how_can_contact_adminidtrator", context),
                                     ),
                              ),
                              // GestureDetector(
                              //   onTap: () {},
                              //   child: Icon(
                              //     Icons.arrow_forward_ios_rounded,
                              //     color: Color(0xFFB5B5BF),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.sp),
                          child: Text("A: To contact Olga, please email us at olga@centreforpositivechange.com.au or use the “Contact us” page in the app and follow the prompts to send us your message."),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.sp),
          ],
        ),
      ),
    );
  }
}
