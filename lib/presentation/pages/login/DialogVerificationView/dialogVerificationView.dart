import 'package:federal_school/domain/states/login/loginViewModel.dart';
import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ModalCodeVerificationView/modalCodeVerificationView.dart';

class DialogVerificationView extends StatelessWidget {
  LoginViewModel viewModel;

  DialogVerificationView({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.phone_android, size: 70, color: MyColors.darkbluetext,),
                Icon(Icons.mail_outlined)
              ],
            ),
            FittedBox(
              child: Text("Верификация кода", style: TextStyles.headline,),
            ),
            Container(height: 4,),
            Text("Ваш код будет отправлен на номер ", style: TextStyles.subBody,),
            Text("+79600777466", style: TextStyle(color: MyColors.darkbluetext, fontSize: 14, fontWeight: FontWeight.bold),),

            Container(height: 24,),
            Row(
              children: [
                Spacer(),
                OutlinedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text("Отмена", style: TextStyle(color: MyColors.darkbluetext, fontWeight: FontWeight.bold),),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide( color: MyColors.darkbluetext),
                    )
                ),
                Spacer(),
                FilledButton(
                  onPressed: (){
                    // viewModel.signInWithTelephone();
                    Navigator.of(context).pop();
                    showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => FractionallySizedBox(
                              heightFactor: 0.9,
                              child: ModalCodeVerificationView(
                                viewModel: viewModel,
                              ),
                            )
                        );
                  },
                  child: Text("Отправить", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  style: FilledButton.styleFrom(
                      backgroundColor: MyColors.darkbluetext
                  ),
                ),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
