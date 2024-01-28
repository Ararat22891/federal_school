
import 'package:federal_school/Colors.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';

class NumberKeyboardView extends StatelessWidget {
   NumberKeyboardView({super.key});

  TextStyle _keyboardStyle = TextStyle(color: MyColors.darkbluetext, fontWeight: FontWeight.bold, fontSize: 30);

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
                  child: Text("1", style: _keyboardStyle,)
              ),

              TextButton(
                  onPressed: (){},
                  child: Text("2", style: _keyboardStyle,)
              ),


              TextButton(
                  onPressed: (){},
                  child: Text("3", style: _keyboardStyle,)
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              TextButton(
                  onPressed: (){},
                  child: Text("4", style: _keyboardStyle,)
              ),


              TextButton(
                  onPressed: (){},
                  child: Text("5", style: _keyboardStyle,)
              ),


              TextButton(
                  onPressed: (){},
                  child: Text("6", style: _keyboardStyle,)
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              TextButton(
                  onPressed: (){},
                  child: Text("7", style: _keyboardStyle,)
              ),


              TextButton(
                  onPressed: (){},
                  child: Text("8", style: _keyboardStyle,)
              ),


              TextButton(
                  onPressed: (){},
                  child: Text("9", style: _keyboardStyle,)
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: null,
                  child: Text("", style: _keyboardStyle,)
              ),

              TextButton(
                  onPressed: (){},
                  child: Text("0", style: _keyboardStyle, )
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
