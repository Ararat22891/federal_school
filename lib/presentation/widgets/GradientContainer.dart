import 'package:flutter/material.dart';

import '../Colors.dart';

class GradientContainer extends StatelessWidget {
  Widget child;


  GradientContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: Theme.of(context).brightness == Brightness.light  ?
        LinearGradient(
          colors: [MyColors.blue70, MyColors.beige],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ) :
          LinearGradient(
            colors: [MyColors.darkThemeMain, MyColors.darkThemeSecondary],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
      ),
    );
  }
}
