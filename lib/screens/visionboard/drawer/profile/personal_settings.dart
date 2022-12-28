// ignore_for_file: prefer_const_constructors, avoid_print
import 'dart:developer';
import 'dart:io';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:olga/global/constants/app_constants.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/styles/text_styles.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/models/data_model/profile_model.dart';
import 'package:olga/provider/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../provider/localization_provider.dart';
import 'package:image_picker/image_picker.dart';


class PersonalSettings extends StatefulWidget {
  static const String id = "/personalSettings";
  const PersonalSettings({Key? key}) : super(key: key);

  @override
  State<PersonalSettings> createState() => _PersonalSettingsState();
}

class _PersonalSettingsState extends State<PersonalSettings> {
String _selected = 'Male';
final _items = [
    'Male',
    'Female',
    'Non-Binary',
    'Opt-out'
  ];

  // String countrycodenewNew = "";
  String CountrycodenewNew = "";

  void countryCode(
    String myCountryCode,
  ) async {
    log(myCountryCode);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("setCountryCode", myCountryCode);
  }

  var selectedCountry;

  final _formKey = GlobalKey<FormState>();
  bool pressed = false;

  //!===
  final countryPicker = const FlCountryCodePicker();
  //!==

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  var myImagePath;
  DateTime selectedStartDate = DateTime.now();

  final _firstnameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _contacEmailtController = TextEditingController();
  final _dobController = TextEditingController();
  final _countryController = TextEditingController();
  final _preferedlangController = TextEditingController(text: "English");
  final _phoneController = TextEditingController();

  String initialPhoneCountry = "US";

  var firstPartOfName = '';
  List<String>? listOfStrings = [];

  void filePicker(ImageSource source) async {
    final XFile? selectedImage = await _picker.pickImage(source: source);
    setState(() {
      image = selectedImage;
      pressed = true;
      print("selected image ===>>> $image".toString());
    });
  }

  clearimage() {
    setState(() {
      image = null;
      pressed = false;
    });
  }

  // ===============|> 
  Future _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: selectedStartDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1790),
        lastDate: DateTime(2030));
    if (picked != null) {
      setState(() {
        selectedStartDate = picked;
        _dobController.text = DateFormat('dd/MM/yyyy').format(selectedStartDate);
      });
    }
  }

  
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

  @override
  void initState() {
    super.initState();
    getCred();
    ProfileProvider profileData = Provider.of<ProfileProvider>(context, listen: false);
    profileData.viewUserProfileDetails();

    _firstnameController.text = profileData.profileModel.data?.userDetails?.firstName ?? "";

    _lastNameController.text = profileData.profileModel.data?.userDetails?.lastName ?? "";

    //_selected = profileData.profileModel.data?.userDetails?.gender ?? "Male";

    _contacEmailtController.text = profileData.profileModel.data?.userDetails?.email ?? "";
    //
    _dobController.text = profileData.profileModel.data?.userDetails?.dateOfBirth ?? "";
    //
    _countryController.text = profileData.profileModel.data?.userDetails?.countryOfResidence ?? "AUS";
    _preferedlangController.text = profileData.profileModel.data?.userDetails?.prefferedLanguage ?? "";
    _phoneController.text = profileData.profileModel.data?.userDetails?.phoneNumber ?? "";
    myImagePath = profileData.profileModel.data?.userDetails?.image ?? "";

    setState(() {
       _selected = profileData.profileModel.data?.userDetails?.gender ?? "";
       log(profileData.profileModel.data?.userDetails?.gender ?? "");
    });
    
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _lastNameController.dispose();
    _contacEmailtController.dispose();
    _countryController.dispose();
    _preferedlangController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  String countryValue = "";
  String countryDropdownLabel = "Tuhin";
  String selectedItem = "English";
  List<String> myItems = ["English"];
  @override
  Widget build(BuildContext context) {
    LocalizationProvider storeValues =
        Provider.of<LocalizationProvider>(context, listen: false);

    GlobalKey<CSCPickerState> cscPickerKey = GlobalKey();
    var size = MediaQuery.of(context).size.width;

    ProfileModel profileModel = ProfileModel();
    print(" ================ ${profileModel.data} ================ ");
    print(" ================ ${profileModel.msg} ================= ");

    UserDetails userDetails = UserDetails();
    print("${userDetails.email}");

    return Scaffold(
      appBar: dashboardAppBar(
        context,
        getTranslated("personal_settings", context),
      ),
      body: Consumer<ProfileProvider>(builder: (context, profileData, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 15.sp, right: 15.sp),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  SizedBox(
                    height: 150.h,
                    child: Stack(
                      children: [
                        if (image != null)
                          CircularProfileAvatar(
                            '',
                            radius: 60.sp, // sets radius, default 50.0
                            backgroundColor: Colors.transparent,
                            borderWidth: 3,
                            borderColor: Color(0xffB50000),
                            elevation: 2.0,
                            //foregroundColor: Colors.brown.withOpacity(0.5),
                            cacheImage: true,
                            child: Image.file(
                              File(image!.path),
                              fit: BoxFit.cover,
                            ),
                            //imageFit = BoxFit.cover,
                          )
                        else
                          CircularProfileAvatar(
                            "${AppConstants.baseURL}${profileData.profileModel.data?.userDetails?.image}",
                            radius: 60.sp,
                            borderWidth: 3,
                            borderColor: Color(0xffB50000),
                            cacheImage: true,
                            child: FadeInImage.assetNetwork(
                                placeholder: Images.uploadImage,
                                image: profileData.profileModel.data
                                            ?.userDetails?.image ==
                                        null
                                    ? 'https://raw.githubusercontent.com/muktabd/public-images/main/profile-placeholder.jpeg'
                                    : "${AppConstants.baseURL}${profileData.profileModel.data?.userDetails?.image}"),
                          ),
                        Positioned(
                          //  top: size < 480 ? 90.h : 100.h,
                          top: 75.h,
                          right: 0,
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: Color(0xffB50000),
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    side: BorderSide(color: Colors.white)),
                              ),
                              onPressed: () {
                               pressed = true;  
                                setState(() {
                                  bottomSheet();
                                });
                              },
                              child: Icon(
                                Icons.edit,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ], //<Widget>[]
                    ), //Center
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      //  mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [                                 
                                  Text(                                   
                                    "What is your first name?*",
                                    style:
                                        TextStyles.smallBoldTextStyle(context),
                                  ),
                                  TextFormField(
                                    controller: _firstnameController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      hintText: 'Enter Your First Name',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "First Name can not be empty";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                    setState(() {
                                      pressed = true;
                                    });
                                      print("typing.... $value");
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.w
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "What is your last name?*",
                                    style:
                                        TextStyles.smallBoldTextStyle(context),
                                  ),
                                  TextFormField(
                                    controller: _lastNameController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      hintText: 'Enter Your Last Name',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Last Name can not be empty";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                    setState(() {
                                      pressed = true;
                                    });
                                      print("typing.... $value");
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15.sp),
                        //

                        Text("Gender",
                          style: TextStyles.smallBoldTextStyle(context),
                        ),
                        
                        Container(
                          // width: 163,
                          height: 47.h,
                          decoration: BoxDecoration(
                            //color: Colors.green,
                            border: Border.all(
                              color: Color(0xff8E8E8E),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          margin: EdgeInsets.only(top: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              hint: Text("Select"),
                              underline: Container(),
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 24,
                              isExpanded: true,
                              onChanged: (value) {
                                setState(() {
                                 pressed = true;
                                  _selected = value!;
                                });
                              },
                              value: _selected,
                              items: _items.map((state) => DropdownMenuItem(
                                        value: state,
                                        child: Text(state),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),                                             
                        SizedBox(height: 15.sp),

                        Text(
                          getTranslated("contact", context),
                          style: TextStyles.smallBoldTextStyle(context),
                        ),
                        TextFormField(
                          readOnly: true,
                          controller: _contacEmailtController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: 'example@email.com',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) return "Email can not be empty";
                            return null;
                          },
                          onChanged: (value) {
                          setState(() {
                            pressed = true;
                          });
                            //
                          },
                        ),
                        SizedBox(height: 15.sp),
                        
                        //
                        Text(
                          getTranslated("date_of_birth", context),
                          style: TextStyles.smallBoldTextStyle(context),
                        ),
                        TextFormField(
                          controller: _dobController,
                          keyboardType: TextInputType.datetime,
                          onTap: () {
                            setState(() {
                              _selectStartDate(context);
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            hintText: 'DD/MM/YYYY',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _selectStartDate(context);                                 
                                  pressed = true;                                   
                                });
                              },
                              icon: const Icon(Icons.calendar_month),
                              color: Colors.black,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Birthdate can't be empty!";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            print('typing.... $value');
                          },
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          getTranslated("country_of_residence", context),
                          style: TextStyles.smallBoldTextStyle(context),
                        ),

                       
                        SizedBox(height: 15.h),

                        SizedBox(
                        height: 40.h,
                          child: TextFormField(
                            onTap:() async{
                              pressed = true;
                              //!====
                              final country = await countryPicker.showPicker(context: context);
                              countryCode(country!.dialCode);
                               if (country != null) {
                                setState(() {
                                  CountrycodenewNew=country.dialCode;
                                  selectedCountry = country ;
                                  _countryController.text = selectedCountry?.name ?? "";
                                });
                              }
                            //!====  
                            },
                            readOnly: true,
                          controller: _countryController,
                          decoration: InputDecoration(
                          border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                          suffix: IconButton(
                            icon: Icon(Icons.keyboard_arrow_down), 
                            onPressed: () async{
                          pressed = true;
                           //_showCountryPicker();    
                           // //!====
                              final country = await countryPicker.showPicker(context: context);
                              countryCode(country!.dialCode);
                               if (country != null) {
                                setState(() {
                                  CountrycodenewNew=country.dialCode;
                                  selectedCountry = country ;
                                  _countryController.text = selectedCountry?.name ?? "";
                                });
                              }
                            //!====                                             
                          },                           
                          ),
                          ),
                          ),
                        ),
                        //
                        SizedBox(height: 15.h),
                        Text(
                          getTranslated("preferred_language", context),
                          style: TextStyles.smallBoldTextStyle(context),
                        ),
                       
                        Container(
                          height: 45.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff8E8E8E),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          //margin: EdgeInsets.only(top: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              underline: Container(),
                              icon: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Icon(Icons.keyboard_arrow_down),
                              ),
                              iconSize: 24,
                              isExpanded: true,
                              onChanged: (value) {
                                setState(() {
                                  selectedItem = value!;
                                  pressed = true;
                                });
                              },
                              value: selectedItem,
                              items: myItems
                                  .map((state) => DropdownMenuItem(
                                        value: state,
                                        child: Text(
                                          state,
                                          maxLines: 1,
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),

                        SizedBox(height: 15.sp),
                        Text(
                          getTranslated("phone_number", context),
                          style: TextStyles.smallBoldTextStyle(context),
                        ),

                        Container(
                          height: 47.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey)),
                          margin: const EdgeInsets.all(0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: (() async {
                                pressed = true;
                                 // _showCountryPicker();
                                  // //!====
                              final country = await countryPicker.showPicker(context: context);
                               countryCode(country!.dialCode);
                               if (country != null) {
                                setState(() {
                                  CountrycodenewNew=country.dialCode;
                                  selectedCountry = country ;
                                  _countryController.text = selectedCountry?.name ?? "";
                                });
                              }
                            //!====  
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
                              Expanded(
                                child: SizedBox(
                                  child: TextFormField(
                                    controller: _phoneController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                    ],
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        // borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide.none,
                                      ),
                                      hintText: '1234 567 7896',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Phone can not be empty";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      // 
                                       pressed = true;  
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.sp),
                        //

                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 10),
                          child: SubmitButton(
                            title: getTranslated("save", context),
                            onPressed: pressed ? () {
                            print(_countryController.text);
                                    if (_formKey.currentState!.validate() && _countryController.text != '' && _selected.isNotEmpty) {
                                      setState(() {
                                        storeValues.changeCountryCode(
                                            initialPhoneCountry);
                                        storeValues.changeCountry(countryValue);

                                        if(image != null){
                                        _saveUpdatedValuesAndNavigate(image);
                                        log("WithImage");
                                        }else {
                                        _updateDataWithoutImageAndNavigate();
                                        log("WithoutImage");
                                        }                                      
                                      });
                                      // goPage(context, Completed());
                                    } else {                                 
                                      print("Updated");
                                    }
                                  } :(){
                                   print("pressed Updated");
                                  },
                              
                            buttonStyle: pressed
                                ? ButtonStyles.getCommonStyle(context)
                                : ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.black26,
                                    ),
                                    foregroundColor: MaterialStateProperty.all(Colors.white),),
                          ),
                        ),
                        SizedBox(height: 15.sp),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  //
  _saveUpdatedValuesAndNavigate(image) {
    print("working with image");
    _updateDataWithoutImageAndNavigate();
    var profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    profileProvider.updateProfileImage(image: image, context: context);
  }

  _updateDataWithoutImageAndNavigate() {
    print("working without image this");
    Provider.of<ProfileProvider>(context, listen: false)
        .updateProfileDetails(
            firstName: _firstnameController.text,
            lastName: _lastNameController.text,
            dateOfBirth: _dobController.text,
            countryOfResidence: _countryController.text,
            prefferedLang: selectedItem,
            phoneNumber: _phoneController.text,
            gender: _selected,
            context: context)
        .then((value) {
        //goPage(context, Completed());
    });
    
      log("${_firstnameController.text} \n ${_lastNameController.text} \n ${_countryController.text} \n ${_dobController.text} \n $selectedItem \n ${_phoneController.text}");
      print("print then update profile value");
  }

  //
  Future<dynamic> bottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8, right: 8),
                child: Text(
                  "Please insert a picture to help you visualize your goal in your vision board.",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color:
                        const Color(0xffDEB988), // this is for your text colour
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0, left: 8, bottom: 0),
                child: Text(
                  "Insert Image From",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Color(0xff2E2E2E), // this is for your text colour
                  ),
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(
                  left: 8,
                ),
                horizontalTitleGap: 6,
                leading: const Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.black,
                ),
                title: const Text('Camera'),
                onTap: () {
                  filePicker(ImageSource.camera);

                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 8),
                horizontalTitleGap: 6,
                leading: Image.asset(
                  "assets/images/upload_image_icon.png",
                  color: Colors.black,
                  height: 24,
                ),
                title: const Text('Gallery'),
                onTap: () {
                  filePicker(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.only(left: 8),
                horizontalTitleGap: 6,
                leading: const Icon(
                  Icons.cloud_upload_rounded,
                  color: Colors.black,
                ),
                title: const Text('Cloud Links'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}