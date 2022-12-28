// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/screens/visionboard/drawer/profile/profile.dart';
import 'package:olga/screens/visionboard/widgets/learn.dart';
import 'package:olga/screens/visionboard/widgets/vision_home.dart';
import 'widgets/journal.dart';
import 'widgets/mycoach.dart';

class VisionBoard extends StatefulWidget {
  static const String id = "/visionBoard";
  const VisionBoard({Key? key}) : super(key: key);

  @override
  State<VisionBoard> createState() => _VisionBoardState();
}

class _VisionBoardState extends State<VisionBoard> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  Color? color;
  bool _isSelected = false;
  String _title = "Vision Dashboard";
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
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

          

  @override
  Widget build(BuildContext context) {

    return WillPopScope(    
      onWillPop:()=> onWillPopExit(context, _key),
      child: Scaffold(
      key: _key, 
      // remove key if drawer needs to always open
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: AppBar(
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
        drawer: SizedBox(
          width: 280.h,
          child: Drawer(
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
        ),
        body: Column(
          children: [
            if (_selectedIndex == 0)
              const Expanded(child: VisionHome())
            else if (_selectedIndex == 1)
              const Expanded(child: Learn())
            else if (_selectedIndex == 2)
              const Expanded(child: MyCoach())
            else
              const Expanded(child: Journal())
          ],
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
}
