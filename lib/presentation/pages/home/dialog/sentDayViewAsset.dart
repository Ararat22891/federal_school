
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SentDayViewAsset extends StatelessWidget {
  final String messageDate;

  const SentDayViewAsset(this.messageDate, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Chip(
        label: Text(formatMessageDate(messageDate)),
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
      ),
    );
  }



  String formatMessageDate(String messageDate) {
    try {
      DateTime dateTime = DateTime.parse(messageDate);
      DateTime now = DateTime.now();
      var formatter;
      if (now.year == dateTime.year) {
        formatter = DateFormat('d MMMM', 'ru'); // Формат для текущего года
      } else {
        formatter = DateFormat('d MMMM y', 'ru'); // Формат для предыдущих годов
      }
      return formatter.format(dateTime);
    }
    catch(_){
      return messageDate;
    }
  }
}
