import 'package:federal_school/domain/models/dialog/dialogModel.dart';
import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/presentation/pages/home/dialog/dialogView.dart';
import 'package:flutter/material.dart';

class DialoogViewAsset extends StatelessWidget {
  DialogModel dialogModel;

  DialoogViewAsset({required this.dialogModel});

  @override
  Widget build(BuildContext context) {
    bool isMe = dialogModel.userInfo.userUID == "sasdfdafa" ? true : false;
    bool isLightTheme =
        Theme.of(context).brightness == Brightness.light ? true : false;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        isMe ?  Container() : CircleAvatar(
          backgroundImage: Image.network(dialogModel.userInfo.photoPath).image,
        ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isMe  ? SizedBox() : Text("${dialogModel.userInfo.surname}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                        Wrap(
                          alignment: WrapAlignment.end,
                          crossAxisAlignment: WrapCrossAlignment.end,
                          spacing: 8,
                          children: [
                            Text(dialogModel.message),
                            Text(
                              "${dialogModel.sentTime.hour}:${dialogModel.sentTime.minute}",
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

        isMe ? CircleAvatar(
          backgroundImage: Image.network(dialogModel.userInfo.photoPath).image,
        ) : Container()
      ],
    );
  }
}
