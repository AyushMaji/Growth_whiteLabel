class QuotesModel {
  String? msg;
  int? statuscode;
  Data? data;

  QuotesModel({this.msg, this.statuscode, this.data});

  QuotesModel.fromJson(Map<String, dynamic> json) {
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
  List<Quotes>? quotes;

  Data({this.quotes});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['quotes'] != null) {
      quotes = <Quotes>[];
      json['quotes'].forEach((v) {
        quotes!.add( Quotes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (quotes != null) {
      data['quotes'] = quotes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quotes {
  int? id;
  String? quote;
  String? quoteAuthor;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Quotes(
      {this.id,
      this.quote,
      this.quoteAuthor,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Quotes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quote = json['quote'];
    quoteAuthor = json['quote_author'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['quote'] = quote;
    data['quote_author'] = quoteAuthor;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
