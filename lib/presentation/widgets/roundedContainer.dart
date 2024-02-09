
import 'package:flutter/material.dart';

import '../Colors.dart';

class RoundedContainer extends StatelessWidget {

  Widget? child;
  EdgeInsets? padding;

  RoundedContainer({ this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light ? true : false;
    return Container(
      padding: padding ?? EdgeInsets.only(top: 18),
      decoration: BoxDecoration(
          color: isLightTheme
              ? MyColors.white
              : MyColors.darkThemeContainer,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30))),
      child: child ??  Container(),
    );
  }
}
