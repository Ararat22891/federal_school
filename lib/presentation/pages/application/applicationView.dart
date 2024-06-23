import 'package:federal_school/domain/states/aplication/aplicationViewModel.dart';
import 'package:federal_school/presentation/widgets/DefaultButton.dart';
import 'package:federal_school/presentation/widgets/GradientContainer.dart';
import 'package:federal_school/presentation/widgets/roundedContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ApplicationView extends StatefulWidget {
  @override
  State<ApplicationView> createState() => _ApplicationViewState();
}

class _ApplicationViewState extends State<ApplicationView> {
  var text = 'Наша школа - это не просто учебное заведение, это часть движения, которое стремится к новой России. "Яблоко России" - это образовательное учреждение, вдохновленное идеями и ценностями партии "Яблоко", активно работающей в России.Мы верим в силу знания, творчества и демократии. Наша цель - обучить и вдохновить новое поколение лидеров, способных привнести позитивные изменения в наше общество. Мы стремимся к тому, чтобы каждый наш выпускник не только обладал высоким уровнем образования, но и был готов к активному участию в формировании будущего России.Для того чтобы стать частью "Яблока России" и вступить в ряды партии "Яблоко", мы приглашаем вас подать заявку, включающую небольшое сочинение на тему новой России. Делитесь своими идеями, видением и стремлениями. Давайте вместе творить будущее нашей страны!Присоединяйтесь к нам сегодня и станьте частью движения к лучшему будущему для всех нас.';
  late AplicationViewModel aplicationViewModel;
  @override
  void initState() {
     aplicationViewModel = AplicationViewModel();
     aplicationViewModel.textEditingController = TextEditingController();
     aplicationViewModel.getStatus();
    super.initState();
  }

  @override
  void dispose() {
    aplicationViewModel.textEditingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GradientContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            centerTitle: false,
            title: Text(
              "Заявка на участие",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),

          body: RoundedContainer(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Observer(
                  builder: (context){
                    if(aplicationViewModel.status == Status.empty){
                      return CustomScrollView(
                        slivers: [
                          SliverList.list(children: [
                            Text(
                              'Добро пожаловать в ФПШ',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              text,
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            SizedBox(height: 20.0),


                            TextField(
                              style: Theme.of(context).textTheme.titleMedium,
                              controller: aplicationViewModel.textEditingController,
                              expands: false,
                              maxLines: 5,
                              minLines: 3,
                              decoration: InputDecoration(
                                  hintText: 'Ваше мотивирующее письмо',
                                  border: OutlineInputBorder()
                              ),
                            ),

                            SizedBox(height: 15.0),


                            Container(
                              width: double.infinity,
                              child: DefaultButton(
                                  onPressed: () async{
                                    if (aplicationViewModel.textEditingController.text.isNotEmpty) {
                                      await aplicationViewModel
                                          .createPetition();
                                    }
                                    else{
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Введите письмо")));
                                    }
                                  },
                                  text: "Отправить заявку"

                              ),
                            )
                          ]
                          )
                        ],
                      );
                    }
                    else if (aplicationViewModel.status == Status.get){
                      return CustomScrollView(
                        slivers: [
                          SliverList.list(children: [
                            Text(
                              'Добро пожаловать в ФПШ',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              "Ваша заявка отправлена. Ожидайте модерации",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            SizedBox(height: 20.0),

                          ]
                          )
                        ],
                      );
                    }
                    else if(aplicationViewModel.status == Status.loading){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    else{
                      return CustomScrollView(
                        slivers: [
                          SliverList.list(children: [
                            Text(
                              'Произошла ошибка, повторите позже',
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            SizedBox(height: 20.0),
                            Icon(Icons.error, color: Colors.red, size: 30,),
                            SizedBox(height: 20.0),

                          ]
                          )
                        ],
                      );
                    }
                  }
              )
            )
          ),
        ),
    );
  }
}
