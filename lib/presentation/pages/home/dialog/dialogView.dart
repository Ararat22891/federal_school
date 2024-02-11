import 'package:federal_school/domain/models/dialog/dialogModel.dart';
import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/presentation/pages/home/dialog/dialogViewAsset.dart';
import 'package:federal_school/presentation/widgets/GradientContainer.dart';
import 'package:federal_school/presentation/widgets/roundedContainer.dart';
import 'package:federal_school/presentation/widgets/verifiedNameViewAsset.dart';
import 'package:flutter/material.dart';

class DialogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLight =
        Theme.of(context).brightness == Brightness.light ? true : false;

    DialogModel.dialogs.sort((a, b) => a.sentTime.compareTo(b.sentTime));
    return GradientContainer(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              titleSpacing: 0,
              title: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: Image.network(
                              "https://www.yavlinsky.ru/wp-content/uploads/2019/06/yavlinsky-nemcov-e1661081340605.jpg")
                          .image,
                      foregroundImage: Image.asset("assets/bird.jpg").image,
                      radius: 20,
                    ),
                    Container(
                      width: 8,
                    ),
                    Flexible(
                      child: VerifiedNameViewAsset(
                        name: "Григорий Явлинский",
                        isVerified: true,
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.call,
                      color: Colors.white,
                    ))
              ],
            ),
            body: RoundedContainer(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.separated(
                        itemCount: DialogModel.dialogs.length,
                        itemBuilder: (context, index) {
                          return DialoogViewAsset(
                              dialogModel: DialogModel.dialogs[index]
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 12,
                          );
                        },
                      ),
                    ),
                  ),
                  SafeArea(
                      child: Container(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              IconButton.filled(
                                onPressed: () {},
                                style: IconButton.styleFrom(
                                    backgroundColor: isLight
                                        ? MyColors.darkbluetext
                                        : MyColors.darkThemeFont),
                                icon: Icon(
                                  Icons.attach_file,
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: TextField(
                                  cursorColor: Colors.green,
                                  textCapitalization: TextCapitalization.sentences,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.color),
                                  autofocus: false,
                                  decoration: const InputDecoration.collapsed(
                                    hintText: 'Напишите сообщение...',
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              IconButton(onPressed: () {}, icon: Icon(Icons.send)),
                            ],
                          ),
                        )),
                      )
                ],
              ),
            )));
  }
}
