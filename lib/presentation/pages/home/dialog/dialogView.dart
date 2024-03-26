import 'package:federal_school/domain/models/dialog/dialogModel.dart';
import 'package:federal_school/domain/states/home/chat/dialog/dialogViewModel.dart';
import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/presentation/pages/home/dialog/dialogViewAsset.dart';
import 'package:federal_school/presentation/widgets/GradientContainer.dart';
import 'package:federal_school/presentation/widgets/MyCircleAvatar.dart';
import 'package:federal_school/presentation/widgets/roundedContainer.dart';
import 'package:federal_school/presentation/widgets/verifiedNameViewAsset.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../domain/models/user/user.dart';

class DialogView extends StatefulWidget {

  UserData data;
  DialogView( this.data);

  @override
  State<DialogView> createState() => _DialogViewState();
}

class _DialogViewState extends State<DialogView> {
  DialogViewModel _dialogViewModel = DialogViewModel();

  @override
  void initState() {
    super.initState();
    _dialogViewModel.controller = TextEditingController();
    _dialogViewModel.getMessages(FirebaseAuth.instance.currentUser!.uid, widget.data.userUID);
  }

  @override
  void dispose() {
    _dialogViewModel.controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLight =
        Theme.of(context).brightness == Brightness.light ? true : false;

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
                    MyCircleAvatar(
                      networkAsset: widget.data.photoPath,
                    ),

                    Container(
                      width: 8,
                    ),
                    Flexible(
                      child: VerifiedNameViewAsset(
                        name: widget.data.name == null ? "Неизвестный пользователь" : "${widget.data.surname} ${widget.data.name} ${widget.data.patronomyc}",
                        isVerified: false,
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
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Observer(
                          builder: (context){
                            if(_dialogViewModel.isDataLoaded){
                              return ListView.separated(
                                controller: _dialogViewModel.scrollController,
                                itemCount: _dialogViewModel.dialogs.length,
                                itemBuilder: (context, index) {
                                  return DialoogViewAsset(
                                      dialogModel: _dialogViewModel.dialogs[index]
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return Container(
                                    height: 12,
                                  );
                                },
                              );
                            }
                            else{
                              return Center(
                                child: Text("Напишите первое сообщение!", style: Theme.of(context).textTheme.titleMedium,),
                              );
                            }
                          }
                      )
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
                                  controller: _dialogViewModel.controller,
                                  textCapitalization: TextCapitalization.sentences,
                                  onChanged: _dialogViewModel.onChanged,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.color,
                                    fontWeight: FontWeight.bold
                                  ),
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
                              Observer(builder: (context){
                                return IconButton(onPressed: !_dialogViewModel.isSendable ?
                                null : () {
                                  _dialogViewModel.sendMessage(FirebaseAuth.instance.currentUser!.uid, widget.data.userUID);
                                },
                                    icon: Icon(
                                      Icons.send,
                                      color: Theme.of(context).textTheme.titleMedium!.color,
                                    ));
                              })
                            ],
                          ),
                        )),
                      )
                ],
              ),
            )));
  }
}
