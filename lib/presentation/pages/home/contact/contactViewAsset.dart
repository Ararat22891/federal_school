import 'package:federal_school/domain/models/contact/contactModel.dart';
import 'package:federal_school/presentation/pages/home/profile/otherProfileView.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/user/user.dart';
import '../../../Colors.dart';

class ContactViewAsset extends StatelessWidget {
  UserData contact;

  ContactViewAsset({required this.contact});

  @override
  Widget build(BuildContext context) {
    bool isLight = Theme.of(context).brightness == Brightness.light ? true : false;
    String fullName = contact.name == null ? "Неизвестный пользователь"  : "${contact.surname} ${contact.name} ${contact.patronomyc}";
    return Material(
      color: Colors.transparent,
      child: InkWell(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context){
                          return OtherProfileView(contact);
                        }
                    )
                );
              },
              child: Container(
                padding: EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                      CircleAvatar(
                      backgroundImage: (contact.photoPath ?? "").isNotEmpty
                          ? Image.network(contact.photoPath!).image
                          : Image.asset("assets/bird.jpg").image,
                      maxRadius: 30,
                    ),

                    Container(width: 12,),


                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(fullName, style: TextStyle(color: isLight ? MyColors.darkbluetext :MyColors.darkThemeFont, fontSize: 16, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,),
                        Container(height: 2,),
                        Text(contact.telNumber, style: TextStyle(color:  isLight ? MyColors.darkbluetext :MyColors.darkThemeFont, fontSize: 14, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
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
