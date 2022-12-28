class CardTokenListModel {
  String? msg;
  int? statuscode;
  CardListModel? response;

  CardTokenListModel({this.msg, this.statuscode, this.response});

  CardTokenListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statuscode = json['statuscode'];
    response = json['data'] != null ? CardListModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['statuscode'] = statuscode;
    if (response != null) {
      data['data'] = response!.toJson();
    }
    return data;
  }
}

class CardListModel {
  List<Token>? cardList;

  CardListModel({this.cardList});

  CardListModel.fromJson(Map<String, dynamic> json) {
    if (json['token'] != null) {
      cardList = <Token>[];
      json['token'].forEach((v) {
        cardList!.add(Token.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cardList != null) {
      data['token'] = cardList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Token {
  String? token;
  String? last4Digits;

  Token({this.token, this.last4Digits});

  Token.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    last4Digits = json['last_4_digits'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['last_4_digits'] = last4Digits;
    return data;
  }
}
