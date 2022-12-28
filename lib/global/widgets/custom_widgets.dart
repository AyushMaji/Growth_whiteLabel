import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/localization/language_constrants.dart';
import 'package:provider/provider.dart';

import '../../provider/storage_provider.dart';
import '../../screens/visionboard/visionboard.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.appBarBG),
          fit: BoxFit.cover,
        ),
      ),
      height: 90.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          icon: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(height: 10.h),
                    const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    Flexible(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          getTranslated("back", context),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
           
          //!=========================================================================================
          Provider.of<StorageProvider>(context, listen: true).isAudio==true?
          IconButton(
          icon: Icon(Icons.volume_up,color: Colors.white,),
          tooltip: "Save Todo and Retrun to List",
          onPressed: () {
            Provider.of<StorageProvider>(context, listen: false).changeAudio(false);
          },
        )
        
        : 
          IconButton(
          icon: Icon(Icons.volume_off,color: Colors.white,),
          tooltip: "Save Todo and Retrun to List",
          onPressed: () {
             Provider.of<StorageProvider>(context, listen: false).changeAudio(true);
          
          },
        )
        //!=========================================================================================

            ],
          ),
        ),
      ),
    );
  }
}

// no back button appbar

class NoBackPressAppbar extends StatelessWidget {
  const NoBackPressAppbar({Key? key}) : super(key: key);
  // StorageProvider storeValues =
  //       Provider.of<StorageProvider>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.appBarBG),
          fit: BoxFit.cover,
        ),
      ),
      height: 90.h,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: IconButton(
          onPressed: () async {
            // _onWillPop(context);
            // await onWillPopWarning(context);
            Navigator.pop(context); //
            Navigator.of(context).pop(); //
          },
          icon: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    SizedBox(height: 10.h),
                    const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    Flexible(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          getTranslated("back", context),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
//!========================================= For Text To Speach ====================================
          Provider.of<StorageProvider>(context, listen: true).isAudio==true?
          IconButton(
          icon: Icon(Icons.volume_up,color: Colors.white,),
          tooltip: "Save Todo and Retrun to List",
          onPressed: () {
            Provider.of<StorageProvider>(context, listen: false).changeAudio(false);
          },
        )
        
        : 
          IconButton(
          icon: Icon(Icons.volume_off,color: Colors.white,),
          tooltip: "Save Todo and Retrun to List",
          onPressed: () {
             Provider.of<StorageProvider>(context, listen: false).changeAudio(true);
          
          },
        )
        //!========================================= For Text To Speach ====================================

            ],
          ),
        ),
      ),
    );
  }
}

//
AppBar dashboardAppBar(BuildContext context, String appTitle) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        Flexible(
          child: Text(
            appTitle,
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 15.sp,
            ),
          ),
        ),
      ],
    ),
    flexibleSpace: const Image(
      image: AssetImage(Images.appBarBG),
      fit: BoxFit.cover,
    ),
    backgroundColor: Colors.transparent,
    bottomOpacity: 0.0,
    elevation: 0.0,
  );
}

///* ========= |> <| =======  */
AppBar newAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    flexibleSpace: Image.asset(Images.appBarBG,
        fit: BoxFit.cover, height: MediaQuery.of(context).size.height),
    leadingWidth: 20.w,
    leading: IconButton(
      onPressed: () {
        print("new appbar");
        Navigator.pop(context);
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

          actions: [
            //!========================================= For Text To Speach ====================================
          Provider.of<StorageProvider>(context, listen: true).isAudio==true?
          IconButton(
          icon: Icon(Icons.volume_up,color: Colors.white,),
          onPressed: () {
            Provider.of<StorageProvider>(context, listen: false).changeAudio(false);
          },
        )
        
        : 
          IconButton(
          icon: Icon(Icons.volume_off,color: Colors.white,),
          onPressed: () {
             Provider.of<StorageProvider>(context, listen: false).changeAudio(true);
          
          },
        )
        //!========================================= For Text To Speach ====================================
          ],
  );
}

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    flexibleSpace: Image.asset(Images.appBarBG,
        fit: BoxFit.cover, height: MediaQuery.of(context).size.height),
    leadingWidth: 20.w,
    leading: IconButton(
      onPressed: () {
        print("new appbar");
        goPageWithName(context, VisionBoard.id);
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
  );
}

class CustomAppBarBackup extends StatelessWidget {
  const CustomAppBarBackup({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        AppBar(
          title: Text(getTranslated("back", context)),
          flexibleSpace: Image(
            image: const AssetImage(Images.appBarBG),
            width: width,
          ),
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
      ],
    );
  }
}

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
