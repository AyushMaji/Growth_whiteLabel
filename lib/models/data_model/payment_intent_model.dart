class PaymentIntentModel {
  String? msg;
  int? statuscode;
  Data? data;

  PaymentIntentModel({this.msg, this.statuscode, this.data});

  PaymentIntentModel.fromJson(Map<String, dynamic> json) {
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
  Data({
    required this.intent,
  });
  late final Intent intent;
  
  Data.fromJson(Map<String, dynamic> json){
    intent = Intent.fromJson(json['intent']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['intent'] = intent.toJson();
    return _data;
  }
}

class Intent {
  Intent({
    required this.id,
    required this.object,
    required this.amount,
    required this.amountCapturable,
    required this.amountDetails,
    required this.amountReceived,
     this.application,
     this.applicationFeeAmount,
    required this.automaticPaymentMethods,
     this.canceledAt,
     this.cancellationReason,
    required this.captureMethod,
    required this.charges,
    required this.clientSecret,
    required this.confirmationMethod,
    required this.created,
    required this.currency,
    required this.customer,
     this.description,
     this.invoice,
     this.lastPaymentError,
    required this.livemode,
    required this.metadata,
     this.nextAction,
     this.onBehalfOf,
     this.paymentMethod,
    required this.paymentMethodOptions,
    required this.paymentMethodTypes,
     this.processing,
     this.receiptEmail,
     this.review,
    required this.setupFutureUsage,
     this.shipping,
     this.source,
     this.statementDescriptor,
     this.statementDescriptorSuffix,
    required this.status,
     this.transferData,
     this.transferGroup,
  });
  late final String id;
  late final String object;
  late final int amount;
  late final int amountCapturable;
  late final AmountDetails amountDetails;
  late final int amountReceived;
  late final Null application;
  late final Null applicationFeeAmount;
  late final AutomaticPaymentMethods automaticPaymentMethods;
  late final Null canceledAt;
  late final Null cancellationReason;
  late final String captureMethod;
  late final Charges charges;
  late final String clientSecret;
  late final String confirmationMethod;
  late final int created;
  late final String currency;
  late final String customer;
  late final Null description;
  late final Null invoice;
  late final Null lastPaymentError;
  late final bool livemode;
  late final List<dynamic> metadata;
  late final Null nextAction;
  late final Null onBehalfOf;
  late final Null paymentMethod;
  late final PaymentMethodOptions paymentMethodOptions;
  late final List<String> paymentMethodTypes;
  late final Null processing;
  late final Null receiptEmail;
  late final Null review;
  late final String setupFutureUsage;
  late final Null shipping;
  late final Null source;
  late final Null statementDescriptor;
  late final Null statementDescriptorSuffix;
  late final String status;
  late final Null transferData;
  late final Null transferGroup;
  
  Intent.fromJson(Map<String, dynamic> json){
    id = json['id'];
    object = json['object'];
    amount = json['amount'];
    amountCapturable = json['amount_capturable'];
    amountDetails = AmountDetails.fromJson(json['amount_details']);
    amountReceived = json['amount_received'];
    application = json['application'];
    applicationFeeAmount = json['application_fee_amount'];
    automaticPaymentMethods = AutomaticPaymentMethods.fromJson(json['automatic_payment_methods']);
    canceledAt = json['canceled_at'];
    cancellationReason = json['cancellation_reason'];
    captureMethod = json['capture_method'];
    charges = Charges.fromJson(json['charges']);
    clientSecret = json['client_secret'];
    confirmationMethod = json['confirmation_method'];
    created = json['created'];
    currency = json['currency'];
    customer = json['customer'];
    description = json['description'];
    invoice = json['invoice'];
    lastPaymentError = json['last_payment_error'];
    livemode = json['livemode'];
    metadata = List.castFrom<dynamic, dynamic>(json['metadata']);
    nextAction = json['next_action'];
    onBehalfOf = json['on_behalf_of'];
    paymentMethod = json['payment_method'];
    paymentMethodOptions = PaymentMethodOptions.fromJson(json['payment_method_options']);
    paymentMethodTypes = List.castFrom<dynamic, String>(json['payment_method_types']);
    processing = json['processing'];
    receiptEmail = json['receipt_email'];
    review = json['review'];
    setupFutureUsage = json['setup_future_usage'];
    shipping = json['shipping'];
    source = json['source'];
    statementDescriptor = json['statement_descriptor'];
    statementDescriptorSuffix = json['statement_descriptor_suffix'];
    status = json['status'];
    transferData = json['transfer_data'];
    transferGroup = json['transfer_group'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['object'] = object;
    _data['amount'] = amount;
    _data['amount_capturable'] = amountCapturable;
    _data['amount_details'] = amountDetails.toJson();
    _data['amount_received'] = amountReceived;
    _data['application'] = application;
    _data['application_fee_amount'] = applicationFeeAmount;
    _data['automatic_payment_methods'] = automaticPaymentMethods.toJson();
    _data['canceled_at'] = canceledAt;
    _data['cancellation_reason'] = cancellationReason;
    _data['capture_method'] = captureMethod;
    _data['charges'] = charges.toJson();
    _data['client_secret'] = clientSecret;
    _data['confirmation_method'] = confirmationMethod;
    _data['created'] = created;
    _data['currency'] = currency;
    _data['customer'] = customer;
    _data['description'] = description;
    _data['invoice'] = invoice;
    _data['last_payment_error'] = lastPaymentError;
    _data['livemode'] = livemode;
    _data['metadata'] = metadata;
    _data['next_action'] = nextAction;
    _data['on_behalf_of'] = onBehalfOf;
    _data['payment_method'] = paymentMethod;
    _data['payment_method_options'] = paymentMethodOptions.toJson();
    _data['payment_method_types'] = paymentMethodTypes;
    _data['processing'] = processing;
    _data['receipt_email'] = receiptEmail;
    _data['review'] = review;
    _data['setup_future_usage'] = setupFutureUsage;
    _data['shipping'] = shipping;
    _data['source'] = source;
    _data['statement_descriptor'] = statementDescriptor;
    _data['statement_descriptor_suffix'] = statementDescriptorSuffix;
    _data['status'] = status;
    _data['transfer_data'] = transferData;
    _data['transfer_group'] = transferGroup;
    return _data;
  }
}

class AmountDetails {
  AmountDetails({
    required this.tip,
  });
  late final List<dynamic> tip;
  
  AmountDetails.fromJson(Map<String, dynamic> json){
    tip = List.castFrom<dynamic, dynamic>(json['tip']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['tip'] = tip;
    return _data;
  }
}

class AutomaticPaymentMethods {
  AutomaticPaymentMethods({
    required this.enabled,
  });
  late final bool enabled;
  
  AutomaticPaymentMethods.fromJson(Map<String, dynamic> json){
    enabled = json['enabled'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['enabled'] = enabled;
    return _data;
  }
}

class Charges {
  Charges({
    required this.object,
    required this.data,
    required this.hasMore,
    required this.totalCount,
    required this.url,
  });
  late final String object;
  late final List<dynamic> data;
  late final bool hasMore;
  late final int totalCount;
  late final String url;
  
  Charges.fromJson(Map<String, dynamic> json){
    object = json['object'];
    data = List.castFrom<dynamic, dynamic>(json['data']);
    hasMore = json['has_more'];
    totalCount = json['total_count'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['object'] = object;
    _data['data'] = data;
    _data['has_more'] = hasMore;
    _data['total_count'] = totalCount;
    _data['url'] = url;
    return _data;
  }
}

class PaymentMethodOptions {
  PaymentMethodOptions({
    required this.card,
  });
  late final Card card;
  
  PaymentMethodOptions.fromJson(Map<String, dynamic> json){
    card = Card.fromJson(json['card']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['card'] = card.toJson();
    return _data;
  }
}

class Card {
  Card({
     this.installments,
     this.mandateOptions,
     this.network,
    required this.requestThreeDSecure,
  });
  late final Null installments;
  late final Null mandateOptions;
  late final Null network;
  late final String requestThreeDSecure;
  
  Card.fromJson(Map<String, dynamic> json){
    installments = json['installments'];
    mandateOptions = json['mandate_options'];
    network = json['network'];
    requestThreeDSecure = json['request_three_d_secure'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['installments'] = installments;
    _data['mandate_options'] = mandateOptions;
    _data['network'] = network;
    _data['request_three_d_secure'] = requestThreeDSecure;
    return _data;
  }
}