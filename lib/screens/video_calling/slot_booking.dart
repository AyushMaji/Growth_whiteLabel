// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/calling_primary_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/models/data_model/available_slot_model.dart';
import 'package:olga/models/data_model/booked_slot_model.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/video_calling/calling_feature.dart';
import 'package:olga/screens/visionboard/drawer/payment/payment_info.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../global/constants/images.dart';
import '../../models/data_model/profile_model.dart';
import '../../provider/profile_provider.dart';
import '../../provider/slot_boking_provider.dart';

class SlotsBooking extends StatefulWidget {
  static const String id = "/slotsBooking";
  const SlotsBooking({Key? key}) : super(key: key);

  @override
  State<SlotsBooking> createState() => _SlotsBookingState();
}

class _SlotsBookingState extends State<SlotsBooking> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic>? paymentIntentData;

  var currentDateTime = DateTime.now();
  String? choosenFromCalender;

  int? selectedIndex = 0;
  int? indexRaw;

  bool? remember = false;
  bool isVisible = false;

  final _calendarController = TextEditingController();
  final _emailContoller = TextEditingController();
  final _phoneContoller = TextEditingController();
  static String formattedAppointmentDate = "";
  //!===
  final countryPicker = const FlCountryCodePicker();
      var selectedCountry;
      String CountrycodenewNew = "";
      //============
      void countryCode(
        String myCountryCode,
      ) async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString("setCountryCode", myCountryCode);
      }
    //==================
    void getCred() async {
    //HERE WE FETCH OUR CREDENTIALS FROM SHARED PREF
    SharedPreferences pref = await SharedPreferences.getInstance();
    if ( pref.getString("setCountryCode")==null ) {
      setState(() {
        CountrycodenewNew="+61";
      });
    } else {
      setState(() {
      CountrycodenewNew = pref.getString("setCountryCode") ?? "";
    });
    }
  }

  //!==

  //!############### Date Time Picker ##################
  Future _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: currentDateTime,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030));
    if (picked != null) {
      setState(() {
        currentDateTime = picked;
        _calendarController.text =
            DateFormat('dd-MM-yyyy').format(currentDateTime);
        choosenFromCalender = _calendarController.text;

        print(choosenFromCalender);
        print("======================");
        print(_calendarController.text);

        final storeProvider =
            Provider.of<StorageProvider>(context, listen: false);
        storeProvider.updateAppointmentDate(choosenFromCalender);

        final slotBookingProvider =
            Provider.of<SlotBookingProvider>(context, listen: false);
        slotBookingProvider.checkAvailableSlot(
            date: choosenFromCalender!, context: context);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailContoller.dispose();
    _phoneContoller.dispose();
  }

  UserDetails userDetails = UserDetails();

  @override
  void initState() {
    super.initState();
    getCred();
    final storeProvider = Provider.of<StorageProvider>(context, listen: false);

    ProfileProvider profileData =
        Provider.of<ProfileProvider>(context, listen: false);
    profileData.viewUserProfileDetails();

    _calendarController.text = storeProvider.appoimentDate;
    _emailContoller.text =
        profileData.profileModel.data?.userDetails?.email ?? "null";
    _phoneContoller.text =
        profileData.profileModel.data?.userDetails?.phoneNumber ?? "00";
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => goBackHome(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Image.asset(Images.appBarBG,
              fit: BoxFit.cover, height: MediaQuery.of(context).size.height),
          leadingWidth: 20.w,
          leading: IconButton(
            onPressed: () {
              print("new appbar");
              goPageWithName(context, CallingFeature.id);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          title: Text(
            getTranslated('back', context),
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ),
        body:
            Consumer<StorageProvider>(builder: (context, storeProvider, child) {
          return Consumer<SlotBookingProvider>(
              builder: (context, slotBookingProvider, child) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 28.0, horizontal: 18),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Available Slots",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "poppins",
                                      color: const Color(0xffB50000),
                                    ),
                                  ),
                                  const Text(
                                    "Schedule your Appointment",
                                    style: TextStyle(
                                      //fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "poppins",
                                      color: Color(0xff263238),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '',
                                    //"Pick a date",
                                    style:
                                        TextStyles.smallBoldTextStyle(context),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Text(
                                                _calendarController.text,
                                                style: TextStyles
                                                    .smallRegularBlackTextStyle(
                                                        context)),
                                          ),
                                        ),
                                        IconButton(
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            setState(() {
                                              _selectedDate(context);
                                            });
                                          },
                                          icon:
                                              const Icon(Icons.calendar_month),
                                          color: const Color(0xffB50000),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10.w),
                          ],
                        ),
                        SizedBox(height: 19.h),
                        Text("Blocks of 15 minutes at \$27.95 per block",
                            style: TextStyle(
                              color: const Color(0xff909399),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              fontFamily: "poppins",
                            )),
                        slotBookingProvider.availableSlotModel.data?.length !=
                                null
                            ? GridView.builder(
                                // scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 2,
                                  childAspectRatio: (12 / 8),
                                ),
                                itemCount: slotBookingProvider
                                    .availableSlotModel.data?.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      print("now global ===>>> $selectedIndex");
                                      index++;
                                      selectedIndex = index;
                                      setState(() {
                                        print("now selected ===>>> $index");
                                        print(
                                            "now selected global ===>>> $selectedIndex");
                                        // showButton = true;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 10.h),
                                      decoration: BoxDecoration(
                                        color: (selectedIndex! - 1) == index
                                            ? const Color(0xffB50000)
                                            : const Color(0x0fffffff),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                            color: (selectedIndex! - 1) == index
                                                ? const Color(0xffB50000)
                                                : const Color(0xffB50000),
                                            width: 1),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: Center(
                                              child: Text(
                                                  slotBookingProvider
                                                          .availableSlotModel
                                                          .data?[index]
                                                          .slot ??
                                                      "00:00",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    letterSpacing: 0.5.sp,
                                                    fontWeight:
                                                        selectedIndex == index
                                                            ? FontWeight.w700
                                                            : FontWeight.w700,
                                                    color:
                                                        (selectedIndex! - 1) ==
                                                                index
                                                            ? const Color(
                                                                0xffFFFFFF)
                                                            : const Color(
                                                                0xffB50000),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            : const SizedBox(
                                height: 200,
                                child: Center(
                                  child: Text("No availale booking !!"),
                                ),
                              ),

                        //Text("Total index ===>>> ${_slotBookingProvider.availableSlotModel.data?.length}"),
                        SizedBox(height: 30.h),
                        Text("Confirm your details",
                            style: TextStyle(
                              color: const Color(0xff000000),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: "poppins",
                            )),

                        SizedBox(height: 15.sp),
                        Text(
                          getTranslated("email", context),
                          style: TextStyles.smallBoldTextStyle(context),
                        ),
                        TextFormField(
                          controller: _emailContoller,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: 'jane@user.com',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) return "Email can not be empty";
                            return null;
                          },
                          onChanged: (value) {
                            print("typing..... $value");
                          },
                        ),

                        //
                        SizedBox(height: 15.sp),

                        Text(
                          getTranslated("phone_number", context),
                          style: TextStyles.smallBoldTextStyle(context),
                        ),

                        Container(
                          // padding: EdgeInsets.zero,
                          // margin:EdgeInsets.zero,
                          //color: Colors.blue,
                          decoration: BoxDecoration(
                              //color: Color(0xFFf0f0f0),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey)),
                          margin: const EdgeInsets.all(0),
                          child: Row(
                            children: [
                              // SizedBox(
                              //   //height: getProportionateScreenHeight(55),
                              //   width: 70,
                              //   child: CountryCodePicker(
                              //     initialSelection: 'AU',
                              //     favorite: const ['+61', 'AU'],
                              //     showFlag: false,
                              //     showFlagDialog: true,
                              //     alignLeft: true,
                              //   ),
                              // ),

                              GestureDetector(
                                onTap: (() async {
                                // pressed = true;
                                // _showCountryPicker();
                                // !====
                              final country = await countryPicker.showPicker(context: context);
                               countryCode(country!.dialCode);
                               if (country != null) {
                                setState(() {
                                  CountrycodenewNew=country.dialCode;
                                  selectedCountry = country ;
                                // _countryController.text = selectedCountry?.name ?? "";
                                });
                              }
                              // ====  
                                }),
                                child: SizedBox(
                                  width: 60.w,
                                  child: Text(
                                     CountrycodenewNew),
                                ),
                              ),


                              Container(
                                color: Colors.blueGrey,
                                height: 30,
                                width: 1,
                              ),

                              //!=============================================================================
                              Expanded(
                                child: SizedBox(
                                  child: TextFormField(
                                    controller: _phoneContoller,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        // borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: '1234 567 7896',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Email can not be empty";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                       print("typing..... $value");
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //
                        SizedBox(height: 15.sp),

                        Text(
                          getTranslated("appoinment_date", context),
                          style: TextStyles.smallBoldTextStyle(context),
                        ),
                        TextFormField(
                          controller: _calendarController,
                          readOnly: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) return "Choose a date first";
                            return null;
                          },
                        ),
                        //
                        SizedBox(height: 30.sp),

                        VideoCallingPrimaryButton(
                            title: getTranslated("book_appointment", context),
                            onPressed: () {
                              int? totalIndex = slotBookingProvider
                                  .availableSlotModel.data?.length;

                              if (selectedIndex == 0) {
                                setState(() {
                                  showToast(
                                      "Please select a slot first", context);
                                });
                              }

                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  String slotTime = "";
                                  print("slotTime");
                                  print(slotTime);

                                  if (remember == true) {
                                    print('indexed');
                                    print(totalIndex);
                                    print(selectedIndex);

                                    if (totalIndex! > selectedIndex!) {
                                      print("next slot have");
                                      print(selectedIndex! + 1);
                                      indexRaw = selectedIndex! + 1;
                                    } else {
                                      print("No slot");
                                    }
                                  }
                                  DateTime selectedDateTime =
                                      DateFormat("dd-MM-yyyy")
                                          .parse(storeProvider.appoimentDate);

                                  //print("time = ${_slotBookingProvider.availableSlotModel.data?[selectedIndex!-1].slot}");
                                  //selectedDateTime.add(const Duration(hours: 06, minutes: 15, seconds: 00));
                                  print("selectedDateTime");
                                  print(selectedDateTime);
                                  formattedAppointmentDate =
                                      DateFormat('yyyy-MM-dd hh:mm:ss')
                                          .format(selectedDateTime);

                                  print("formattedAppointmentDate");
                                  print(formattedAppointmentDate);

                                  if (selectedIndex != 0) {
                                  /* makePayment(
                                    context,
                                    _emailContoller.text,
                                    _phoneContoller.text,
                                    formattedAppointmentDate); */
                                   BookingSlotData slotData = slotBookingProvider.availableSlotModel.data![selectedIndex!];

                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) => IntrinsicHeight(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                    height: 70,
                                                    child: ListTile(
                                                      onTap: () {
                                                        Navigator.of(context).pop();
                                                        goPage(context, PaymentInfo(slotData: slotData));
                                                      },
                                                      title: Center(
                                                        child: Text(
                                                          "Use Card Payment.",
                                                          style: TextStyles.smallBoldTextStyle(context),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 70,
                                                    child: ListTile(
                                                      onTap: () {
                                                        makePayment(context, _emailContoller.text, _phoneContoller.text, formattedAppointmentDate);
                                                      },
                                                      title: Center(
                                                        child: Text(
                                                          "Use web Payment.",
                                                          style: TextStyles
                                                              .smallBoldTextStyle(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  // const SizedBox(height: 8),
                                                ],
                                              ),
                                            ),
                                          );
                                  }
                                },                           
                              );
                            }
                          }
                        ),
                      ],
                    ),
                ),
              ),
            );
          },
          );
        },
        ),
      ),
    );
  }

  goBackHome() async {
    goPageAndRemove(context, CallingFeature.id);
    return true;
  }

  Widget buildCard(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          print("now selected ===>>> $index");
          selectedIndex = index;
          // showButton = true;
          final apoitmentDateProvider =
              Provider.of<StorageProvider>(context, listen: false);
          apoitmentDateProvider.updateavailableSlotIndex(selectedIndex);
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
                  : const Color(0xffB50000),
              width: 1),
          // image: const DecorationImage(
          //   image: AssetImage(Images.buttonBG),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Center(
                child: Text("",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 0.5.sp,
                      fontWeight: selectedIndex == index
                          ? FontWeight.w700
                          : FontWeight.w400,
                      color: selectedIndex == index
                          ? const Color(0xFFFF0000)
                          : const Color(0xffB50000),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> makePayment(
    BuildContext context,
    email,
    phone,
    formattedAppointmentDate,
  ) async {
    try {
      paymentIntentData = await createPaymentIntent('20', 'USD');

      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  applePay: true,
                  googlePay: true,
                  testEnv: true,
                  style: ThemeMode.dark,
                  merchantCountryCode: 'US',
                  merchantDisplayName: 'ANNIE'))
          .then((value) {});

      // now finally display payment sheeet
      try {
        await Stripe.instance
            .presentPaymentSheet(
                parameters: PresentPaymentSheetParameters(
          clientSecret: paymentIntentData!['client_secret'],
          confirmPayment: true,
        ))
            .then((newValue) {
          print('payment intent${paymentIntentData!['id']}');
          print('payment intent${paymentIntentData!['client_secret']}');
          print('payment intent${paymentIntentData!['amount']}');
          print('payment intent$paymentIntentData');
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Paid successfully")));
          _bookingNow(email, phone, formattedAppointmentDate);

          paymentIntentData = null;

         
        }).onError((error, stackTrace) {
          print('Exception/DISPLAYPAYMENTSHEET ==> $error $stackTrace');
        });
      } on StripeException catch (e) {
        print('Exception/DISPLAYPAYMENTSHEET ==> $e');
        showDialog(
            context: context,
            builder: (_) => const AlertDialog(
                  content: Text("Cancelled"),
                ));
      } catch (e) {
        print('$e');
      }
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': "USD",
        'payment_method_types[]': 'card'
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51IcQKWDwwlfx8vZDtKSBliM7hrut2EVKMBrq4L8oV1gfy4PgtTQqrlS7SfNKO6HunhNkW4lXmULh2bEiTUjLXEOQ00Z377rtca',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

  //
  _bookingNow(email, phone, formattedAppointmentDate) {
    final storeProvider = Provider.of<StorageProvider>(context, listen: false);
    final slotBookingProvider = Provider.of<SlotBookingProvider>(context, listen: false);
    String? slotTime = slotBookingProvider.availableSlotModel.data?[selectedIndex! - 1].slot;
    print(slotTime);

    storeProvider.updateSlotTime(slotTime);
    storeProvider.updateCoachId(slotBookingProvider
        .availableSlotModel.data![storeProvider.availableSlotIndex].userId!);
    storeProvider.confirmAppointmentDate(formattedAppointmentDate.toString());

    slotBookingProvider.bookTheAvailableSlot(
        slotId: "${slotBookingProvider
            .availableSlotModel.data![storeProvider.availableSlotIndex].id!}",
        coachId: "395",
        //_slotBookingProvider.availableSlotModel.data![storeProvider.availableSlotIndex].userId!,
        isExtended: indexRaw ?? 0,
        extendedlotId: (indexRaw == null)
            ? 0
            : slotBookingProvider.availableSlotModel.data?[indexRaw! - 1].id ??
                0,
        email: email,
        phone: phone,
        appointmentDate: formattedAppointmentDate.toString(),
        context: context);
  }
}
