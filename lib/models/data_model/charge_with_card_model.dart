class ChargeWithCardModel {
  String? msg;
  int? statuscode;
  Data? data;

  ChargeWithCardModel({this.msg, this.statuscode, this.data});

  ChargeWithCardModel.fromJson(Map<String, dynamic> json) {
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
  Response? response;

  Data({this.response});

  Data.fromJson(Map<String, dynamic> json) {
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  int? userId;
  String? chargeId;
  String? transactionId;
  int? amount;
  String? currency;
  bool? captured;
  String? paymentMethod;
  String? bookingId; //* THIS WAS CHANGED TO STRING AFTER AN ERROR!
  String? updatedAt;
  String? createdAt;
  int? id;

  Response(
      {this.userId,
      this.chargeId,
      this.transactionId,
      this.amount,
      this.currency,
      this.captured,
      this.paymentMethod,
      this.bookingId,
      this.updatedAt,
      this.createdAt,
      this.id});

  Response.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    chargeId = json['charge_id'];
    transactionId = json['transaction_id'];
    amount = json['amount'];
    currency = json['currency'];
    captured = json['captured'];
    paymentMethod = json['payment_method'];
    bookingId = json['booking_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['charge_id'] = this.chargeId;
    data['transaction_id'] = this.transactionId;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['captured'] = this.captured;
    data['payment_method'] = this.paymentMethod;
    data['booking_id'] = this.bookingId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
