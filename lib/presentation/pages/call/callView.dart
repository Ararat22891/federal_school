
import 'package:agora_uikit/agora_uikit.dart';
import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/presentation/widgets/roundedContainer.dart';
import 'package:flutter/material.dart';


class CallView extends StatefulWidget {


  @override
  State<CallView> createState() => _CallViewState();
}

class _CallViewState extends State<CallView> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "116f18f433de42a9abb0c6d3f2ed5493",
      channelName: "test",
    ),
  );

// Initialize the Agora Engine
  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await [Permission.microphone, Permission.microphone].request();
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
