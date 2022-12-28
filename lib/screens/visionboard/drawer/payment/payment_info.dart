import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/widgets/loader.dart';
import 'package:olga/models/data_model/available_slot_model.dart';
import 'package:olga/models/data_model/card_token_model.dart';
import 'package:olga/provider/payment_provider.dart';
import 'package:olga/screens/visionboard/visionboard.dart';
import 'package:provider/provider.dart';

import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';

import '../../../../global/constants/images.dart';
import 'add_card.dart';

class PaymentInfo extends StatefulWidget {
  static const String id = "/paymentInformation";
  const PaymentInfo({Key? key, this.slotData}) : super(key: key);
  final BookingSlotData? slotData;
  @override
  State<PaymentInfo> createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {

  @override
  void initState() {
    super.initState();
    Provider.of<PaymentProvider>(context, listen: false).cardToken();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          dashboardAppBar(context, getTranslated("payment_methods", context)),
      body:
          Consumer<PaymentProvider>(
            builder: (context, paymentProvider, child) {
             if (paymentProvider.cardTokenListModel.response == null || paymentProvider.cardTokenListModel.response?.cardList == null || paymentProvider.cardTokenListModel.response!.cardList!.isEmpty) {
                return const Card(child: Center(child: Text("No card found")));
              } else {
                return ListView.builder(
                itemCount: paymentProvider.cardTokenListModel.response!.cardList!.length,
                itemBuilder: (BuildContext context, int index) {
                  Token? card = paymentProvider.cardTokenListModel.response!.cardList![index];
                  // ManualCreditCard cardData = ManualCreditCard.fromJson(card);
                  return Card(
                    child: Container(
                      padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5.h),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Image.asset(Images.masterCard, width: 40),
                            onTap: widget.slotData == null
                                ? null
                                : () async {
                                    Loader.show(context);
                                    PaymentProvider provider =
                                        Provider.of<PaymentProvider>(context,
                                            listen: false);
/*                                     UserCard? userCard = await provider
                                        .createCardToken(cardData); */
                                    if (widget.slotData != null &&
                                        card.token != null) {
                                      await provider.chargeWithCard(
                                          amount: widget.slotData!.price!,
                                          cardToken: card.token!,
                                          currency: "INR",
                                          bookingId:
                                              widget.slotData!.id!.toString(),
                                          context: context);
                                          // widget.slotData.
                                    }
                                    Loader.hide();
                                  },
                            title: Text(
                                "**** **** **** ${card.last4Digits}"), // comes from database
                            subtitle:
                                const Text("Primary"), // comes from database
                            trailing: FittedBox(
                              fit: BoxFit.fill,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                    /*   setState(() {
                                        AlartDialogBox.removeCardAlartBox(
                                            context, card);
                                        print("removing index ===>>> $index");
                                        //storeProvider.updateCardIndex(index);
                                      }); */
                                    },
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      goPage(
                                          context,
                                          AddNewCard(
                                              title: getTranslated(
                                                  "edit", context)));
                                    },
                                    child: const Text(
                                      "Edit",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //CardWidget(),
                        ],
                      ),
                    ),
                  );
                },
              );
              }
      }),
      bottomSheet: Padding(
        padding: EdgeInsets.all(15.sp),
        child: SubmitButton(
          title: getTranslated("add_new_payment", context),
          onPressed: () {
            setState(() {});
            goPage(context,
                AddNewCard(title: getTranslated("add_new_payment", context)));
          },
          buttonStyle: ButtonStyles.getCommonStyle(context),
        ),
      ),
    );
  }
}


