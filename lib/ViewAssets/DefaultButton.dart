import 'package:flutter/material.dart';

class DefaultButton extends FilledButton {
  DefaultButton({
    required VoidCallback onPressed,
    required Widget child,
    Color? backgroundColor,
  }) : super(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        child: child,
      ),
      style: ButtonStyle(

          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape:  MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))
          )),
      ),
    );

}
