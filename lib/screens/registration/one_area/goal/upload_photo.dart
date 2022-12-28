// ignore_for_file: avoid_print, prefer_const_constructors
import 'dart:io';
import 'package:olga/provider/goal_planning_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olga/global/widgets/text_button.dart';
import 'package:olga/provider/storage_provider.dart';

class UploadPhoto extends StatefulWidget {
  static const String id = "/uploadPhoto";
  const UploadPhoto({Key? key}) : super(key: key);

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  void filePicker(ImageSource source) async {
    final XFile? selectedImage = await _picker.pickImage(source: source);
    setState(() {
      image = selectedImage;
      print("selected image ===>>> $image");
    });
  }

  clearimage() {
    setState(() {
      image = null;
    });
  }

  bool isvisible = true;
  bool imageBoxVisibility = false;
  bool uploadGoalText = false;

  @override
  Widget build(BuildContext context) {
    final goalSetUp = Provider.of<StorageProvider>(context, listen: false);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff344765),
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 85.h,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 17.0, right: 18, top: 10, bottom: 20),
                            child: Column(
                              children: [
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Text(
                                      "Active your ${goalSetUp.oneSelectedArea} goal",
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20.sp,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Image.asset(
                            "assets/images/MouCrop.png", // full image
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    //!========================================================>>> My goal=============================================
                    Positioned(
                      top: height < 365
                          ? 250.h // android 4.7 - 5.0
    
                          : height < 670
                              ? 210.h // iphone 6s
    
                              : height < 685
                                  ? 220.h // 5.5
    
                                  : height < 810
                                      ? 180.h // poco M3
    
                                      : height < 490
                                          ? 180.h
                                          : height < 1110 //moto g 52
                                              ? 190.h
                                              : 240.h,
                      right: 60.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "My Goal",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                            ),
                          ),
    
                          //!
                          SizedBox(
                            //color: Colors.green,
                            height: 60.h,
                            width: 105.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Flexible(
                                  child: Text(
                                    // "82KG"+
                                    goalSetUp.mainGoal,
                                    textAlign: TextAlign.end,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 7.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
  
                    // ===>>> 5th goal house
    
                    Positioned(
                      top: height < 365
                          ? 360.h // screen 4.7
    
                          : height < 670 // iphone 6s 4.7
                              ? 330.h
                              : height < 810
                                  ? 285.h // POCO M3
    
                                  : height < 485 // 480 <485
                                      ? 290.h // newscrenn height
    
                                      : height < 1110
                                          ? 285.h
                                          : 260.h, // by defulat
    
                      left: 285.w,
                      child: SizedBox(
                        height: 60.h,
                        width: 70.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                // "5th" +
                                goalSetUp.fifthGoal,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 7.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
    
    //!========================================================>>>  4th goal house=============================================
                    //===>>> 4th goal house
    
                    Positioned(
                      top: height < 365
                          ? 440.h // screen 4.7
    
                          : height < 670 // iphone 6s 4.7
                              ? 405.h
                              : height < 810
                                  ? 350.h // poco m3
    
                                  : height < 490
                                      ? 360.h
                                      : height < 1110
                                          ? 345.h
                                          : 400.h,
                      left: 228.w,
                      child: SizedBox(
                        height: 60.h,
                        width: 120.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                // "4th" +
                                goalSetUp.fourthGoal,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 7.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
    
                    //!========================================================>>> 3rd gola house=============================================
                    // ===>>> 3rd gola house
    
                    Positioned(
                      top: height < 365
                          ? 515.h // screen 4.7 - 5.0
    
                          : height < 670 // ihone 6s 4.7
                              ? 475.h
                              : height < 810
                                  ? 410.h // POCO M3
    
                                  : height < 490
                                      ? 410.h
                                      : height < 490
                                          ? 410.h
                                          : height < 1110
                                              ? 400.h
                                              : 460.h,
                      left: 160.w,
                      child: SizedBox(
                        height: 60.h,
                        width: 170.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                //"3rd" +
                                goalSetUp.thirdGoal,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 7.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
    
                    //!========================================================>>> 2nd goal house=============================================
                    //===>>> 2nd goal house
    
                    Positioned(
                      top: height < 365
                          ? 590.h // screen 4.7
    
                          : height < 670 // iphone 6s 4.7
                              ? 540.h
                              : height < 810
                                  ? 465.h // poco m3
    
                                  : height < 490
                                      ? 469.h
                                      : height < 1110
                                          ? 455.h
                                          : 530.h,
                      left: 105.w,
                      child: SizedBox(
                        height: 60.h,
                        width: 170.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                //"2nd" +
                                goalSetUp.secondGoal,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 7.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
    
                    //  background
                    //!========================================================>>> 1st goal house=============================================
                    //===>>>  1st goal house
    
                    Positioned(
                      top: height < 365
                          ? 660.h // screen 4.7
    
                          : height < 670 // iphone 6s 4.7
                              ? 600.h
                              : height < 810
                                  ? 520.h // poco m3
    
                                  : height < 490
                                      ? 525.h
                                      : height < 1110
                                          ? 505.h
                                          : 680.h,
                      left: 30.w,
                      child: SizedBox(
                        //color: Colors.green,
                        height: 70.h,
                        width: 320.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Text(
                                //"1st" +
                                goalSetUp.firstGoal,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 7.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //
                  ],
                ),
    
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 17, bottom: 0, right: 23),
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: 'Tracking ',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                  text:
                                      'Set your start and end dates for your goal',
                                  style: TextStyle(fontWeight: FontWeight.w300)),
                              // TextSpan(text: ' world!'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      InkWell(
                        onTap: () {
                          //filePicker()
                          setState(() {
                            bottomSheet(context);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DottedBorder(
                            color: Colors.white,
                            strokeWidth: 1,
                            child: SizedBox(
                              height: 91,
                              width: 162,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (image == null) ...[
                                    Image.asset(
                                      "assets/images/upload_image_icon.png",
                                    ),
                                    const Text(
                                      "Upload Image",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ] else ...[
                                    Image.file(
                                      File(image!.path),
                                      width: 162,
                                      height: 91,
                                      fit: BoxFit.cover,
                                    ),
                                  ]
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            //======= Submit button after image selectionAfte image
                            if (image != null)
                              TextButton(
                                  style: TextButton.styleFrom(
                                    minimumSize: Size.zero,
                                    padding:
                                        EdgeInsets.only(right: 17, bottom: 17),
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      clearimage();
                                    });
                                  },
                                  child: Text(
                                    "Remove",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color: const Color(
                                          0xffFF3200), // this is for your text colour
                                    ),
                                  )),
                            const Spacer(),
                            if (image != null)
                              TextButton(
                                style: TextButton.styleFrom(
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.only(right: 17, bottom: 17),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isvisible = false;
                                    imageBoxVisibility = true;
                                    uploadGoalText = true;
                                  });
                                },
                                child: TextBtn(
                                  title: "Submit",
                                  onPressed: () {
                                    //
                                    goalSetUp.changeGoalImage(image);
                                    print("selected image ===>>> $image");
                                    print("working with image");
                                    GoalPlanningProvider goalPlanningProvider =
                                        Provider.of<GoalPlanningProvider>(context,
                                            listen: false);
                                    goalPlanningProvider
                                        .uploadGoalImage(
                                            image: image!, context: context)
                                        .then((value) {
                                      print(value);
                                      print("uploaded");
                                    });
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  //
  Future<dynamic> bottomSheet(BuildContext context) {
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
      },
    );
  }
}
