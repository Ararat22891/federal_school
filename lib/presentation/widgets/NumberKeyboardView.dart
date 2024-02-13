
import 'package:federal_school/domain/states/login/loginViewModel.dart';
import 'package:federal_school/presentation/Colors.dart';
import 'package:federal_school/textStyles/textStyles.dart';
import 'package:flutter/material.dart';

class NumberKeyboardView extends StatelessWidget {

  LoginViewModel viewModel;

  NumberKeyboardView({required this.viewModel});
  TextStyle _keyboardStyle = TextStyle(color: MyColors.darkbluetext, fontWeight: FontWeight.bold, fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: (){
                    viewModel.pinEditingController.text = "6";
                    viewModel.verificaionCode = "${viewModel.verificaionCode}1";
                  },
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
