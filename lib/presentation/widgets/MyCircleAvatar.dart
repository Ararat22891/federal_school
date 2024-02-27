

import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget{

  double? radius;
  double? maxRadius;
  String? networkAsset;
  String? imageAsset;

  MyCircleAvatar({
    this.networkAsset, this.imageAsset, this.radius, this.maxRadius
});


  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage:
      (networkAsset ?? "").isNotEmpty
          ? Image.network(networkAsset!).image
          :
      Image.asset(imageAsset ?? "assets/bird.jpg").image,
      maxRadius: maxRadius,
      radius: radius,
    );
  }

}