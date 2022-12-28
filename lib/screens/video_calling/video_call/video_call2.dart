// ignore_for_file: avoid_print

import 'dart:async';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olga/screens/coach/coach_video_calling/feedback_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../global/constants/images.dart';
import '../../../global/methods/methods.dart';

const appId = "0fd692ba760242d0a5fb546672a40ae4";
const token =
    "0060fd692ba760242d0a5fb546672a40ae4IACY9qXOkho7WKCYuwS5NxqGg8sjpRHeURMZEioN7Rlhap0J97MAAAAAEACPl0pWRRDNYgEAAQBFEM1i";
const channel = "Olga";

class VideoCallPage2 extends StatefulWidget {
  static const String id = "/videoCall2";
  const VideoCallPage2({Key? key}) : super(key: key);

  @override
  State<VideoCallPage2> createState() => _VideoCallPage2State();
}

class _VideoCallPage2State extends State<VideoCallPage2> {
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;
  bool muted = false;
  bool videoDisable = false;

  @override
  void dispose() {
    // clear users
    // _users.clear();
    // destroy sdk
    _engine.leaveChannel();
    _engine.destroy();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initAgora();
  }

//!##############################################################
  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = await RtcEngine.create(appId);
    await _engine.enableVideo();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user $uid joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");
          setState(() {
            _remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );

    await _engine.joinChannel(token, channel, null, 0);
  }
//!##############################################################

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
    goPage(context, const FeedBackScreen());
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine.muteLocalAudioStream(muted);
  }

  void _onSwitchCamera() {
    _engine.switchCamera();
  }

  void _disableVideo() {
    setState(() {
      videoDisable = !videoDisable;
    });
    //_engine.muteLocalVideoStream(videoDisable);
    if (videoDisable == true) {
      _engine.disableVideo();
    } else {
      _engine.enableVideo();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _remoteVideo(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: videoDisable
                ? Padding(
                  padding: const EdgeInsets.symmetric(vertical:28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     GestureDetector(
                      onTap:  (){
                       Navigator.pop(context);},
                       child:  Padding(
                           padding: const EdgeInsets.only(left:18.0),
                           child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                       child: Container(
                        height: 50,
                        width: 50,
                        color: const Color(0xffB50000),
                        child: const Icon(Icons.arrow_back_ios,color: Colors.white,),
                       ),
                     ),
                         ),
                     ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                                    borderRadius: BorderRadius.circular(18),
                          child: Container(
                             width: 150,
                              height: 200,
                            decoration: const BoxDecoration(color: Color(0xffB50000)),
                              child: Image.asset(
                                Images.launch_image,
                                // fit: BoxFit.cover,
                                width: 10.w,
                                height: 10.h,
                              ),
                            ),
                        ),
                      ),
                    ],
                  ),
                )
                : Padding(
                   padding: const EdgeInsets.symmetric(vertical:28.0),
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                          GestureDetector(
                      onTap:  (){ Navigator.pop(context);},
                           child: Padding(
                             padding: const EdgeInsets.only(left:18.0),
                             child: ClipRRect(
                                               borderRadius: BorderRadius.circular(8),
                                                child: Container(
                                                 height: 50,
                                                 width: 50,
                                                 color: const Color(0xffB50000),
                                                 child: const Icon(Icons.arrow_back_ios,color: Colors.white,),
                                                ),
                                              ),
                           ),
                         ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                                      borderRadius: BorderRadius.circular(18),
                          child: SizedBox(
                              width: 150,
                              height: 200,
                              child: Center(
                                child: _localUserJoined
                                    ? const RtcLocalView.SurfaceView()
                                    : const CircularProgressIndicator(),
                              ),
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
          ),
          _toolbar(),
        ],
      ),
    );
  }

  //!==========

  // Create UI with local view and remote view
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(
        uid: _remoteUid!,
        channelId: channel,
      );
    } else {
      return const Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _toolbar() {
    // if (widget.role == ClientRole.Audience) return Container();
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: _onToggleMute,
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: muted ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              muted ? Icons.mic_off : Icons.mic,
              color: muted ? Colors.white : Colors.blueAccent,
              size: 20.0,
            ),
          ),
          RawMaterialButton(
            onPressed: () => _onCallEnd(context),
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15.0),
            child: const Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0,
            ),
          ),
          RawMaterialButton(
            onPressed: _onSwitchCamera,
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12.0),
            child: const Icon(
              Icons.switch_camera,
              color: Colors.blueAccent,
              size: 20.0,
            ),
          ),
          RawMaterialButton(
            onPressed: _disableVideo,
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: videoDisable ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              videoDisable ? Icons.videocam_off : Icons.videocam,
              color: videoDisable ? Colors.white : Colors.blueAccent,
              size: 20.0,
            ),
          )
        ],
      ),
    );
  }
}
