import 'package:federal_school/domain/states/login/loginViewModel.dart';
import 'package:federal_school/presentation/Colors.dart';
import 'package:flutter/material.dart';
import '../../widgets/DefaultButton.dart';
import '../../widgets/phoneField.dart';
import '../../../textStyles/textStyles.dart';
import 'DialogVerificationView/dialogVerificationView.dart';

class LoginView extends StatelessWidget {
  LoginViewModel viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [MyColors.blue70, MyColors.beige],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/sitting_man.png",
                ),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  Spacer(),
                  Spacer(),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16))),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Spacer(),
                                Text("Войти", style: TextStyles.headline),
                                Spacer()
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Номер телефона",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            PhoneField(
                              viewModel: viewModel,
                            ),
                            Text("Введите номер своего телефона здесь",
                                style: TextStyles.subBody),
                            Visibility(
                              child: Text(
                                  "*Пожалуйста, введите свой номер телефона",
                                  style: TextStyles.errorBody),
                              visible: false,
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            DefaultButton(
                                onPressed: () async {
                                  await showDialog(
                                      context: context,
                                      builder: (_) {
                                        return new DialogVerificationView(
                                          viewModel: viewModel,
                                        );
                                      });
                                },
                                text: "Войти"),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
