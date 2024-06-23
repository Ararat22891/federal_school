import 'package:federal_school/domain/models/dialog/dialogModel.dart';
import 'package:federal_school/domain/states/home/chat/dialog/dialogAssetViewModel.dart';
import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/presentation/pages/home/dialog/dialogView.dart';
import 'package:federal_school/presentation/widgets/MyCircleAvatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../domain/states/home/chat/dialog/dialogViewModel.dart';

class DialoogViewAsset extends StatefulWidget {
  DialogModel dialogModel;
  DialogViewModel viewModel;

  DialoogViewAsset({required this.dialogModel, required this.viewModel,});

  @override
  State<DialoogViewAsset> createState() => _DialoogViewAssetState();
}

class _DialoogViewAssetState extends State<DialoogViewAsset> {

  late DialogAssetViewModel viewModel;

  @override
  void initState() {
    viewModel = DialogAssetViewModel();
    viewModel.menuController = MenuController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isMe = widget.dialogModel.senderUID == FirebaseAuth.instance.currentUser!.uid ? true : false;
    String fullName = widget.dialogModel.userInfo?.name == null ?
      "Пользователь" :
        "${widget.dialogModel.userInfo!.surname} ${widget.dialogModel.userInfo!.name} ${widget.dialogModel.userInfo!.patronomyc}";

    bool isLightTheme =
        Theme.of(context).brightness == Brightness.light ? true : false;


    var userPhotoUrl = FirebaseAuth.instance.currentUser!.photoURL;
    if(widget.dialogModel.readStatus == 0 && !isMe){
      return VisibilityDetector(
          key: Key("sas"),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Expanded(
                  child: Padding(
                    padding: isMe
                        ? EdgeInsets.only(right: 10, left: 60, top: 2, bottom: 2)
                        : EdgeInsets.only(right: 60, left: 10, top: 2, bottom: 2 ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(isMe ? 20 : 0),
                                bottomRight: Radius.circular(isMe ? 0 : 20),
                              ),
                              color: isLightTheme ? MyColors.darkbluetext : MyColors.blue70,
                            ),
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                child:
                                Wrap(
                                  alignment: WrapAlignment.end,
                                  crossAxisAlignment: WrapCrossAlignment.end,
                                  spacing: 8,
                                  children: [
                                    Text(widget.dialogModel.message),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "${DateFormat.Hm().format(widget.dialogModel.sentTime)}",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: isLightTheme ? Colors.grey[700] : MyColors.darkThemeContainer,
                                          ),
                                        ),

                                      ],

                                    ),
                                  ],
                                )
                            )),
                      ],
                    ),
                  )),
              //
              isMe ? MyCircleAvatar(
                networkAsset: userPhotoUrl,
              ) : Container()
            ],
          ),
          onVisibilityChanged: (info) async{
            await widget.viewModel.getReadedMessage(widget.dialogModel, isMe);
          }
      );
    }
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTapDown: (details){
          viewModel.storePosition(details);
        },
        onLongPress: (){
          viewModel.showCustomMenu(context);
        },
        child: MenuAnchor(
          controller: viewModel.menuController,
          menuChildren: [
            isMe? MenuItemButton(
                onPressed: (){
                  viewModel.deleteMessage(widget.dialogModel);
                },
                child: Text("Удалить")
            ) : Container(),
            isMe ? Container() : MenuItemButton(
                onPressed: (){
                  viewModel.complaintMessage(widget.dialogModel, FirebaseAuth.instance.currentUser!.uid);
                },
                child: Text("Пожаловаться")
            ),
          ],
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: Padding(
                    padding: isMe
                        ? EdgeInsets.only(right: 10, left: 60, top: 2, bottom: 2)
                        : EdgeInsets.only(right: 60, left: 10, top: 2, bottom: 2 ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(isMe ? 20 : 0),
                                bottomRight: Radius.circular(isMe ? 0 : 20),
                              ),
                              color: isLightTheme ? MyColors.darkbluetext : MyColors.blue70,
                            ),
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                child:
                                Wrap(
                                  alignment: WrapAlignment.end,
                                  crossAxisAlignment: WrapCrossAlignment.end,
                                  spacing: 8,
                                  children: [
                                    Text(widget.dialogModel.message),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "${DateFormat.Hm().format(widget.dialogModel.sentTime)}",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: isLightTheme ? Colors.grey[700] : MyColors.darkThemeContainer,
                                          ),
                                        ),

                                      ],

                                    ),
                                  ],
                                )
                            )),
                      ],
                    ),
                  )),
              //
              isMe ? MyCircleAvatar(
                networkAsset: userPhotoUrl,
              ) : Container()
            ],
          ),
        )
      ),
    );
  }

  Widget messageIcon(int readStatus){
    if(readStatus == 0){
      return Icon(Icons.done);
    }
    else if(readStatus == 1){
      return Icon(Icons.done_all);
    }
    return Icon(Icons.error, color: Colors.red,);
  }
}
