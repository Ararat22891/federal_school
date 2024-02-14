import 'package:federal_school/domain/states/login/loginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

import '../Colors.dart';

enum CountryPrefix {
  arm("+374", "Армения"),
  azb("+994", "Азербайджан"),
  bel("+375", "Беларусь"),
  mol("+373", "Молдова"),
  rus("+7", "Россия"),
  ukr("+380", "Украина");

  const CountryPrefix(this.prefixNum, this.countryName);

  final String prefixNum;
  final String countryName;
}

class PhoneField extends StatelessWidget {

  PhoneField({required this.viewModel});

  LoginViewModel viewModel;

  var _maskFormatter = new MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: { "#": RegExp(r'[0-9]') },
      type: MaskAutoCompletionType.lazy
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child:
          TextField(
              keyboardType: TextInputType.phone,
              onChanged: (String text){
                viewModel.phoneNumber = _maskFormatter.getUnmaskedText();
                print(viewModel.phoneNumber);
              },
              style: TextStyle(color: MyColors.darkbluetext, fontWeight: FontWeight.bold, fontSize: 16),
              inputFormatters: [
                _maskFormatter
              ],
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: "+7 (###) ###-##-##",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                      color: MyColors.darkbluetext, width: 3.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      const BorderSide(color: MyColors.darkbluetext, width: 3),
                ),
              ),
      ),
    );
  }
}
