class BookedSlotModel {
  String? msg;
  int? statuscode;
  Data? data;

  BookedSlotModel({this.msg, this.statuscode, this.data});

  BookedSlotModel.fromJson(Map<String, dynamic> json) {
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
  List<Bookings>? bookings;

  Data({this.bookings});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['bookings'] != null) {
      bookings = <Bookings>[];
      json['bookings'].forEach((v) {
        bookings!.add( Bookings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (bookings != null) {
      data['bookings'] = bookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bookings {
  int? id;
  String? userId;
  String? coachId;
  String? slotId;
  String? extendedSlotId;
  String? email;
  String? phone;
  String? appointmentDate;
  String? price;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? slot;

  Bookings(
      {this.id,
      this.userId,
      this.coachId,
      this.slotId,
      this.extendedSlotId,
      this.email,
      this.phone,
      this.appointmentDate,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.slot});

  Bookings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    coachId = json['coach_id'];
    slotId = json['slot_id'];
    extendedSlotId = json['extended_slot_id'];
    email = json['email'];
    phone = json['phone'];
    appointmentDate = json['appointment_date'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['coach_id'] = coachId;
    data['slot_id'] = slotId;
    data['extended_slot_id'] = extendedSlotId;
    data['email'] = email;
    data['phone'] = phone;
    data['appointment_date'] = appointmentDate;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['slot'] = slot;
    return data;
  }
}
