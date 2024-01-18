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

          shape:  MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          )),
        overlayColor: MaterialStateProperty.all(Colors.grey)
      ),
    );

}
