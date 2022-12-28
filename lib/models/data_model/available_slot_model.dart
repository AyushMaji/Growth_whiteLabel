class AvailableSlotModel {
  String? msg;
  int? statuscode;
  List<BookingSlotData>? data;

  AvailableSlotModel({this.msg, this.statuscode, this.data});

  AvailableSlotModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statuscode = json['statuscode'];
    if (json['data'] != null) {
      data = <BookingSlotData>[];
      json['data'].forEach((v) {
        data!.add( BookingSlotData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['msg'] = msg;
    data['statuscode'] = statuscode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookingSlotData {
  int? id;
  String? userId;
  String? availabilityId;
  String? day;
  String? slot;
  String? status;
  String? price;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  BookingSlotData(
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

  BookingSlotData.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data =  <String, dynamic>{};
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
