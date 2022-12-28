// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/widgets/loader.dart';
import 'package:provider/provider.dart';
import 'package:olga/global/constants/color_resources.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/screens/visionboard/drawer/payment/payment_info.dart';

import '../../../../provider/payment_provider.dart';

class AddNewCard extends StatefulWidget {
  static const String id = "AddNewCard";
  final String? title;
  const AddNewCard({Key? key, required this.title}) : super(key: key);

  @override
  State<AddNewCard> createState() => _AddNewCardState(title);
}

class _AddNewCardState extends State<AddNewCard> {
  final _formKey = GlobalKey<FormState>();

  String? title;
  _AddNewCardState(this.title);

  final _cardNumberController =
      TextEditingController(text: "4242 4242 4242 4242");
  final _holderNameController = TextEditingController(text: "Mr. XZY");
  final _expireDateController = TextEditingController(text: "05/23");
  final _cvcController = TextEditingController(text: "596");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardAppBar(context, title ?? "null"),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.sp),
                Text(
                  getTranslated("add_credit_debit_card", context),
                  style: TextStyles.normalBoldTextStyle(context),
                ),
                SizedBox(height: 10.sp),
                Text(getTranslated("enter_your_card_information", context)),
                SizedBox(height: 30.sp),

                //
                Text(
                  getTranslated("card_number", context),
                  style: TextStyles.regularBoldTextStyle(context),
                ),
                TextFormField(
                  controller: _cardNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: "0000 0000 0000 0000",
                    suffixIcon: const Icon(Icons.payment),
                  ),
                  onChanged: (value) {},
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Card number is required";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.sp),

                //
                Text(
                  getTranslated("cardholder_name", context),
                  style: TextStyles.regularBoldTextStyle(context),
                ),
                TextFormField(
                  onChanged: (value) {},
                  controller: _holderNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: "ex. Jonathan Paul lve",
                  ),
                ),
                SizedBox(height: 20.sp),

                //
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              getTranslated("expiry_date", context),
                              style: TextStyles.regularBoldTextStyle(context),
                            ),
                          ),
                          TextFormField(
                            controller: _expireDateController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              filled: true,
                              fillColor: Colors.grey.shade300,
                              hintText: "MM / YYYY",
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.sp),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                getTranslated("cvc", context),
                                style: TextStyles.regularBoldTextStyle(context),
                              ),
                              InkWell(
                                onTap: () {
                                  //
                                },
                                child: Card(
                                  color: ColorResources.getButtonCalicoColor(
                                      context),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(2.0),
                                    child: Icon(Icons.question_mark, size: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: _cvcController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              filled: true,
                              fillColor: Colors.grey.shade300,
                              hintText: "3-4 digits",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.sp),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.all(15.sp),
        child: SubmitButton(
          title: getTranslated("add_card", context),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              Loader.show(context);
              ManualCreditCard newCard = ManualCreditCard(
                  cardNumber: _cardNumberController.text,
                  holderName: _holderNameController.text,
                  expireDate: _expireDateController.text,
                  cvc: _cvcController.text);
              PaymentProvider provider =
                  Provider.of<PaymentProvider>(context, listen: false);
              UserCard? userCard = await provider.createCardToken(newCard);
              if (userCard == null) {
                Loader.hide();
                if(mounted) showToast("Error happened in adding Card!", context);
              } else {
                Loader.hide();
                await provider.cardToken();
                if(mounted) Navigator.pop(context);
              }
/*                 StorageProvider storeProvider =
                    Provider.of<StorageProvider>(context, listen: false); 
                storeProvider.addCardDetails(newCard);*/

            }
          },
          buttonStyle: ButtonStyles.getCommonStyle(context),
        ),
      ),
    );
  }
}

class ManualCreditCard {
  String cardNumber;
  String holderName;
  String expireDate;
  String cvc;

  ManualCreditCard({
    required this.cardNumber,
    required this.holderName,
    required this.expireDate,
    required this.cvc,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'cardNumber': cardNumber});
    result.addAll({'holderName': holderName});
    result.addAll({'expireDate': expireDate});
    result.addAll({'cvc': cvc});

    return result;
  }

  factory ManualCreditCard.fromMap(Map<String, dynamic> map) {
    return ManualCreditCard(
      cardNumber: map['cardNumber'] ?? '',
      holderName: map['holderName'] ?? '',
      expireDate: map['expireDate'] ?? '',
      cvc: map['cvc'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ManualCreditCard.fromJson(String source) =>
      ManualCreditCard.fromMap(json.decode(source));
}
