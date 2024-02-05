import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';

import '../Colors.dart';

class DefaultButton extends FilledButton {
  DefaultButton({
    required VoidCallback onPressed,
    required String text,
    Color? backgroundColor,
  }) : super(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text( text,
            style: TextStyles.loginButton,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyColors.darkbluetext),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))
          ))
      ),
    );

}
