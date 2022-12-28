class PaymentHistoryModel {
  String? msg;
  int? statuscode;
  Data? data;

  PaymentHistoryModel({this.msg, this.statuscode, this.data});

  PaymentHistoryModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statuscode = json['statuscode'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['msg'] = msg;
    data['statuscode'] = statuscode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<PaymentDetails>? paymentDetails;

  Data({this.paymentDetails});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['payment_details'] != null) {
      paymentDetails = <PaymentDetails>[];
      json['payment_details'].forEach((v) {
        paymentDetails!.add(PaymentDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (paymentDetails != null) {
      data['payment_details'] =
          paymentDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PaymentDetails {
  int? id;
  String? bookingId;
  String? userId;
  String? chargeId;
  String? transactionId;
  String? amount;
  String? currency;
  String? captured;
  String? paymentMethod;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  PaymentDetails(
      {this.id,
      this.bookingId,
      this.userId,
      this.chargeId,
      this.transactionId,
      this.amount,
      this.currency,
      this.captured,
      this.paymentMethod,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    userId = json['user_id'];
    chargeId = json['charge_id'];
    transactionId = json['transaction_id'];
    amount = json['amount'];
    currency = json['currency'];
    captured = json['captured'];
    paymentMethod = json['payment_method'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['booking_id'] = bookingId;
    data['user_id'] = userId;
    data['charge_id'] = chargeId;
    data['transaction_id'] = transactionId;
    data['amount'] = amount;
    data['currency'] = currency;
    data['captured'] = captured;
    data['payment_method'] = paymentMethod;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
