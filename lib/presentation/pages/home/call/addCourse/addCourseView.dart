import 'package:federal_school/domain/states/home/course/addCourseViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../../../../../domain/models/course/CourseModel.dart';

class AddCourseView extends StatefulWidget {


  CourseModel? courseModel;

  AddCourseView(){}

  AddCourseView.create({
    required this.courseModel,

  });

  @override
  State<AddCourseView> createState() => _AddCourseViewState();
}

class _AddCourseViewState extends State<AddCourseView> {

  AddCourseViewModel addCourseViewModel = AddCourseViewModel();

  @override
  void initState() {
    addCourseViewModel.themeController = TextEditingController(text: widget.courseModel?.theme);
    addCourseViewModel.urlController = TextEditingController(text: widget.courseModel?.videoUrl);
    addCourseViewModel.descriptionController = TextEditingController(text: widget.courseModel?.description);
    addCourseViewModel.nameCourseController = TextEditingController(text: widget.courseModel?.name);

    var selected = widget.courseModel?.availableTo ?? null;
    var time = selected == null ? "" : DateFormat.yMMMMd("ru_RU").format(selected);
    addCourseViewModel.selectedDate = selected;
    addCourseViewModel.dateController = TextEditingController(text: time);
    addCourseViewModel.imageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    addCourseViewModel.themeController.dispose();
    addCourseViewModel.urlController.dispose();
    addCourseViewModel.descriptionController.dispose();
    addCourseViewModel.nameCourseController.dispose();
    addCourseViewModel.dateController.dispose();
    addCourseViewModel.imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(16),
      child: Observer(
        builder: (context){
          return Padding(
              padding: EdgeInsets.all(20),
              child: !addCourseViewModel.isLoadingData ?
              Form(
                key: addCourseViewModel.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Добавление курса", style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 26),),
                      Container(height: 20,),
                      TextFormField(
                        style: Theme.of(context).textTheme.labelLarge,
                        validator: addCourseViewModel.validate,
                        controller: addCourseViewModel.themeController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Тема курса",
                            prefixIcon: Icon(Icons.title)
                        ),
                      ),

                      Container(height: 12,),

                      TextFormField(
                        style: Theme.of(context).textTheme.labelLarge,
                        validator: addCourseViewModel.validate,
                        controller: addCourseViewModel.nameCourseController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.text_snippet),
                          hintText: "Название курса",
                        ),
                      ),

                      Container(height: 12,),
                      TextFormField(
                        style: Theme.of(context).textTheme.labelLarge,
                        validator: addCourseViewModel.validate,
                        controller: addCourseViewModel.descriptionController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.abc),
                          hintText: "Описание курса",
                        ),
                      ),

                      Container(height: 12,),
                      TextFormField(
                        style: Theme.of(context).textTheme.labelLarge,
                        controller: addCourseViewModel.urlController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.video_library),
                          hintText: "Видеоролик курса",
                        ),
                      ),


                      Container(height: 12,),


                      TextFormField(
                        style: Theme.of(context).textTheme.labelLarge,
                        onTap: () async{
                          addCourseViewModel.selectedDate = await showDatePicker(
                              context: context,

                              firstDate: DateTime(2015),
                              lastDate: DateTime(2050),
                              initialDate: widget.courseModel?.availableTo
                          );

                          addCourseViewModel.dateController.text = addCourseViewModel.selectedDateString!;

                        },
                        readOnly: true,
                        controller: addCourseViewModel.dateController,
                        validator: addCourseViewModel.validate,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.calendar_month),
                          hintText: "Конечная дата курса",

                        ),
                      ),

                      Container(height: 12,),

                      TextFormField(
                        style: Theme.of(context).textTheme.labelLarge,
                        readOnly: true,
                        validator: addCourseViewModel.validate,
                        controller: addCourseViewModel.imageController,
                        onTap: () async{
                          await addCourseViewModel.uploadImage();
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.add_photo_alternate),
                          hintText: "Изображение курса",

                        ),
                      ),

                      Container(height: 20,),
                      Container(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: () async{
                            if(addCourseViewModel.formKey.currentState!.validate()){
                              if(widget.courseModel != null){
                                await addCourseViewModel.editCourse(widget.courseModel!);
                              }
                              else{
                                await addCourseViewModel.addCourse();
                                Navigator.of(context).pop();
                              }
                            }

                          },
                          icon: Icon(Icons.upload_file),
                          label: Text(widget.courseModel == null ? "Добавить курс" : "Внести изменения"),
                          style: FilledButton.styleFrom(backgroundColor: Colors.green[800]),
                        ),
                      )





                    ],
                  ),
                ),
              ):
              Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator()
                    ],
                  )

          );
        },
      )
    );
  }
}
