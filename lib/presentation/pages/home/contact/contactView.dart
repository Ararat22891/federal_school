import 'package:federal_school/domain/states/home/contact/contactViewModel.dart';
import 'package:federal_school/presentation/pages/home/contact/contactViewAsset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContactView extends StatefulWidget {
  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  ContactViewModel viewModel = ContactViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (viewModel.isLoaded) {
        return ListView.separated(
          itemCount: viewModel.contacts!.length,
          itemBuilder: (context, index) {
            return ContactViewAsset(
              contact: viewModel.contacts![index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 0.2,
              child: Divider(),
            );
          },
        );
      } else {
        return Container();
      }
    });
  }
}
