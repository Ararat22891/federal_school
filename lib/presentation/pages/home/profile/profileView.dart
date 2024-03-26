import 'package:federal_school/domain/states/home/homeViewModel.dart';
import 'package:federal_school/domain/states/home/profile/profileViewModel.dart';
import 'package:federal_school/presentation/widgets/GradientContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import '../../../../domain/models/user/user.dart';
import '../../../Colors.dart';

class MyProfileView extends StatefulWidget {
  HomeViewModel viewModel;

  MyProfileView({ required this.viewModel});

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  ProfileViewModel profileViewModel = ProfileViewModel();


  @override
  void initState() {
    profileViewModel.controller = TextEditingController(text: profileViewModel.fullName);
    super.initState();
  }

  @override
  void dispose() {
    profileViewModel.controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var isLightTheme =
        Theme.of(context).brightness == Brightness.light ? true : false;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Material(
              color: isLightTheme ? MyColors.white : MyColors.darkThemeContainer,
              child: GradientContainer(
                boxRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft:  Radius.circular(25)),
                child: Column(

                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      centerTitle: true,
                      foregroundColor: Colors.white,
                      actions: [
                        IconButton(onPressed: () {
                          if(profileViewModel.isEdit){
                            if(profileViewModel.formKey.currentState!.validate()){
                              profileViewModel.saveData(profileViewModel.user!);
                              profileViewModel.isEdit = !profileViewModel.isEdit;
                            }
                          }
                          else{
                            profileViewModel.isEdit = !profileViewModel.isEdit;
                          }
                        },
                            icon: Observer(
                                builder: (context) =>
                                    Icon(profileViewModel.isEdit ? Icons.done : Icons.edit))
                        )
                      ],
                      title: Text(
                        "Профиль",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      child: Stack(
                        children: [
                          Observer(builder: (context){
                            return CircleAvatar(
                              backgroundImage: (widget.viewModel.userData?.photoPath ?? "").isNotEmpty
                                  ? Image.network(widget.viewModel.userData!.photoPath!).image
                                  : Image.asset("assets/bird.jpg").image,
                              maxRadius: MediaQuery.of(context).size.height/ 6.5,
                            );
                          }),
                          Positioned(
                              bottom: 0,
                              right: 20,
                              child: Icon(Icons.add_circle, color: Colors.white, size: 40,)
                          )
                        ],
                      ),
                      onTap: (){
                        profileViewModel.uploadProfile();
                        },
                    ),

                    Spacer(),
                    Spacer(),

                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              color: isLightTheme ? MyColors.white : MyColors.darkThemeContainer,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                  ),
                  Text(
                    "ФИО",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Form(
                    key: profileViewModel.formKey,
                    child: Observer(
                      builder: (context) =>
                          TextFormField(
                            controller: profileViewModel.controller,
                            style: Theme.of(context).textTheme.titleMedium,
                            readOnly: !profileViewModel.isEdit,
                            enabled: profileViewModel.isEdit,
                            validator: profileViewModel.validateFIO,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "Введите ФИО",
                              contentPadding: EdgeInsets.symmetric(horizontal: 6),
                            ),
                          ),
                    ),
                  ),

                  Container(
                    height: 12,
                  ),
                  Text(
                    "Номер телефона",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  TextFormField(
                    initialValue:profileViewModel.user!.phoneNumber,
                    style: Theme.of(context).textTheme.titleMedium,
                    enabled: false,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 6),
                    ),
                  ),
                  Container(
                    height: 12,
                  ),
                  Text(
                    "Статус",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  TextFormField(
                    initialValue: widget.viewModel.role,
                    style: Theme.of(context).textTheme.titleMedium,
                    enabled: false,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 6),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
