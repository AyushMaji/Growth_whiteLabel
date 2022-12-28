class BookedAppointmentModel {
  String? msg;
  int? statuscode;
  Data? data;

  BookedAppointmentModel({this.msg, this.statuscode, this.data});

  BookedAppointmentModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? userId;
  String? availabilityId;
  String? day;
  Slot? slot;
  String? status;
  String? price;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Data(
      {this.id,
      this.userId,
      this.availabilityId,
      this.day,
      this.slot,
      this.status,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    availabilityId = json['availability_id'];
    day = json['day'];
    slot = json['slot'] != null ?  Slot.fromJson(json['slot']) : null;
    status = json['status'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['availability_id'] = availabilityId;
    data['day'] = day;
    if (slot != null) {
      data['slot'] = slot!.toJson();
    }
    data['status'] = status;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class Slot {
  int? id;
  String? userId;
  String? availabilityId;
  String? day;
  String? slot;
  int? status;
  String? price;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Slot(
      {this.id,
      this.userId,
      this.availabilityId,
      this.day,
      this.slot,
      this.status,
      this.price,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Slot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    availabilityId = json['availability_id'];
    day = json['day'];
    slot = json['slot'];
    status = json['status'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['availability_id'] = availabilityId;
    data['day'] = day;
    data['slot'] = slot;
    data['status'] = status;
    data['price'] = price;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
