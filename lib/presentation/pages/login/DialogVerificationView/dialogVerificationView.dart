import 'package:federal_school/domain/states/login/loginViewModel.dart';
import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
            Observer(
                builder: (context){
                  switch(viewModel.status){
                    case AuthStatus.incorrectNumb:
                      return Icon(Icons.error, size: 70, color: Colors.red,);
                    case AuthStatus.loading:
                      return CircularProgressIndicator();
                    case AuthStatus.networkError:
                      return Icon(Icons.wifi_off, size: 70, color: Colors.red,);
                    case AuthStatus.error:
                      return Icon(Icons.error, size: 70, color: Colors.red,);

                    default:
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(Icons.phone_android, size: 70, color: MyColors.darkbluetext,),
                          Icon(Icons.mail_outlined)
                        ],
                      );
                  }
                }
            ),


            Observer(
                builder: (context){
                  switch(viewModel.status){
                    case AuthStatus.loading:
                      return FittedBox(
                        child: Text("Проверка номера телефона", style: TextStyles.headline,)
                      );
                    case AuthStatus.incorrectNumb:
                      return FittedBox(
                        child: Text("Неккоректный номер", style: TextStyles.headline,),
                      );
                    case AuthStatus.networkError:
                      return FittedBox(
                        child: Text("Отсутсвтует соединение", style: TextStyles.headline,),
                      );
                    default:
                      return FittedBox(
                        child: Text("Верификация кода", style: TextStyles.headline,),
                      );
                  }
                }
            ),
            Container(height: 4,),
            Observer(
                builder: (context){
                  return viewModel.status == AuthStatus.main ?
                  Column(
                    children: [
                      Text("Ваш код будет отправлен на номер ", style: TextStyles.subBody,),
                      Text(viewModel.phoneNumber, style: TextStyle(color: MyColors.darkbluetext, fontSize: 14, fontWeight: FontWeight.bold),),
                      Container(height: 24,),

                    ],
                  ) : Container();
                }
            ),

            Observer(
                builder: (context){
                  switch(viewModel.status){
                    case AuthStatus.loading:
                      return Container();
                    case AuthStatus.main:
                      return Row(
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
                                viewModel.status = AuthStatus.loading;
                                // Navigator.pop(context);
                                // showModalBottomSheet<void>(
                                //     context: context,
                                //     isScrollControlled: true,
                                //     builder: (context) => FractionallySizedBox(
                                //       heightFactor: 0.9,
                                //       child: ModalCodeVerificationView(
                                //         viewModel: viewModel,
                                //       ),
                                //     )
                                // );
                              },
                              child: Text("Отправить", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              style: FilledButton.styleFrom(
                                  backgroundColor: MyColors.darkbluetext
                              )

                          ),
                          Spacer(),
                        ],
                      );
                    default:
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("Назад", style: TextStyle(color: MyColors.darkbluetext, fontWeight: FontWeight.bold),),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide( color: MyColors.darkbluetext),
                              )
                          ),
                        ],
                      );
                  }
                }
            )
          ],
        ),
      ),
    );
  }
}
