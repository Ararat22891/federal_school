
import 'package:agora_uikit/agora_uikit.dart';
import 'package:federal_school/domain/states/login/loginViewModel.dart';
import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/presentation/pages/home/homeView.dart';
import 'package:federal_school/presentation/widgets/statusDialog.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../presentation/widgets/DefaultButton.dart';
import '../../../../presentation/widgets/NumberKeyboardView.dart';

class ModalCodeVerificationView extends StatefulWidget {
  LoginViewModel viewModel;

  ModalCodeVerificationView({required this.viewModel});

  @override
  State<ModalCodeVerificationView> createState() => _ModalCodeVerificationViewState();
}

class _ModalCodeVerificationViewState extends State<ModalCodeVerificationView> {


  @override
  void initState() {
    widget.viewModel.pinEditingController = TextEditingController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40,),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(
            width: 50,
            child: Divider(thickness: 3,),
          ),
          Spacer(),
          FittedBox(
            child:  Text("Верификация кода", style: TextStyles.headline,),
          ),
          FittedBox(
            child: Text("Мы отправили SMS с кодом проверки на Ваш\n телефон ${widget.viewModel.phoneNumber}", style: TextStyles.subBody, textAlign: TextAlign.center,),
          ),

          Observer(
              builder: (context){
                return Visibility(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Text("Повторная отправка доступна через: "+widget.viewModel.time.toString(), style: TextStyle(color: MyColors.darkbluetext, fontWeight: FontWeight.bold, fontSize: 14),)
                  ),
                  visible: widget.viewModel.time == 0 ? false : true,
                );
              }
          ),
          Spacer(),
          Observer(
              builder: (context) => PinCodeTextField(
                appContext: context,
                length: 6,
                controller: widget.viewModel.pinEditingController,
                readOnly: true,
                textStyle: TextStyle(color: MyColors.darkbluetext),
                mainAxisAlignment: MainAxisAlignment.center,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  borderRadius: BorderRadius.circular(5),
                  shape: PinCodeFieldShape.underline,
                  inactiveColor: widget.viewModel.status == AuthStatus.wrongCode ? MyColors.darkbluetext : Colors.red,
                  fieldOuterPadding: EdgeInsets.symmetric(horizontal: 5),
                  activeFillColor: Colors.white,
                ),
              ),
          ),
          Spacer(),
          Visibility(
              child: Text("Код недействительный", style: TextStyles.errorBody,),
              visible: widget.viewModel.status == AuthStatus.wrongCode ? true : false,
          ),
          NumberKeyboardView(
            viewModel: widget.viewModel,
          ),

          Spacer(),
          DefaultButton(
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    widget.viewModel.checkOTP();
                    return Observer(
                        builder: (context) {
                          switch(widget.viewModel.status){
                            case AuthStatus.validCode:
                              return StatusDialog(
                                status: AuthStatus.validCode,
                                isEnabled: widget.viewModel.isBlocked,
                              );
                            case AuthStatus.invalidCode:
                              return StatusDialog(
                                status: AuthStatus.invalidCode,
                              );
                            case AuthStatus.loading:
                              return StatusDialog(
                                status: AuthStatus.loading,
                              );
                            case AuthStatus.networkError:
                              return StatusDialog(
                                status: AuthStatus.networkError,
                              );
                            default:
                            return StatusDialog(
                              status: AuthStatus.wrongCode,
                            );
                          }
                        }
                    );


                  }
              );
            },
            text: "Отправить",
          ),

          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12)
            ),
            child: Observer(
              builder: (context){
                return FilledButton(
                  onPressed: widget.viewModel.time == 0 ? (){
                    widget.viewModel.signInWithTelephone();

                  } : null,
                  child: Text("Отправить новый код", style: TextStyle(color: MyColors.darkbluetext, fontSize: 18),),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)
                        ),
                        side: BorderSide(color: MyColors.darkbluetext, width: 3)
                    ),
                  ),
                );
              },
            )
          ),
          Spacer(),
          Spacer(),


        ],
      ),
    );
  }
}
