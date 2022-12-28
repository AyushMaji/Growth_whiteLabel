// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/models/data_model/available_slot_model.dart';
import 'package:olga/models/data_model/booked_slot_model.dart';
import 'package:olga/screens/video_calling/calling_feature.dart';
import 'package:olga/screens/video_calling/confirm_slots_details.dart';
import 'package:provider/provider.dart';
import '../global/constants/app_constants.dart';
import '../models/api_model/api_model.dart';
import '../models/data_model/booked_appointment_model.dart';
import '../models/data_model/coach_booked_model.dart';
import '../payment/card.dart';
import '../screens/video_calling/appoinment_done.dart';
import '../screens/video_calling/slot_booking.dart';

class SlotBookingProvider with ChangeNotifier {      

  //
  AvailableSlotModel availableSlotModel = AvailableSlotModel();
  Future checkAvailableSlot({
    required String date, required BuildContext context,
    }) async {
      
    Map<String, dynamic> params = {};
    params['date'] = date;


    //availableSlots
    var apiURL = AppConstants.baseURL + AppConstants.checkAvailableSlots;
    var postResponse = await ApiModel.post(params, apiURL);
    print("registration full url ===>>> $apiURL");
    print("registration API response ===>>> $postResponse");


    if (postResponse["statuscode"] == 200) {
      availableSlotModel = AvailableSlotModel.fromJson(postResponse);
      //goPageAndRemove(context, SlotsBooking.id); //
      Navigator.pushReplacementNamed(context, SlotsBooking.id);
    }
  
  }

  BookedAppointmentModel bookedAppointmentModel =  BookedAppointmentModel();
  Future bookTheAvailableSlot({
    required String slotId, 
    required String coachId, 
    required int isExtended, 
    required int extendedlotId, 
    required String email, 
    required String phone, 
    required String appointmentDate, 
    required BuildContext context,
    }) async {
    //Loader.show(context,progressIndicator: const CircularProgressIndicator(color: Color(0xffDEB988)));        
    Map<String, dynamic> params = {};
    params['slot_id'] = slotId;
    params['coach_id'] = coachId;
    params['is_extended'] = isExtended;
    params['extended_slot_id'] = extendedlotId;
    params['email'] = email;
    params['phone'] = phone;
    params['appointment_date'] = appointmentDate;

    print("booking appointment params full url ===>>> $params");

    var apiURL = AppConstants.baseURL + AppConstants.bookAvailableSlot;
    var postResponse = await ApiModel.post(params, apiURL);
  
    print("booking full url ===>>> $apiURL");
    print("booking API response ===>>> $postResponse");

    if (postResponse["statuscode"] == 200) {
     // showToast(postResponse['msg'].toString(), context);
      bookedAppointmentModel = BookedAppointmentModel.fromJson(postResponse);
      goPageAndRemove(context, AppoinmentDone.id);
      //goPage(context, const PaymentScreen());
      Provider.of<SlotBookingProvider>(context, listen: false).getUserBookedSlot();
    }
  
  }

  BookedSlotModel bookedSlotModel = BookedSlotModel();
  Future getUserBookedSlot() async {
    var apiURL = AppConstants.baseURL + AppConstants.userBookedSlot;
    
    var getResponse = await ApiModel.get(apiURL);
    print("booked slot apiURL ===>>> $apiURL");
    print("booked slot apiURL ===>>> $apiURL");

    if(getResponse['statuscode'] == 200){
      bookedSlotModel = BookedSlotModel.fromJson(getResponse);
      notifyListeners();
    } else {
    
    }
  }

  ///* For coach module */
  CoachBookedSlotModel coachBookedSlotModel = CoachBookedSlotModel();
  Future getCoachBookedSlot() async {
  var apiURL = AppConstants.baseURL + AppConstants.coachBookedSlot;
  
  var getResponse = await ApiModel.get(apiURL);
  print("coach booked slot apiURL ===>>> $apiURL");
  print("coach booked slot apiURL ===>>> $apiURL");

  if(getResponse['statuscode'] == 200){
    print("coach appoitment fetach successfully");
    coachBookedSlotModel = CoachBookedSlotModel.fromJson(getResponse);
  }
  else {}
  }
}

/* Navigator.of(context).push(
  PageRouteBuilder(
    pageBuilder: (
        BuildContext context, 
        Animation<double> animation, 
        Animation<double> secondaryAnimation) {
      return Details();
    },
    transitionsBuilder: (
        BuildContext context, 
        Animation<double> animation, 
        Animation<double> secondaryAnimation, 
        Widget child) {
      return Align(
        child: SizeTransition(
          sizeFactor: animation,
          child: child,
        ),
      );
    },
    transitionDuration: Duration(milliseconds: 500),
  ),
), */