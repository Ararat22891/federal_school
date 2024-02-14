
import 'package:federal_school/domain/states/login/loginViewModel.dart';
import 'package:federal_school/presentation/Colors.dart';
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
                    addValuePin("1");
                  },
                  child: Text("1", style: _keyboardStyle,)
              ),

              TextButton(
                  onPressed: (){
                    addValuePin("2");
                  },
                  child: Text("2", style: _keyboardStyle,)
              ),


              TextButton(
                  onPressed: (){
                    addValuePin("3");
                  },
                  child: Text("3", style: _keyboardStyle,)
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              TextButton(
                  onPressed: (){
                    addValuePin("4");
                  },
                  child: Text("4", style: _keyboardStyle,)
              ),


              TextButton(
                  onPressed: (){
                    addValuePin("5");
                  },
                  child: Text("5", style: _keyboardStyle,)
              ),


              TextButton(
                  onPressed: (){
                    addValuePin("6");
                  },
                  child: Text("6", style: _keyboardStyle,)
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              TextButton(
                  onPressed: (){
                    addValuePin("7");
                  },
                  child: Text("7", style: _keyboardStyle,)
              ),


              TextButton(
                  onPressed: (){
                    addValuePin("8");
                  },
                  child: Text("8", style: _keyboardStyle,)
              ),


              TextButton(
                  onPressed: (){
                    addValuePin("9");
                  },
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
                  onPressed: (){
                    addValuePin("0");
                  },
                  child: Text("0", style: _keyboardStyle, )
              ),


              TextButton(
                onPressed: (){
                  if(viewModel.pinEditingController.text.isNotEmpty){
                    viewModel.pinEditingController.text = viewModel.pinEditingController.text.substring(0, viewModel.pinEditingController.text.length-1);
                  }
                },
                child: Icon(Icons.backspace_rounded, color: MyColors.darkbluetext,),
              ),
            ],
          )
        ],
      ),
    );
  }

  void addValuePin(String char){
    if(viewModel.pinEditingController.text.length <6){
      viewModel.pinEditingController.text = "${viewModel.pinEditingController.text}$char";
    }
  }

}
