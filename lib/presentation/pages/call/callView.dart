import 'package:agora_rtc_engine/agora_rtc_engine.dart';
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
    agoraChannelData: AgoraChannelData(
      channelProfileType: ChannelProfileType.channelProfileCommunication1v1,
      videoEncoderConfiguration: VideoEncoderConfiguration(
          dimensions: VideoDimensions(
              width: 1920,
            height: 1080
          ),
        frameRate: 60
      )
    ),
      agoraConnectionData: AgoraConnectionData(
        appId: "116f18f433de42a9abb0c6d3f2ed5493",
        channelName: widget.channelName,
        username: "tatdep",
      ),
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
              layoutType: Layout.oneToOne,
            renderModeType: RenderModeType.renderModeAdaptive,
          ),
          AgoraVideoButtons(
              client: client,
              autoHideButtons: true,
          ),
        ],
      )
    );
  }
}
