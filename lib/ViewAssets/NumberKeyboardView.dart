
import 'package:federal_school/Colors.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';

class NumberKeyboardView extends StatelessWidget {
  const NumberKeyboardView({super.key});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: (){},
                  child: Text("1", style: TextStyles.headline2,)
              ),

              TextButton(
                  onPressed: (){},
                  child: Text("2", style: TextStyles.headline2,)
              ),


              TextButton(
                  onPressed: (){},
                  child: Text("3", style: TextStyles.headline2,)
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              TextButton(
                  onPressed: (){},
                  child: Text("4", style: TextStyles.headline2,)
              ),


              TextButton(
                  onPressed: (){},
                  child: Text("5", style: TextStyles.headline2,)
              ),


              TextButton(
                  onPressed: (){},
                  child: Text("6", style: TextStyles.headline2,)
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              TextButton(
                  onPressed: (){},
                  child: Text("7", style: TextStyles.headline2,)
              ),


              TextButton(
                  onPressed: (){},
                  child: Text("8", style: TextStyles.headline2,)
              ),


              TextButton(
                  onPressed: (){},
                  child: Text("9", style: TextStyles.headline2,)
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: null,
                  child: Text("", style: TextStyles.headline2,)
              ),

              TextButton(
                  onPressed: (){},
                  child: Text("0", style: TextStyles.headline2,)
              ),


              TextButton(
                onPressed: (){},
                child: Icon(Icons.backspace_rounded, color: MyColors.darkbluetext,),
              ),
            ],
          )
        ],
      ),
    );
  }
}
