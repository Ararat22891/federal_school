import 'package:federal_school/domain/models/contact/contactModel.dart';
import 'package:federal_school/presentation/pages/home/contact/contactViewAsset.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
        itemBuilder: (context, index){
          return ContactViewAsset(
            contact: ContactModel.contacts[index],
          );
        },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 0.2,
          child: Divider(),
        );
      },
    );
  }
}
