import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoCall extends StatefulWidget {
  static const String id = "/videoCall";
  const VideoCall({Key? key}) : super(key: key);

  @override
  State<VideoCall> createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  final AgoraClient _client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
        appId: "0fd692ba760242d0a5fb546672a40ae4", //!!! ####### need to make dynamic here
        tempToken:
            "0060fd692ba760242d0a5fb546672a40ae4IAA/0x/Qc1T6otALrnBkFCPJp4tNmagxhl5dSptqA1W4m50J97MAAAAAEADzS24fCy6sYgEAAQAKLqxi",
        channelName: "Olga"),
  );
  // Initialize the Agora Engine
  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await _client.initialize();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
              client: _client,
              layoutType: Layout.floating,
              showNumberOfUsers: true,
              showAVState: true,
            ),
            AgoraVideoButtons(client: _client),
          ],
        ),
      ),
    );
  }

  Widget _toolbar() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          RawMaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15.0),
            child: Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0.sp,
            ),
          ),
        ],
      ),
    );
  }
}
