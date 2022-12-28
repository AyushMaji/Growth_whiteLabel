class CardPaymentModel {
  String? msg;
  int? statuscode;
  Data? data;

  CardPaymentModel({this.msg, this.statuscode, this.data});

  CardPaymentModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statuscode = json['statuscode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['statuscode'] = this.statuscode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  UserCard? userCard;

  Data({this.userCard});

  Data.fromJson(Map<String, dynamic> json) {
    userCard = json['user_card'] != null
        ? new UserCard.fromJson(json['user_card'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userCard != null) {
      data['user_card'] = this.userCard!.toJson();
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
        ? new StripeTokenResponse.fromJson(json['stripe_token_response'])
        : null;
    last4Digits = json['last_4_digits'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.stripeTokenResponse != null) {
      data['stripe_token_response'] = this.stripeTokenResponse!.toJson();
    }
    data['last_4_digits'] = this.last4Digits;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
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
  List? metadata;
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
      metadata = [];
      json['metadata'].forEach((v) {
        metadata!.add(metadata);
      });
      /*  
      json['metadata'].forEach((v) {
        metadata!.add(new Null.fromJson(v));
      }); 
      */
    }
    name = json['name'];
    tokenizationMethod = json['tokenization_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['address_city'] = this.addressCity;
    data['address_country'] = this.addressCountry;
    data['address_line1'] = this.addressLine1;
    data['address_line1_check'] = this.addressLine1Check;
    data['address_line2'] = this.addressLine2;
    data['address_state'] = this.addressState;
    data['address_zip'] = this.addressZip;
    data['address_zip_check'] = this.addressZipCheck;
    data['brand'] = this.brand;
    data['country'] = this.country;
    data['cvc_check'] = this.cvcCheck;
    data['dynamic_last4'] = this.dynamicLast4;
    data['exp_month'] = this.expMonth;
    data['exp_year'] = this.expYear;
    data['fingerprint'] = this.fingerprint;
    data['funding'] = this.funding;
    data['last4'] = this.last4;
    if (this.metadata != null) {
      data['metadata'] = metadata!.map((v) => v!.toJson()).toList();
    }
    data['name'] = this.name;
    data['tokenization_method'] = this.tokenizationMethod;
    return data;
  }
}
