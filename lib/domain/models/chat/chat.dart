
import 'package:federal_school/domain/models/dialog/dialogModel.dart';
import 'package:flutter/material.dart';

import 'chatCellModel.dart';

class Chat{
  int newMessagesCount;
  DialogModel dialogModel;

  Chat({
    required this.dialogModel,
    required this.newMessagesCount
});


}