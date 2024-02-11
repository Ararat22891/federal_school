
import 'package:flutter/material.dart';

import '../Colors.dart';

enum CountryPrefix{
  arm("+374", "Армения"),
  azb("+994", "Азербайджан"),
  bel("+375", "Беларусь"),
  mol("+373", "Молдова"),
  rus("+7", "Россия"),
  ukr("+380", "Украина");

  const CountryPrefix(this.prefixNum, this.countryName);
  final String prefixNum;
  final String countryName;
}

class PhoneField extends StatelessWidget {
  const PhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              color: MyColors.darkbluetext,
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButton<CountryPrefix>(
              style: TextStyle(color: MyColors.darkbluetext, fontSize: 14, fontWeight: FontWeight.bold),
              items: CountryPrefix.values
                  .map<DropdownMenuItem<CountryPrefix>>((country){
                return DropdownMenuItem<CountryPrefix>(
                    value: country,
                    child: Text(country.prefixNum.toString(),)
                );
              }).toList(),
              onChanged: (country){},
              selectedItemBuilder: (context) => CountryPrefix.values.map(
                      (e) => Container(
                        alignment: Alignment.center,
                        child: Text(e.prefixNum, style: TextStyle(fontSize: 14 ,color: Colors.white, fontWeight: FontWeight.bold),),
                      )
              ).toList(),
              elevation: 0,
              value: CountryPrefix.arm,
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(12),
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.white,),
              underline: Container(),
              padding: EdgeInsets.symmetric(horizontal: 3),
            ),
          ),
          SizedBox(width: 4,),

          Expanded(
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: "Ваш номер",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: MyColors.darkbluetext, width: 3.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: MyColors.darkbluetext, width: 3),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
