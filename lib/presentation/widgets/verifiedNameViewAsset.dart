

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifiedNameViewAsset extends StatelessWidget {
  
  String name;
  bool isVerified;
  
  VerifiedNameViewAsset({required this.name, required this.isVerified});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(name, style: Theme.of(context).textTheme.titleMedium,),
        Container(width: 6,),
        isVerified ? Icon(CupertinoIcons.checkmark_seal_fill, color: Colors.blue,) : Container(),


      ],
    );
  }
}
