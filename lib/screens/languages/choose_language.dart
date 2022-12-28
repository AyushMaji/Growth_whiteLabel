// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/styles/box_decoration.dart';
import 'package:olga/global/styles/button_style.dart';
import 'package:olga/global/widgets/submit_button.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:olga/provider/localization_provider.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/registration/introductory_video.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ChooseLanguage extends StatefulWidget {
  static const String id = "/chooseLanguage";
  const ChooseLanguage({Key? key}) : super(key: key);

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  List<String> countryName = [
    'ENGLISH',
    'ITALIANO',
    'عربى',
    'ESPAÑOL',
    '中國人',
    'हिंदी',
    'FRANÇAISE',
    'PORTUGUÊS'
  ];
  List<String> countryFlags = [
    Images.us,
    Images.italy,
    Images.arabic,
    Images.spain,
    Images.chinese,
    Images.india,
    Images.france,
    Images.portugues
  ];
  int index = 0;
  //:::::::::::::::::::::::
  bool langEU = true;
  bool langItaly = false;
  bool arabic = false;
  bool spain = false;
  bool chinese = false;
  bool hindi = false;
  bool france = false;
  bool portugues = false;

  bool isMedium = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isMedium = ModalRoute.of(context)?.settings.arguments != null ? (ModalRoute.of(context)?.settings.arguments as bool) : false;
    print(isMedium);
      SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 30.h, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: ClipOval(
                      child: Image.asset(
                        Images.userPlaceholder,
                        width: 100.w,
                      ),
                    ),
                  ),
                  SizedBox(width: 25.w),
                  Flexible(
                    flex: 1,
                    child: 
                    Text("Growth",style: TextStyle(fontSize: 40.sp),)
                    //Image.asset(Images.olgaTM),
                  ),
                ],
              ),
            ),
            //
            /* const SizedBox(height: 10),
            Text("Your are going with " + getTranslated("lang", context)+" language. You can change it from app settinng."),
            const SizedBox(height: 10), */
            //
            Expanded(
              child: Consumer<LocalizationProvider>(
                builder: (context, langProvider, child) {
                  return ListView(
                    //physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Card(
                        child: Container(
                          decoration: langEU ? boxDecoration : null,
                          child: ListTile(
                            title: Text(
                              countryName[0],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: langEU ? Colors.white : Colors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                            // trailing: Padding(
                            //   padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                            //   child: Image.asset(countryFlags[0]),
                            // ),
                            onTap: () {
                              print("English");
                              setState(() {
                                langEU = !langEU;
                                hindi = false;
                                france = false;
                                portugues = false;
                                chinese = false;
                                spain = false;
                                arabic = false;
                                langItaly = false;
                                //
                                langProvider
                                    .setLanguage(const Locale('en', "US"));
                              });
                            },
                          ),
                        ),
                      ),

                      //
                      Card(
                        child: Container(
                          decoration: langItaly ? boxDecoration : null,
                          child: ListTile(
                            title: Text(
                              countryName[1],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: langItaly ? Colors.white : Colors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                            subtitle:   Shimmer.fromColors(
                          baseColor: Colors.red,
                highlightColor: Colors.white,

                          child: Text("Coming Soon",textAlign: TextAlign.center,style: TextStyle(fontSize: 9.sp),),
                        ),
                            // trailing: Padding(
                            //   padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                            //   child: Image.asset(countryFlags[1]),
                            // ),
                            onTap: () {
                             // showCustomDialogBox(context);

                              // setState(() {
                              //   langItaly = !langItaly;
                              //   langEU = false;
                              //   hindi = false;
                              //   france = false;
                              //   portugues = false;
                              //   chinese = false;
                              //   spain = false;
                              //   arabic = false;
                              //   //
                              //   //langProvider.setLanguage(const Locale('it',"IT"));
                              // });
                            },
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          decoration: arabic ? boxDecoration : null,
                          child: ListTile(
                            title: Text(
                              countryName[2],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: arabic ? Colors.white : Colors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                              subtitle:   Shimmer.fromColors(
                          baseColor: Colors.red,
                highlightColor: Colors.white,

                          child: Text("Coming Soon",textAlign: TextAlign.center,style: TextStyle(fontSize: 9.sp),),
                        ),
                            // trailing: Padding(
                            //   padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                            //   child: Image.asset(countryFlags[2]),
                            // ),
                            onTap: () {
                              //showCustomDialogBox(context);
                              // setState(() {
                              //   arabic = !arabic;
                              //   langItaly = false;
                              //   langEU = false;
                              //   hindi = false;
                              //   france = false;
                              //   portugues = false;
                              //   chinese = false;
                              //   spain = false;
                              //   //
                              //   //langProvider.setLanguage(const Locale('ar',"SA"));
                              // });
                            },
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          decoration: spain ? boxDecoration : null,
                          child: ListTile(
                            title: Text(
                              countryName[3],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: spain ? Colors.white : Colors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                              subtitle:   Shimmer.fromColors(
                          baseColor: Colors.red,
                highlightColor: Colors.white,

                          child: Text("Coming Soon",textAlign: TextAlign.center,style: TextStyle(fontSize: 9.sp),),
                        ),
                            // trailing: Padding(
                            //   padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                            //   child: Image.asset(countryFlags[3]),
                            // ),
                            onTap: () {
                              //showCustomDialogBox(context);
                              // setState(() {
                              //   spain = !spain;
                              //   chinese = false;
                              //   hindi = false;
                              //   portugues = false;
                              //   france = false;
                              //   arabic = false;
                              //   langEU = false;
                              //   langItaly = false;
                              //   //
                              //   //langProvider.setLanguage(const Locale('es',"ES"));
                              // });
                            },
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          decoration: chinese ? boxDecoration : null,
                          child: ListTile(
                            title: Text(
                              countryName[4],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: chinese ? Colors.white : Colors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                              subtitle:   Shimmer.fromColors(
                          baseColor: Colors.red,
                highlightColor: Colors.white,

                          child: Text("Coming Soon",textAlign: TextAlign.center,style: TextStyle(fontSize: 9.sp),),
                        ),
                            // trailing: Padding(
                            //   padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                            //   child: Image.asset(countryFlags[4]),
                            // ),
                            onTap: () {
                             // showCustomDialogBox(context);
                              // setState(() {
                              //   chinese = !chinese;
                              //   hindi = false;
                              //   portugues = false;
                              //   france = false;
                              //   spain = false;
                              //   arabic = false;
                              //   langEU = false;
                              //   langItaly = false;
                              //   //
                              //   //langProvider.setLanguage(const Locale('zh',"CN"));
                              // });
                            },
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          decoration: hindi ? boxDecoration : null,
                          child: ListTile(
                            title: Text(countryName[5],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: hindi ? Colors.white : Colors.black,
                                  fontSize: 16.sp,
                                )),
                                  subtitle:   Shimmer.fromColors(
                          baseColor: Colors.red,
                highlightColor: Colors.white,

                          child: Text("Coming Soon",textAlign: TextAlign.center,style: TextStyle(fontSize: 9.sp),),
                        ),
                            // trailing: Padding(
                            //   padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                            //   child: Image.asset(countryFlags[5]),
                            // ),
                            onTap: () {
                             // showCustomDialogBox(context);
                              // setState(() {
                              //   hindi = !hindi;
                              //   portugues = false;
                              //   france = false;
                              //   chinese = false;
                              //   spain = false;
                              //   arabic = false;
                              //   langEU = false;
                              //   langItaly = false;
                              //   //
                              //   //langProvider.setLanguage(const Locale('hi',"IN"));
                              // });
                            },
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          decoration: france ? boxDecoration : null,
                          child: ListTile(
                            title: Text(countryName[6],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: france ? Colors.white : Colors.black,
                                  fontSize: 16.sp,
                                )),
                                  subtitle:   Shimmer.fromColors(
                          baseColor: Colors.red,
                highlightColor: Colors.white,

                          child: Text("Coming Soon",textAlign: TextAlign.center,style: TextStyle(fontSize: 9.sp),),
                        ),
                            // trailing: Padding(
                            //   padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                            //   child: Image.asset(countryFlags[6]),
                            // ),
                            onTap: () {
                              //showCustomDialogBox(context);
                              // setState(() {
                              //   france = !france;
                              //   portugues = false;
                              //   chinese = false;
                              //   spain = false;
                              //   arabic = false;
                              //   langEU = false;
                              //   langItaly = false;
                              //   hindi = false;
                              //   //
                              //   //langProvider.setLanguage(const Locale('fr',"FR"));
                              // });
                            },
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          decoration: portugues ? boxDecoration : null,
                          child: ListTile(
                            title: Text(countryName[7],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      portugues ? Colors.white : Colors.black,
                                  fontSize: 16.sp,
                                )),
                                  subtitle:   Shimmer.fromColors(
                          baseColor: Colors.red,
                highlightColor: Colors.white,

                          child: Text("Coming Soon",textAlign: TextAlign.center,style: TextStyle(fontSize: 9.sp),),
                        ),
                            // trailing: Padding(
                            //   padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                            //   child: Image.asset(countryFlags[7]),
                            // ),
                            onTap: () {
                              //showCustomDialogBox(context);
                              // setState(() {
                              //   france = false;
                              //   chinese = false;
                              //   spain = false;
                              //   arabic = false;
                              //   langEU = false;
                              //   langItaly = false;
                              //   hindi = false;
                              //   portugues = !portugues;
                              //   //
                              //   //langProvider.setLanguage(const Locale('pt',"PT"));
                              // });
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SubmitButton(
              title: getTranslated('continue', context),
              onPressed: () {
                if(isMedium) {
                  Provider.of<StorageProvider>(context, listen: false).registrationSafetyNet(route: IntroductoryVideo.id);
                }
                goNamedWithBool(context, IntroductoryVideo.id, isMedium);
                print('===>>> language selection done');
              },
              buttonStyle: ButtonStyles.getCommonStyle(context),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  showCustomDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // title: const Text('Sorry'),
        contentPadding: const EdgeInsets.all(20),
        content: const Text('Coming soon'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'))
        ],
      ),
    );
  }
}
