import 'package:federal_school/domain/models/dialog/dialogModel.dart';
import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/presentation/pages/home/dialog/dialogView.dart';
import 'package:federal_school/presentation/widgets/MyCircleAvatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DialoogViewAsset extends StatelessWidget {
  DialogModel dialogModel;

  DialoogViewAsset({required this.dialogModel});

  @override
  Widget build(BuildContext context) {
    bool isMe = dialogModel.senderUID == FirebaseAuth.instance.currentUser!.uid ? true : false;
    String fullName = dialogModel.userInfo?.name == null ?
      "Пользователь" :
        "${dialogModel.userInfo!.surname} ${dialogModel.userInfo!.name} ${dialogModel.userInfo!.patronomyc}";

    bool isLightTheme =
        Theme.of(context).brightness == Brightness.light ? true : false;


    var userPhotoUrl = FirebaseAuth.instance.currentUser!.photoURL;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

        Expanded(
            child: Padding(
          padding: isMe
              ? EdgeInsets.only(right: 10, left: 60, )
              : EdgeInsets.only(right: 60, left: 10, ),
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
                            Text(dialogModel.message),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "${DateFormat.Hm().format(dialogModel.sentTime)}",
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
    );
  }
}
