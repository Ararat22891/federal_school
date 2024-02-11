
import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/presentation/widgets/loadingDialog.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../presentation/widgets/DefaultButton.dart';
import '../../../../presentation/widgets/NumberKeyboardView.dart';

class ModalCodeVerificationView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40,),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          FittedBox(
            child:  Text("Верификация кода", style: TextStyles.headline,),
          ),
          FittedBox(
            child: Text("Мы отправили SMS с кодом проверки на Ваш\n телефон +79600777488", style: TextStyles.subBody, textAlign: TextAlign.center,),
          ),

          Visibility(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: Text("00:20", style: TextStyle(color: MyColors.darkbluetext, fontWeight: FontWeight.bold, fontSize: 14),),
            ),
            visible: true,
          ),
          Spacer(),
          PinCodeTextField(
              appContext: context,
              length: 4,
              focusNode: null,
              mainAxisAlignment: MainAxisAlignment.center,
              keyboardType: TextInputType.number,
            pinTheme: PinTheme(
              borderRadius: BorderRadius.circular(5),
              shape: PinCodeFieldShape.underline,
              inactiveColor: MyColors.darkbluetext,
              fieldOuterPadding: EdgeInsets.symmetric(horizontal: 5),
              activeFillColor: Colors.white,
            ),
          ),
          Spacer(),
          Visibility(
              child: Text("Код недействительный", style: TextStyles.errorBody,),
              visible: false,
          ),
          NumberKeyboardView(),

          Spacer(),
          DefaultButton(
            onPressed: (){
              showDialog(
                  context: context,
                  builder: (context){
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
              onPressed: (){},
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
