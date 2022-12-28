// ignore_for_file: avoid_print, unused_local_variable
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:olga/models/api_model/api_model.dart';
import 'package:olga/provider/profile_provider.dart';
import 'package:olga/provider/slot_boking_provider.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/visionboard/drawer/payment/add_card.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../global/constants/app_constants.dart';
import '../global/methods/methods.dart';
import '../global/widgets/loader.dart';
import '../models/data_model/card_payment_model.dart';
import '../models/data_model/card_token_model.dart';
import '../models/data_model/charge_with_card_model.dart';
import '../models/data_model/payment_history_model.dart';
import '../models/data_model/payment_intent_model.dart';
import '../screens/visionboard/visionboard.dart';

class PaymentProvider extends ChangeNotifier {
  late final SharedPreferences? prefs;
  PaymentProvider({this.prefs});

  // ====================== |> Payment With Card <| ===================== //
  PaymentIntentModel paymentIntentModel = PaymentIntentModel();
  Future paymentIntent({
    required String amount,
    required BuildContext context,
  }) async {
    Map<String, dynamic> params = {};
    params['amount'] = amount;

    var apiUrl = AppConstants.baseURL + AppConstants.paymentIntentURI;
    var postResponse = await ApiModel.post(params, apiUrl);
    log(" this is register url ===>>> $apiUrl \n This is response ===>>> $postResponse ");
    log(" ============================== The End ============================== ");
    cardPaymentModel = CardPaymentModel.fromJson(postResponse);

    if (cardPaymentModel.statuscode == "200") {
      showToast("Success", context);
    }
  }

  // ====================== |> Get Card Payment Token <| ===================== //
  CardTokenListModel cardTokenListModel = CardTokenListModel(); //
  Future<CardTokenListModel> cardToken() async {
    var apiURL = AppConstants.baseURL + AppConstants.cardTokenURI;
    var getResponse = await ApiModel.get(apiURL);
    cardTokenListModel = CardTokenListModel.fromJson(getResponse);
    print("Payment details URL ===>>> $apiURL");
    print("getting payment details API response ===>>> $getResponse");
    notifyListeners();
    return cardTokenListModel;
  }

  // ====================== |> Payment With Card <| ===================== //
  CardPaymentModel cardPaymentModel = CardPaymentModel();
  Future cardPayment({
    required String cardNumber,
    required String expiryMonth,
    required String expiryYear,
    required String cvv,
    required BuildContext context,
  }) async {
    /* Loader.show(context,
        progressIndicator:
            const CircularProgressIndicator(color: Color(0xffDEB988))); */

    Map<String, dynamic> params = {};
    params['card_number'] = cardNumber;
    params['expiry_month'] = expiryMonth;
    params['expiry_year'] = expiryYear;
    params['cvv'] = cvv;

    var apiUrl = AppConstants.baseURL + AppConstants.cardPaymentURI;
    var postResponse = await ApiModel.post(params, apiUrl);
    log(" this is register url ===>>> $apiUrl \n This is response ===>>> $postResponse ");
    log(" ============================== The End ============================== ");
    cardPaymentModel = CardPaymentModel.fromJson(postResponse);

    if (cardPaymentModel.statuscode == "200") {
      showToast("Success", context);
    }
  }

  // ====================== |> Payment With Card <| ===================== //
  ChargeWithCardModel chargeWithCardModel = ChargeWithCardModel();
  Future chargeWithCard({
    required String amount,
    required String cardToken,
    required String currency,
    required String bookingId,
    required BuildContext context,
  }) async {
    /* Loader.show(context,
        progressIndicator:
            const CircularProgressIndicator(color: Color(0xffDEB988))); */

    Map<String, dynamic> params = {};
    params['amount'] = "10000";
    params['token'] = cardToken;
    params['currency'] = currency;
    params['booking_id'] = bookingId;
    print("This is the perameter of Charge with token => ${params}");
    var apiUrl = AppConstants.baseURL + AppConstants.chargeWithCardURI;
    var postResponse = await ApiModel.post(params, apiUrl);
    log(" this is register url ===>>> $apiUrl \n This is response ===>>> $postResponse ");
    log(" ============================== The End ============================== ");
    chargeWithCardModel = ChargeWithCardModel.fromJson(postResponse);

    if (chargeWithCardModel.statuscode == 200) {
      ProfileProvider profileData =
          Provider.of<ProfileProvider>(context, listen: false);
      StorageProvider storageProvider =
          Provider.of<StorageProvider>(context, listen: false);
      showToast("Success", context);

      DateTime selectedDateTime =
          DateFormat("dd-MM-yyyy").parse(storageProvider.appoimentDate);
      String formattedAppointmentDate =
          DateFormat('yyyy-MM-dd hh:mm:ss').format(selectedDateTime);

      await Provider.of<SlotBookingProvider>(context, listen: false).bookTheAvailableSlot(
          slotId: bookingId,
          coachId: "395",
          isExtended: 0,
          extendedlotId: 0,
          email: profileData.profileModel.data!.userDetails!.email!,
          phone: profileData.profileModel.data!.userDetails!.phoneNumber!,
          appointmentDate: formattedAppointmentDate,
          context: context);
    }
  }

  // =================== |> Payment History <| =================== //
  PaymentHistoryModel paymentHistoryModel = PaymentHistoryModel();
  Future paymentHistory() async {
    var apiURL = AppConstants.baseURL + AppConstants.paymentHistory;
    var getResponse = await ApiModel.get(apiURL);
    paymentHistoryModel = PaymentHistoryModel.fromJson(getResponse);

    print("Payment details URL ===>>> $apiURL");
    print("getting payment details API response ===>>> $getResponse");
    notifyListeners();
  }

  Future createCardToken(ManualCreditCard card) async {
    Map<String, String> params = {};
    List<String> expiry = card.expireDate.split('/');
    String month = expiry[0];
    String year = expiry[1];
    params['card_number'] = card.cardNumber.replaceAll(r" ", "");
    params['expiry_month'] = month;
    params['expiry_year'] = year;
    params['cvv'] = card.cvc;
    print(params);
    String url = AppConstants.baseURL + AppConstants.createCardToken;
    var response = await ApiModel.post(params, url);
    log(response.toString());
    if (response['statuscode'] == 200) {
      CardTokenResponse apiRes = CardTokenResponse.fromJson(response);
      log("TOKEN: => ${apiRes.data?.userCard?.token}");
      if (apiRes.data?.userCard?.token != null) {
        return apiRes.data!.userCard;
      } else {
        return null;
      }
    } else {
      log("Getting Token Error response => ${response.toString()}");
      return null;
    }
  }
}

class CardTokenResponse {
  String? msg;
  int? statuscode;
  Data? data;

  CardTokenResponse({this.msg, this.statuscode, this.data});

  CardTokenResponse.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statuscode = json['statuscode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['msg'] = msg;
    map['statuscode'] = statuscode;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }
}

class Data {
  UserCard? userCard;

  Data({this.userCard});

  Data.fromJson(Map<String, dynamic> json) {
    userCard =
        json['user_card'] != null ? UserCard.fromJson(json['user_card']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userCard != null) {
      data['user_card'] = userCard!.toJson();
    }
    return data;
  }
}

class UserCard {
  String? token;
  StripeTokenResponse? stripeTokenResponse;
  String? last4Digits;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  UserCard(
      {this.token,
      this.stripeTokenResponse,
      this.last4Digits,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id});

  UserCard.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    stripeTokenResponse = json['stripe_token_response'] != null
        ? StripeTokenResponse.fromJson(json['stripe_token_response'])
        : null;
    last4Digits = json['last_4_digits'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (stripeTokenResponse != null) {
      data['stripe_token_response'] = stripeTokenResponse!.toJson();
    }
    data['last_4_digits'] = last4Digits;
    data['user_id'] = userId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class StripeTokenResponse {
  String? id;
  String? object;
  String? addressCity;
  String? addressCountry;
  String? addressLine1;
  String? addressLine1Check;
  String? addressLine2;
  String? addressState;
  String? addressZip;
  String? addressZipCheck;
  String? brand;
  String? country;
  String? cvcCheck;
  String? dynamicLast4;
  int? expMonth;
  int? expYear;
  String? fingerprint;
  String? funding;
  String? last4;
  List<String>? metadata;
  String? name;
  String? tokenizationMethod;

  StripeTokenResponse(
      {this.id,
      this.object,
      this.addressCity,
      this.addressCountry,
      this.addressLine1,
      this.addressLine1Check,
      this.addressLine2,
      this.addressState,
      this.addressZip,
      this.addressZipCheck,
      this.brand,
      this.country,
      this.cvcCheck,
      this.dynamicLast4,
      this.expMonth,
      this.expYear,
      this.fingerprint,
      this.funding,
      this.last4,
      this.metadata,
      this.name,
      this.tokenizationMethod});

  StripeTokenResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    addressCity = json['address_city'];
    addressCountry = json['address_country'];
    addressLine1 = json['address_line1'];
    addressLine1Check = json['address_line1_check'];
    addressLine2 = json['address_line2'];
    addressState = json['address_state'];
    addressZip = json['address_zip'];
    addressZipCheck = json['address_zip_check'];
    brand = json['brand'];
    country = json['country'];
    cvcCheck = json['cvc_check'];
    dynamicLast4 = json['dynamic_last4'];
    expMonth = json['exp_month'];
    expYear = json['exp_year'];
    fingerprint = json['fingerprint'];
    funding = json['funding'];
    last4 = json['last4'];
    if (json['metadata'] != null) {
      metadata = <String>[];
      json['metadata'].forEach((v) {
        metadata!.add(v);
      });
    }
    name = json['name'];
    tokenizationMethod = json['tokenization_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['object'] = object;
    data['address_city'] = addressCity;
    data['address_country'] = addressCountry;
    data['address_line1'] = addressLine1;
    data['address_line1_check'] = addressLine1Check;
    data['address_line2'] = addressLine2;
    data['address_state'] = addressState;
    data['address_zip'] = addressZip;
    data['address_zip_check'] = addressZipCheck;
    data['brand'] = brand;
    data['country'] = country;
    data['cvc_check'] = cvcCheck;
    data['dynamic_last4'] = dynamicLast4;
    data['exp_month'] = expMonth;
    data['exp_year'] = expYear;
    data['fingerprint'] = fingerprint;
    data['funding'] = funding;
    data['last4'] = last4;
    if (metadata != null) {
      data['metadata'] = metadata!.map((v) => v).toList();
    }
    data['name'] = name;
    data['tokenization_method'] = tokenizationMethod;
    return data;
  }
}
