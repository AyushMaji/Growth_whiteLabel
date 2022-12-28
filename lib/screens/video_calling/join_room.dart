import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/widgets/custom_widgets.dart';

import '../../global/widgets/submit_button.dart';
import 'video_call/video_call2.dart';

class JoinRoom extends StatefulWidget {
  static const String id = "/joinRoom";
  const JoinRoom({Key? key}) : super(key: key);

  @override
  State<JoinRoom> createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  Color? color;
  bool _isSelected = false;
  String _title = "Vision Dashboard";
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const NoBackPressAppbar(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 28.h,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17.0.h),
                    child: Text(
                      "Hello Sandra!",
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "poppins",
                        color: const Color(0xffB50000),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 17.0),
                    child: SizedBox(
                      //color: Colors.green,
                      height: 163.h,
                      width: 156.73.w,
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder: Images.uploadImage,
                        image: 'https://i.imgur.com/EFhRyma.png',
                      ),
                      // Image.asset(Images.cross_pose)
                    ),
                  ),
                ),
              ],
            ),

            //!########### Welcome to the ######################
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.sm),
                decoration: BoxDecoration(
                  color: const Color(0xffB50000).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 212.h,
                width: 340.w,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h
                    ),
                    Text(
                      "Welcome to the MyCoach Video Portal",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "poppins",
                        color: const Color(0xffB50000),
                      ),
                    ),
                    SizedBox(
                      height: 5.h
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(left: 18.0.h, right: 18.h),
                        child: Text(
                          "Your session with OLGA to discuss “Achieve Goals” will begin in 5 minutes.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                            fontFamily: "poppins",
                            color: const Color(0xffB50000),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 15.sm, left: 20.sm, right: 20.sm),
                      child: SubmitButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(VideoCallPage2.id);
                        },
                        title: 'JOIN ROOM',
                        buttonStyle: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xffB50000),
                          ),
                          foregroundColor: MaterialStateProperty.all(
                            const Color(0xffEEEBEE),
                          ),
                        ),
                        //getTranslated('continue', context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
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
