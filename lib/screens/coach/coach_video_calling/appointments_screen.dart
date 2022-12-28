// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/screens/video_calling/video_call/video_call2.dart';
import 'package:provider/provider.dart';
import '../../../global/methods/methods.dart';
import '../../../provider/slot_boking_provider.dart';
import '../../video_calling/join_room.dart';
import '../../visionboard/drawer/profile/profile.dart';
import '../../../localization/language_constrants.dart';
//import '../../global/methods/methods.dart';

class AppointmentsScreen extends StatefulWidget {
  static const String id = "/appointmentsScreen";
  const AppointmentsScreen({Key? key}) : super(key: key); 

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  var currentDateTime = DateTime.now();




  @override
  void initState() {
    super.initState();
    final SlotBookingProvider slotBookingProvider = Provider.of<SlotBookingProvider>(context, listen: false);
    slotBookingProvider.getCoachBookedSlot();
  }

  Color? color;
  bool _isSelected = false;
  String _title = "Coach Board";
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
  
    return WillPopScope(
    onWillPop: () => onWillPopExit(context, _key),
      child: Scaffold(
        //appBar: dashboardAppBar(context, "Coach"),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: AppBar(
          //automaticallyImplyLeading: false,
            title: Text(
              _title,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 15.sp,
              ),
            ),
            flexibleSpace: const Image(
              image: AssetImage(Images.appBarBG),
              fit: BoxFit.cover,
            ),
            backgroundColor: Colors.transparent,
            bottomOpacity: 0.0,
            elevation: 0.0,
          ),
        ),
        //
        drawer: Drawer(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: 250.w,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  const Profile(),
                ],
              ),
            ),
          ),
        ),

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Consumer<SlotBookingProvider>(builder: (context, slotBookingProvider, child) {
          return RefreshIndicator(
           onRefresh: () async { 
        
          await slotBookingProvider.getCoachBookedSlot();
        
         },
            child: Padding(
                padding: EdgeInsets.all(17.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Appointments",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "poppins",
                        color: Colors.black,
                      ),
                    ),
            
                    slotBookingProvider.coachBookedSlotModel.data?.bookings?.length != null ?
                    ListView.builder(
                      itemCount: slotBookingProvider.coachBookedSlotModel.data?.bookings?.length,
                      //scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                             goPage(context, const VideoCallPage2());                        
                          },
                          child: Container(
                            //!======Outer BIG box
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.h),
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            decoration: BoxDecoration(
                              color: const Color(0xffF5F5F9),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: const Color(0xFFE1E1EF),
                              ),
                            ),
                            height: 320.h,
                            width: 330.w,
                            child: Column(children: [
                              Container(
                                //!################################image box style
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                width: 320.w,
                                height: 140.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: FadeInImage.assetNetwork(
                                    fit: BoxFit.cover,
                                    placeholder: Images.uploadImage,
                                    image: 'https://i.imgur.com/zEjvlbD.png',
                                  ),
                                ),
                              ),
                              //!##########################################image box end
                              SizedBox(
                                height: 30.h,
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
                                          color: Color(0xff2E2E2E),
                                        ),
                                      ),
                                      Text(
                                        "Meeting ID: 123 4567 789",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: "poppins",
                                          color: Color(0xff909399),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 36.h,
                                    width: 36.w,
                                    decoration: BoxDecoration(
                                      color: Color(0xffB50000).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Image.asset(
                                      Images.edit_icon,
                                      width: 60.w,
                                    ),
                                    //  Icon(
                                    //   Icons.edit,
                                    //   color: Color(0xffB50000),
                                    // ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  InkWell(
                  
                                  onTap: (){
                  
                                  setState(() {
                  
                                    String bookedTime = slotBookingProvider.coachBookedSlotModel.data?.bookings?[index].appointmentDate ?? "";
                                    print(bookedTime);
                                    print("========");
                                    DateTime booked =  DateTime.parse(bookedTime);
                                    print(booked.microsecondsSinceEpoch);
                  
                                    if(currentDateTime.microsecondsSinceEpoch >  booked.microsecondsSinceEpoch){
                                      print("Yes have access");
                                      goPage(context, const JoinRoom());                                                
                                      }else{
                                      showToast("Meeting time already gone !!", context);
                                      }                              
                                    });
                                 
                                  },
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      height: 36.h,
                                      // width: 36.w,
                                      decoration: BoxDecoration(
                                        color: Color(0xff67C23A).withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            Images.video_icon,
                                            // width: 60.w,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          const Text(
                                            'Start',
                                            style:
                                                TextStyle(color: Color(0xff67C23A)),
                                          )
                                        ],
                                      ),
                                      //  Icon(
                                      //   Icons.videocam_rounded,
                                      //   color: Colors.green,
                                      // ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
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
                                            color: Color(0xff2E2E2E),
                                          ),
                                        ),
                                        Text(slotBookingProvider.coachBookedSlotModel.data?.bookings?[index].appointmentDate ?? "",
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
                                          slotBookingProvider.coachBookedSlotModel.data?.bookings?[index].slot ?? "",
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
                                          getTranslated("participant", context),
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
                            ]),
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
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey.shade50,
          selectedItemColor: Colors.red.shade800,
          unselectedItemColor: Colors.grey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                Images.love,
                width: 20.w,
                color: _isSelected ? Colors.grey : Colors.red,
              ),
              label: 'Vision Board',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.location_pin),
              label: 'Learn',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My Coach',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Journal',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0) {
        _title = "Vision Dashboard";
        _isSelected = false;
      } else if (index == 1) {
        _title = "Learn";
        _isSelected = true;
      } else if (index == 2) {
        _title = "My Coach";
        _isSelected = true;
      } else {
        _title = "Journal";
        _isSelected = true;
      }
    });
  }
}


/* Things are left

1. Edit my goal
  (i) ListDrop down words 

2. Booking appointment 
  (i) Search available activies by date have an issue 
  (ii) For booking appoitment DateTime have an issue
  (iii) Payment have an issue 
3. During registration period if user left need to retrive the previous data

4.

*/