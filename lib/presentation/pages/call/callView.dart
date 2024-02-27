
import 'package:agora_uikit/agora_uikit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';

class CallingView extends StatefulWidget {

  String channelName;

  CallingView({required this.channelName});

  @override
  State<CallingView> createState() => _CallingViewState();
}

class _CallingViewState extends State<CallingView> {


  late final AgoraClient client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: "116f18f433de42a9abb0c6d3f2ed5493",
        channelName: widget.channelName,
      ),
      agoraChannelData: AgoraChannelData(
          videoEncoderConfiguration: VideoEncoderConfiguration(frameRate: 60),
          channelProfileType: ChannelProfileType.channelProfileCommunication1v1
      )
  );

// Initialize the Agora Engine
  @override
  void initState() {
    initAgora();
    super.initState();

  }

  void initAgora() async {
    await [Permission.microphone, Permission.camera].request();
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AgoraVideoViewer(
              client: client,
              disabledVideoWidget: Container(child: Text("sas"),),
              layoutType: Layout.oneToOne,

          ),
          AgoraVideoButtons(
              addScreenSharing: true,
              client: client,
              autoHideButtons: true,
            enabledButtons: [
              BuiltInButtons.toggleMic,
              BuiltInButtons.callEnd,
              BuiltInButtons.switchCamera,
              BuiltInButtons.screenSharing,
            ],

          ),
        ],
      )
    );
  }
}
