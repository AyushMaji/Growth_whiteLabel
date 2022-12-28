// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/screens/video_calling/appoinment_done.dart';
import 'package:http/http.dart' as http;
class AddCardDetails extends StatefulWidget {
  static const String id = "/addCardDetails";
  const AddCardDetails({Key? key}) : super(key: key);

  @override
  State<AddCardDetails> createState() => _AddCardDetailsState();
}

class _AddCardDetailsState extends State<AddCardDetails> {
   Map<String, dynamic>? paymentIntentData;
  Color? color;
  bool _isSelected = false;
  String _title = "Vision Dashboard";
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const NoBackPressAppbar(),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.0, bottom: 16, right: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Add credit card or debit card",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Enter your credit/debit card  information. We will save  this  card  so you can use it again later",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 30.h,
                ),

                //=============================================1st field=============
                Text(
                  "Card Number",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEAECEE),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  margin: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    //controller: cardNumController, //
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 15.h),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "0000 0000  0000  0000",
                        hintStyle: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.black.withOpacity(0.4)),
                        suffixIcon:
                            Icon(Icons.credit_card_rounded, size: 17.0)),
                  ),
                ),

                //============================================2nd field=============
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Cardholder name",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEAECEE),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  margin: EdgeInsets.only(top: 10),
                  child: TextFormField(
                    //controller: cardNumController, //
                    keyboardType: TextInputType.text,

                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 15.h),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "ex. Jonathan Paul Ive",
                      hintStyle: TextStyle(
                          fontFamily: "Poppins",
                          color: Colors.black.withOpacity(0.4)),
                      // suffixIcon:
                      //     Icon(Icons.credit_card_outlined, size: 17.0)
                    ),
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),

                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        //color: Colors.RED,
                        height: 100.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Expiry date",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFf0f0f0),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              margin: EdgeInsets.only(top: 10),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 15.h),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    hintText: "MM /YYYY",
                                    hintStyle: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.black.withOpacity(0.4)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 100.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "CVV",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                GestureDetector(
                                  onTap: () => () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        "3 digit number on back of your card",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                        ),
                                      ),
                                      backgroundColor: Color(0xff362477),
                                    ));
                                  },
                                  child: Icon(
                                    Icons.help_outline_sharp,
                                    color: Color(0xff362477),
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFf0f0f0),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              margin: EdgeInsets.only(top: 10),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 15.h),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    hintText: "3-4 digits",
                                    hintStyle: TextStyle(
                                        fontFamily: "Poppins",
                                        color: Colors.black.withOpacity(0.4)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 10.h,
                ),

                SubmitButton(
                  onPressed: () async{
                   await makePayment();
                  },
                  title: 'ADD CARD',
                  buttonStyle: ButtonStyles.getCommonStyle(context),
                  //getTranslated('continue', context),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey.shade50,
        selectedItemColor: Colors.red.shade800,
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              Images.love,
              width: 20.w,
              color: _isSelected ? Colors.grey : Colors.red,
            ),
            label: 'Vision Board',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.location_pin),
            label: 'Learn',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Coach',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Journal',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0) {
        _title = "Vision Dashboard";
        _isSelected = false;
      } else if (index == 1) {
        _title = "Learn";
        _isSelected = true;
      } else if (index == 2) {
        _title = "My Coach";
        _isSelected = true;
      } else {
        _title = "Journal";
        _isSelected = true;
      }
    });
  }


  //!##########################################################################
   Future<void> makePayment() async {
    try {

      paymentIntentData = await createPaymentIntent('20', 'USD'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntentData!['client_secret'],
              applePay: true,
              googlePay: true,
              testEnv: true,
              style: ThemeMode.dark,
              merchantCountryCode: 'US',
              merchantDisplayName: 'ANNIE')).then((value){
      });


      ///now finally display payment sheeet

      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {

    try {
      await Stripe.instance.presentPaymentSheet(
          parameters: PresentPaymentSheetParameters(
            clientSecret: paymentIntentData!['client_secret'],
            confirmPayment: true,
          )).then((newValue){


        print('payment intent${paymentIntentData!['id']}');
        print('payment intent${paymentIntentData!['client_secret']}');
        print('payment intent${paymentIntentData!['amount']}');
        print('payment intent$paymentIntentData');
        //orderPlaceApi(paymentIntentData!['id'].toString());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Paid successfully")));

        paymentIntentData = null;
        goPageWithName(context, AppoinmentDone.id);
        

      }).onError((error, stackTrace){
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });


    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Text("Cancelled "),
          ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':'Bearer sk_test_51IcQKWDwwlfx8vZDtKSBliM7hrut2EVKMBrq4L8oV1gfy4PgtTQqrlS7SfNKO6HunhNkW4lXmULh2bEiTUjLXEOQ00Z377rtca',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100 ;
    return a.toString();
  }
}
