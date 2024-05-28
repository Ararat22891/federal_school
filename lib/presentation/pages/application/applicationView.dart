import 'package:federal_school/presentation/widgets/DefaultButton.dart';
import 'package:federal_school/presentation/widgets/GradientContainer.dart';
import 'package:federal_school/presentation/widgets/roundedContainer.dart';
import 'package:flutter/material.dart';

class ApplicationView extends StatelessWidget {



  var text = 'Наша школа - это не просто учебное заведение, это часть движения, которое стремится к новой России. "Яблоко России" - это образовательное учреждение, вдохновленное идеями и ценностями партии "Яблоко", активно работающей в России.Мы верим в силу знания, творчества и демократии. Наша цель - обучить и вдохновить новое поколение лидеров, способных привнести позитивные изменения в наше общество. Мы стремимся к тому, чтобы каждый наш выпускник не только обладал высоким уровнем образования, но и был готов к активному участию в формировании будущего России.Для того чтобы стать частью "Яблока России" и вступить в ряды партии "Яблоко", мы приглашаем вас подать заявку, включающую небольшое сочинение на тему новой России. Делитесь своими идеями, видением и стремлениями. Давайте вместе творить будущее нашей страны!Присоединяйтесь к нам сегодня и станьте частью движения к лучшему будущему для всех нас.';

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Добро пожаловать в ФПШ',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  TextField(
                    // controller: _nameController,
                    expands: false,
                    maxLines: 5,
                    minLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Ваше мотивирующее письмо',
                    ),
                  ),
                  Spacer(),

                  Container(
                    width: double.infinity,
                    child: DefaultButton(
                        onPressed: (){},
                        text: "Отправить заявку"

                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
