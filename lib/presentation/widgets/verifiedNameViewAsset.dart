

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifiedNameViewAsset extends StatelessWidget {
  
  String name;
  TextStyle? textStyle;
  bool isVerified;
  
  VerifiedNameViewAsset({required this.name, required this.isVerified, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Flexible(
          child:  Text(name, style: textStyle ?? Theme.of(context).textTheme.titleMedium, overflow: TextOverflow.ellipsis,),
        ),
        Container(width: 8,),

        isVerified ?
        Icon(CupertinoIcons.checkmark_seal_fill, color: Colors.blue)
            : Container(),


      ],
    );
  }
}
