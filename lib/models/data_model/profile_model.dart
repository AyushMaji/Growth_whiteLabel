// ignore_for_file: avoid_print

class ProfileModel {
  String? msg;
  int? statuscode;
  Data? data;

  ProfileModel({this.msg, this.statuscode, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    statuscode = json['statuscode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['statuscode'] = statuscode;
    if (this.data != null) {
      print(data.length);
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  UserDetails? userDetails;

  Data({this.userDetails});

  Data.fromJson(Map<String, dynamic> json) {
    userDetails = json['user_details'] != null
        ? UserDetails.fromJson(json['user_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userDetails != null) {
      data['user_details'] = userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  int? id;
  String? userType;
  String? firstName;
  String? lastName;
  String? gender;
  String? dateOfBirth;
  String? countryOfResidence;
  String? prefferedLanguage;
  String? phoneNumber;
  String? image;
  String? email;
  String? emailVerifiedAt;
  String? otp;
  String? otpSentAt;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  UserDetails(
      {this.id,
      this.userType,
      this.firstName,
      this.lastName,
      this.gender,
      this.dateOfBirth,
      this.countryOfResidence,
      this.prefferedLanguage,
      this.phoneNumber,
      this.image,
      this.email,
      this.emailVerifiedAt,
      this.otp,
      this.otpSentAt,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userType = json['user_type'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    countryOfResidence = json['country_of_residence'];
    prefferedLanguage = json['preffered_language'];
    phoneNumber = json['phone_number'];
    image = json['image'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    otp = json['otp'];
    otpSentAt = json['otp_sent_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_type'] = userType;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['gender'] = gender;
    data['date_of_birth'] = dateOfBirth;
    data['country_of_residence'] = countryOfResidence;
    data['preffered_language'] = prefferedLanguage;
    data['phone_number'] = phoneNumber;
    data['image'] = image;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['otp'] = otp;
    data['otp_sent_at'] = otpSentAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
