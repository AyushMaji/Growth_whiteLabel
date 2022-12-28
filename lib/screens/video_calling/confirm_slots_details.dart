// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/calling_primary_button.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/screens/video_calling/adding_card_details.dart';

class ConfirmSlotsBooking extends StatefulWidget {
  static const String id = "/confirmSlotsBooking";
  const ConfirmSlotsBooking({Key? key}) : super(key: key);

  @override
  State<ConfirmSlotsBooking> createState() => _ConfirmSlotsBooking();
}

class _ConfirmSlotsBooking extends State<ConfirmSlotsBooking> {
  bool isVisible = false;
  String dropdownvalue = 'Today';
  var items = [
    'Today',
    'Choose from calendar',
  ];

  int? selectedIndex =8;
  int? extendTimeSelectedIndex =0;

  final List<String> _timeSlot = [
    "8:30 AM",
    "8:45 AM",
    "8:45 AM",
    "9:15 AM",
    "9:30 AM",
    "9:45 AM",
    "10:00 AM",
    "10:15 AM",
    "10:30 AM"
  ];

    final List<String> _extendTimeSlot = [
    "10:45 AM",
    "11:00 AM",
    "11:15 AM",
  ];

  bool? remember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const NoBackPressAppbar(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 28.0, horizontal: 18),
          child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                    "Confirm Details",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: "poppins",
                      color: Color(0xffB50000),
                    ),
                    ),
                     Text(
                      "Please check the details of your appointment",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "poppins",
                        color: Color(0xff263238),
                      ),
                    ),
                     SizedBox(
              height: 19.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Booked Slots",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "poppins",
                        color: Color(0xffB50000),
                      ),
                    ),
                    Text(
                      "Schedule your Appointment",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "poppins",
                        color: Color(0xff263238),
                      ),
                    )
                  ],
                ),
                Flexible(
                  child: Container(
                    width: 119.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      //color: Colors.green,
                      border: Border.all(
                        color: Color(0xffB0B0B0),
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    margin: EdgeInsets.only(top: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: DropdownButton(
                          underline: Container(),
                          isExpanded: true,
                          value: dropdownvalue,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xffB50000),
                          ),
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: TextStyle(
                                    color: Color(0xffB50000),
                                    fontWeight: FontWeight.w400),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 19.h,
            ),
            Text("Blocks of 15 minutes at \$27.95 per block",
                style: TextStyle(
                  color: Color(0xff909399),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "poppins",
                )),
            SizedBox(
              height: 220.h,
              width: double.infinity,
              child: GridView.builder(
                // scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 2,
                  childAspectRatio: (12 / 8),
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return buildCard(index);
                },
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 20.0,
                  width: 20.0,
                  child: Checkbox(
                    value: remember,
                    activeColor: Color(0xffB50000),
                    onChanged: (value) {
                      setState(() {
                        remember = value;
                        isVisible =! isVisible;
                      });
                    },
                  ),
                ),
                SizedBox(width: 5.w),
                Text("Extend your meeting time with Olga",
                    style: TextStyle(
                      color: Color(0xff2E2E2E),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: "poppins",
                    )),
              ],
            ),
            Text(
                "Would you like to extend your appointment another 15 minutes for only \$17.95.",
                style: TextStyle(
                  color: Color(0xff2E2E2E),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "poppins",
                )),

            //!####################
            Visibility(
              visible: isVisible,
              child: GridView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 1,
                  childAspectRatio: (12 / 8),
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ExtendMettingCard(index);
                },
              ),
            ),

            SizedBox(height: 30.h),
            Text("Confirm your details",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "poppins",
                )),

            SizedBox(height: 15.sp),
            Text(
              getTranslated("email", context),
              style: TextStyles.smallBoldTextStyle(context),
            ),

            Text("jane@user.com"),
            //
            SizedBox(height: 15.sp),
            Text(
              getTranslated("phone_number", context),
              style: TextStyles.smallBoldTextStyle(context),
            ),
           Text( "+61 1234 567 7809"),

            //
            SizedBox(height: 15.sp),

            Text(
              getTranslated("appoinment_date", context),
              style: TextStyles.smallBoldTextStyle(context),
            ),
           
           Text("31 Jan, at 10:15 AM"),

            //
            SizedBox(height: 30.sp),
            VideoCallingPrimaryButton(
              title: getTranslated("book_appointment", context),
              onPressed: () {
                goPage(context, AddCardDetails());
                setState(() {});
              },
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildCard(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          print("now selected ===>>> $index");
          selectedIndex = index;
          // showButton = true;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? const Color(0xffB50000)
              : const Color(0x0fffffff),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              color: selectedIndex == index
                  ? const Color(0xffB50000)
                  : Color(0xffB50000),
              width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Center(
                child: Text(_timeSlot[index].toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 0.5.sp,
                      fontWeight: selectedIndex == index
                          ? FontWeight.w700
                          : FontWeight.w400,
                      color: selectedIndex == index
                          ? const Color(0xffFFFFFF)
                          : Color(0xffB50000),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //!#####################################3
  Widget ExtendMettingCard(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          print("now selected ===>>> $index");
          extendTimeSelectedIndex = index;
          // showButton = true;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        decoration: BoxDecoration(
          color: extendTimeSelectedIndex == index
              ? const Color(0xffB50000)
              : const Color(0xfffffff),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              color: extendTimeSelectedIndex == index
                  ? const Color(0xffB50000)
                  : Color(0xffB50000),
              width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Center(
                child: Text(_extendTimeSlot[index].toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 0.5.sp,
                      fontWeight: extendTimeSelectedIndex == index
                          ? FontWeight.w700
                          : FontWeight.w400,
                      color: extendTimeSelectedIndex == index
                          ? const Color(0xffFFFFFF)
                          : Color(0xffB50000),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
