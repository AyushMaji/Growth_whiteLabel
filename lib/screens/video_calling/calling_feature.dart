// ignore_for_file: avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/video_calling/join_room.dart';
import 'package:olga/screens/visionboard/visionboard.dart';
import 'package:olga/screens/visionboard/widgets/vision_home.dart';
import 'package:provider/provider.dart';
import 'package:quiver/iterables.dart';
import 'package:shimmer/shimmer.dart';
import '../../global/methods/methods.dart';
import '../../provider/slot_boking_provider.dart';

class CallingFeature extends StatefulWidget {
  static const String id = "/callingFeature";
  const CallingFeature({Key? key}) : super(key: key);

  @override
  State<CallingFeature> createState() => _CallingFeatureState();
}

class _CallingFeatureState extends State<CallingFeature> {

//!########### Date Time Picker ############
//  var currentDateTime = DateTime.now();
  var formatterDate = DateFormat('dd/MM/yy');
  var formatterTime = DateFormat('kk:mm');
  String? _selectedDate;
  //!########################################

  Color? color;
  bool _isSelected = false;
  String _title = "Vision Dashboard";
  int _selectedIndex = 0;

  _loadBookedAppointment(BuildContext context){
    final SlotBookingProvider slotBookingProvider = Provider.of<SlotBookingProvider>(context, listen: false);
    slotBookingProvider.getUserBookedSlot();
  }

  @override
  void initState() {
    super.initState();
    _loadBookedAppointment(context);
    _selectedDate = "";
  
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
    onWillPop: ()=> goBackHome(),
      child: Scaffold(
        appBar: homeAppBar(context),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          //physics: const BouncingScrollPhysics(),
          child: Consumer<SlotBookingProvider>(
          builder: (context, slotBookingProvider, child) {
        return RefreshIndicator(
          onRefresh: () async {
            await slotBookingProvider.getUserBookedSlot();       
          },
          child: Padding(
                padding: EdgeInsets.all(17.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                              height: 250.h, 
                              child:
                              // FadeInImage.assetNetwork(
                              //     fit: BoxFit.cover,
                              //     placeholder: Images.uploadImage,
                              //     image: 'https://i.imgur.com/gcODtT7.png',
                              //   ),
                               Image.asset(Images.meet_now)
                                // CachedNetworkImage(
                                //     imageUrl: "https://i.imgur.com/gcODtT7.png",fit: BoxFit.cover,
                                //     progressIndicatorBuilder: (context, url, downloadProgress) => 
                                //             Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                //     errorWidget: (context, url, error) => Icon(Icons.error),
                                // ),
                              ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.sm),
                            decoration: BoxDecoration(
                              color: Color(0xffB50000),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 182.h,
                            width: 340.w,
                            child: Column(
                              children: [
                                SizedBox(height: 20.h),
                                Text(
                                  "Meet OLGA",
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "poppins",
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h
                                ),
                                Flexible(
                                  child: Text(
                                    "Hi, I am OLGA and I will help you to achieve your goals.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "poppins",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 15.sm, left: 20.sm, right: 20.sm),
                                  child: SubmitButton(
                                   title: 'BOOK NOW',
                                    onPressed: () {
                                      _selectedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
                                    
                                      final storeProvider = Provider.of<StorageProvider>(context, listen: false);
                                      storeProvider.updateAppointmentDate(_selectedDate);
                                            
                                      final slotBookingProvider = Provider.of<SlotBookingProvider>(context, listen: false);
                                      slotBookingProvider.checkAvailableSlot(date: _selectedDate!, context: context);
                                      //goPage(context, const SlotsBooking());
                                      print(_selectedDate);
                                      print("============================");
                                      print(storeProvider.appoimentDate);
                                                                                                   
                                    },
                                   
                                    buttonStyle: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                        const Color(0xffEEEBEE),
                                      ),
                                      foregroundColor: MaterialStateProperty.all(
                                          Color(0xffB50000)),
                                    ),
                                    //getTranslated('continue', context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    //Text(" now $_selectedDate"),
                    Text( "Your Appointments",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "poppins",
                        color: Colors.black,
                      ),
                    ),                   
                  (slotBookingProvider.bookedSlotModel.data?.bookings?.length != null && slotBookingProvider.bookedSlotModel.data!.bookings!.isNotEmpty) ?
                    ListView.builder(
                      itemCount: slotBookingProvider.bookedSlotModel.data?.bookings?.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        
                          return Container(
                          //!====== Outer BIG box
                          padding:
                              EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          decoration: BoxDecoration(
                            color: const Color(0xffF5F5F9),
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: const Color(0xFFE1E1EF),
                            ),
                          ),
                          height: 300.h,
                          width: 330.w,
                          child: Column(children: [
                            Container(
                              //!################################ image box style
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              width: 320.w,
                              height: 140.h,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: 

                                 CachedNetworkImage(
                                    imageUrl: "https://i.imgur.com/zEjvlbD.png",fit: BoxFit.cover,
                                    progressIndicatorBuilder: (context, url, downloadProgress) => 
                                            Shimmer.fromColors(
                                            baseColor: Color.fromARGB(255, 196, 192, 192),
                                            highlightColor: Color.fromARGB(255, 236, 228, 228),child: Image.asset(Images.apoinShimmerBox,fit: BoxFit.cover)),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                                
                                // FadeInImage.assetNetwork(
                                //   fit: BoxFit.cover,
                                //   placeholder: Images.uploadImage,
                                //   image: 'https://i.imgur.com/zEjvlbD.png',
                                // ),
                              ),
                            ),
                            //!################# image box end
                            SizedBox(
                              height: 30.h
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Achieve Goals",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: "poppins",
                                        color: const Color(0xff2E2E2E),
                                      ),
                                    ),
                                    // Text(
                                    //   "Meeting ID: 123 4567 789",
                                    //   style: TextStyle(
                                    //     fontSize: 12.sp,
                                    //     fontWeight: FontWeight.normal,
                                    //     fontFamily: "poppins",
                                    //     color: const Color(0xff909399),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  height: 36.h,
                                  width: 36.w,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffB50000).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child:
                                   Image.asset(
                                      Images.edit_icon,
                                      width: 60.w,
                                    ),
                                  
                                ),
                                SizedBox(width: 10.w),
                                InkWell(
                                onTap: (){
                                  setState(() {
                
                                    String bookedTime = slotBookingProvider.bookedSlotModel.data?.bookings?[index].appointmentDate ?? "";
                                    String slot = slotBookingProvider.bookedSlotModel.data?.bookings?[index].slot ?? "";
                                    print(" ======== $slot======== ");
                                  
                                    String startingTime = slot.substring(0, slot.indexOf("-"));
                                    String endingTime = slot.substring(slot.indexOf("-") + 1, slot.length);

                                    print("Current time ${DateTime.now().toString()}");


                                    print(bookedTime);
                                    print("========");
                                    DateTime finalBookingTimeStart =  DateTime.parse(bookedTime);
                                    finalBookingTimeStart = finalBookingTimeStart.subtract(const Duration(hours: 12));
                                      finalBookingTimeStart = finalBookingTimeStart.add(Duration(hours: int.parse(startingTime.substring(0, startingTime.indexOf(":"))), minutes: int.parse(startingTime.substring((startingTime.indexOf(":")+1), startingTime.length))));

                                    print(finalBookingTimeStart.toString());


                                    DateTime finalBookingTimeEnd =  finalBookingTimeStart.add(const Duration(minutes: 15));
                                    /* print(finalBookingTimeStart.microsecondsSinceEpoch);
                                    print("Current time ${DateTime.now().toString()}");
                                    print("Start time ${finalBookingTimeStart.toString()}");
                                    print("End time ${finalBookingTimeEnd.toString()}");
                                    print("Current time Epoch ${DateTime.now().millisecondsSinceEpoch.toString()}");
                                    print("Start time Epoch ${finalBookingTimeStart.millisecondsSinceEpoch.toString()}");
                                    print("End time Epoch ${finalBookingTimeEnd.microsecondsSinceEpoch.toString()}"); */


                                    print("========");
                                    print(DateTime.now().isBefore(finalBookingTimeStart));
                
                                    if(DateTime.now().isBefore(finalBookingTimeStart)){                                   
                                      print("Meeting is hasn't started yet"); 
                                      showToast("Please wait for the meeting date & time !!", context);                                                                             
                                    } else if (DateTime.now().isBefore(finalBookingTimeEnd) && DateTime.now().isAfter(finalBookingTimeStart)) {
                                      goPage(context, const JoinRoom());  
                                      showToast("Welcome to the meeting !!", context);                                                                             

                                      print(" Meeting is today"); 
                                    } else {
                                      showToast("Meeting time already gone !!", context);
                                       print("Meeting alreday finished !!"); 
                                    }                   
                                  });
                                
                                },
                                  child: Container(
                                    height: 40.h,
                                    width: 36.w,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff67C23A).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child:
                                      Image.asset(
                                        Images.video_icon,
                                        width: 60.w,
                                      ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h
                            ),
                            Row(
                              children: [
                                //!========= Date ===========
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "poppins",
                                          color: const Color(0xff2E2E2E),
                                        ),
                                      ),
                                      Text(
                                        slotBookingProvider.bookedSlotModel.data?.bookings?[index].appointmentDate!.substring(0, slotBookingProvider.bookedSlotModel.data?.bookings?[index].appointmentDate!.indexOf(" ")) ?? "",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "poppins",
                                          color: const Color(0xff909399),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        
                                //!========= T I M E ===========
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Time",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "poppins",
                                          color: const Color(0xff2E2E2E),
                                        ),
                                      ),
                                      Text(
                                        slotBookingProvider.bookedSlotModel.data?.bookings?[index].slot ?? "",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "poppins",
                                          color: const Color(0xff909399),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        
                                //!========= Coach ===========
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Coach",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "poppins",
                                          color: Color(0xff2E2E2E),
                                        ),
                                      ),
                                      Text(
                                        "OLGA",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "poppins",
                                          color: Color(0xff909399),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ]
                          ),
                        );
                        
                      },
                    ) : const Card(child: SizedBox(height: 200, child: Center(child: Text("No appoitment found !!"),),),)
                  ],                 
                ),
              ),
              );
            }
          ),
        ),        
      ),
    );
  }

   goBackHome() async {
    goPageAndRemove(context, VisionBoard.id);      
    return true;
  }
}
