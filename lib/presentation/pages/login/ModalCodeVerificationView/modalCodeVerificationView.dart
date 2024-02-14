
import 'package:federal_school/domain/states/login/loginViewModel.dart';
import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/presentation/widgets/loadingDialog.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../presentation/widgets/DefaultButton.dart';
import '../../../../presentation/widgets/NumberKeyboardView.dart';

class ModalCodeVerificationView extends StatelessWidget {
  LoginViewModel viewModel;

  ModalCodeVerificationView({required this.viewModel});

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
            child: Text("Мы отправили SMS с кодом проверки на Ваш\n телефон ${viewModel.phoneNumber}", style: TextStyles.subBody, textAlign: TextAlign.center,),
          ),

          Visibility(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: Text("00:20", style: TextStyle(color: MyColors.darkbluetext, fontWeight: FontWeight.bold, fontSize: 14),),
            ),
            visible: true,
          ),
          Spacer(),
          Observer(
              builder: (context) => PinCodeTextField(
                appContext: context,
                length: 6,
                controller: viewModel.pinEditingController,
                focusNode: null,
                readOnly: true,
                textStyle: TextStyle(color: MyColors.darkbluetext),
                mainAxisAlignment: MainAxisAlignment.center,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  borderRadius: BorderRadius.circular(5),
                  shape: PinCodeFieldShape.underline,
                  inactiveColor: viewModel.isCodeVerified ? MyColors.darkbluetext : Colors.red,
                  disabledColor: viewModel.isCodeVerified ? MyColors.darkbluetext : Colors.red,
                  fieldOuterPadding: EdgeInsets.symmetric(horizontal: 5),
                  activeFillColor: Colors.white,
                ),
              ),
          ),
          Spacer(),
          Visibility(
              child: Text("Код недействительный", style: TextStyles.errorBody,),
              visible: false,
          ),
          NumberKeyboardView(
            viewModel: viewModel,
          ),

          Spacer(),
          DefaultButton(
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) {
                    viewModel.checkOTP();
                    return LoadingDialog();
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
            child: FilledButton(
              onPressed: (){
              },
              child: Text("Отправить новый код", style: TextStyle(color: MyColors.darkbluetext, fontSize: 18),),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white12),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)
                      ),
                    side: BorderSide(color: MyColors.darkbluetext, width: 3)
                  ))
              ),
            ),
          ),
          Spacer(),
          Spacer(),


        ],
      ),
    );
  }
}
