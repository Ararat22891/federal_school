import 'package:federal_school/domain/models/contact/contactModel.dart';
import 'package:flutter/material.dart';

import '../../../Colors.dart';

class ContactViewAsset extends StatelessWidget {
  ContactModel contact;

  ContactViewAsset({required this.contact});

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light ? true : false;

    return Material(
      color: Colors.transparent,
      child: InkWell(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      // foregroundImage: Image.network(contact.imageUrl).image,
                      backgroundImage: Image.asset("assets/bird.jpg").image,
                      radius: 30,
                    ),
                    Container(width: 12,),


                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(contact.name, style: TextStyle(color: isLight ? MyColors.darkbluetext :MyColors.darkThemeFont, fontSize: 16, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,),
                        Container(height: 2,),
                        // Text(contact.phoneNumber, style: TextStyle(color:  isLight ? MyColors.darkbluetext :MyColors.darkThemeFont, fontSize: 14, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                    ),

                  ],
                ),
              ),
            )
    );
  }
}
