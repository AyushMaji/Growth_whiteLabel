import 'package:flutter/material.dart';
import 'package:olga/global/constants/images.dart';
import 'package:olga/global/methods/methods.dart';
import 'package:olga/global/widgets/custom_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/provider/storage_provider.dart';
import 'package:olga/screens/registration/enter_name.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class IntroductoryVideo extends StatefulWidget {
  static const String id = "/introductoryVideo";
  const IntroductoryVideo({Key? key}) : super(key: key);

  @override
  State<IntroductoryVideo> createState() => _IntroductoryVideoState();
}

class _IntroductoryVideoState extends State<IntroductoryVideo> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    setState(() {
      _controller = VideoPlayerController.asset(
        Images.introVideo,
      )..initialize().then((_) {
          _controller.setLooping(true);
          _controller.value.isInitialized;
          _controller.value.isPlaying;
          _controller.play();
        });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isMedium = false;

  @override
  Widget build(BuildContext context) {
    isMedium = ModalRoute.of(context)?.settings.arguments != null
        ? (ModalRoute.of(context)?.settings.arguments as bool)
        : false;
    return /* WillPopScope(
      onWillPop: () => onWillPopWarning(context),
      child: */
        Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const NoBackPressAppbar(),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _controller.value.isInitialized
              ? const SizedBox.shrink()
              : AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
          Positioned(
            top: 500.h,
            child: Container(
              height: 120.h,
              width: 367.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    // Color(0x9E616161),
                    // Color(0xFF616161),
                    Color(0xFF040404),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      "Introductory Video",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 25.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Flexible(
                    child: TextButton(
                      onPressed: () {
                        _controller.pause();
                        if (isMedium) {
                          Provider.of<StorageProvider>(context, listen: false)
                              .registrationSafetyNet(
                                  route: EnterName.id);
                        }
                        goNamedWithBool(context, EnterName.id, isMedium);
                      },
                      child: Text(
                        "SKIP >>",
                        //style: TextStyle(color: Colors.white),
                        style: TextStyle(
                          //letterSpacing: 2,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //),
    );
  }
}
