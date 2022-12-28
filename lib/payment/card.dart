// main.dart
// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:provider/provider.dart';
import '../provider/payment_provider.dart';
import '../screens/video_calling/appoinment_done.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
    /* String key = "sk_test_tR3PYbcVNZZ796tH88S4VQ2u";
      String secretKey = "sk_test_51LGN5QF6iSarkAoVl36MKRFtY3aZhQOZxOoPaH7zE7GFtTugoDNuTMwHZb8elsKP7DupckTGpXk7rG0djgUZRnxS00tLMxfVWO";
      String token = "657|jTWCQJgPm3GQzsWgU8biUvYKYpB6TdmsGQNNdVI6"; */

  Map<String, dynamic>? paymentIntentData;  
  Future<void> initPayment({
      required String amount,
      required String currency,
      required BuildContext context,
    
      }) async {
    try {
      // 1. Create a payment intent on the server
      final response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: {
            'amount': amount.toString(),
            'currency': currency,
            'payment_method_types[]': 'card'
          },
             headers: {
             'Authorization': 'Bearer sk_test_51LGN5QF6iSarkAoVl36MKRFtY3aZhQOZxOoPaH7zE7GFtTugoDNuTMwHZb8elsKP7DupckTGpXk7rG0djgUZRnxS00tLMxfVWO',
              'Content-Type': 'application/x-www-form-urlencoded'
          });
          

      final jsonResponse = jsonDecode(response.body);
      log(jsonResponse.toString());

        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: jsonResponse['paymentIntent'],
          merchantDisplayName: 'Grocery Flutter course',
          customerId: jsonResponse['customer'],
          customerEphemeralKeySecret: jsonResponse['ephemeralKey'],
          testEnv: true,
          merchantCountryCode: 'aud',
        ));

      await Stripe.instance.presentPaymentSheet();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Payment is successful'),
        ),
      );
    } catch (errorr) {
      if (errorr is StripeException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occured ${errorr.error.localizedMessage}'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occured $errorr'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: const Text('Pay 20\$'),
        onPressed: () async {

       await makePayment();

        },
      )),
    );
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


        print('payment intent'+paymentIntentData!['id'].toString());
        print('payment intent'+paymentIntentData!['client_secret'].toString());
        print('payment intent'+paymentIntentData!['amount'].toString());
        print('payment intent'+paymentIntentData.toString());
        //orderPlaceApi(paymentIntentData!['id'].toString());
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Paid successfully")));

        paymentIntentData = null;
        goPageWithName(context, AppoinmentDone.id);
        

      }).onError((error, stackTrace){
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });


    } on StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            content: Text("Cancelled "),
          ));
    } catch (e) {
      print('$e');
    }
  }

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

