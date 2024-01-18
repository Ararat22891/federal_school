
import 'package:flutter/material.dart';

class OrLineView extends StatelessWidget {
  const OrLineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(height: 1, color: Colors.grey, ),
        Container(
            color: Colors.grey[900],
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text("ИЛИ", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),)
        ),
      ],
    );
  }
}
