// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/widgets/calling_primary_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/video_calling/calling_feature.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

class AppoinmentDone extends StatefulWidget {
  static const String id = "/appoinmentDone";
  const AppoinmentDone({Key? key}) : super(key: key);

  @override
  State<AppoinmentDone> createState() => _AppoinmentDoneState();
}

class _AppoinmentDoneState extends State<AppoinmentDone> {

  final GlobalKey printKey = GlobalKey();
  final doc = pw.Document();

 

  // ========== Funtion() for widget to pdf ============
  void _printScreen() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      final image = await WidgetWraper.fromKey(
        key: printKey,
        pixelRatio: 2.0,
      );

      doc.addPage(pw.Page(
          pageFormat: format,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Expanded(
                child: pw.Image(image),
              ),
            );
          }));

      return doc.save();
    });
  }
  //!=========================

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
    onWillPop: () => goBackHome(),
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Image.asset(Images.appBarBG,  fit: BoxFit.cover, height: MediaQuery.of(context).size.height),
            leadingWidth: 20.w,
            leading: IconButton(
              onPressed: () {
                print("new appbar");
                goPageAndRemove(context, CallingFeature.id);
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
        body: Consumer<StorageProvider>(builder: (context, _storeProvider, child) {
      return RepaintBoundary(
       key: printKey,
        child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(children: [
                SizedBox(height: 19.h,),
                SizedBox(
                  height: 250.h,
                  child:Image.asset(Images.appoinment_done)
                  //  FadeInImage.assetNetwork(
                  //   fit: BoxFit.cover,
                  //   placeholder: Images.uploadImage,
                  //   image: 'https://i.imgur.com/FUAMDIR.png',
                  // ),
                  // Image.asset(Images.cross_pose)
                ),
                  SizedBox(height: 19.h,),
                Text(
                  "Your appointment is scheduled",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffB50000)),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Soul & Mind Patrol Coach: Olga Varsos",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000)),
                ),
                Text(
                  "health professional",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffB3B3B3)),
                ),
                SizedBox(height: 10.h),
                Text("appointment date: ${_storeProvider.appoimentDate}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff263238)),
                ),
                SizedBox(height: 10.h),
                Text("appointment time : ${_storeProvider.slotTime}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff263238)),
                ),
                SizedBox(height: 10.h),
                Text("Coach Id: ${_storeProvider.coachId}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff263238)),
                ),
                SizedBox(height: 28.h),
                InkWell(
                onTap: (){
                 _printScreen();
                },
                  child: Text(
                    "Download Invoice",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffB50000)),
                  ),
                ),
              ]),
            ),
      );
          }
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.only(bottom: 40.0, left: 18, right: 18),
          child: VideoCallingPrimaryButton(
            title: getTranslated("ok", context),
            onPressed: () {
              goPageAndRemove(context, CallingFeature.id);           
            },
          ),
        ),
      ),
    );
  }
  
  goBackHome() async {
    goPageAndRemove(context, CallingFeature.id);      
    return true;
  }
}
