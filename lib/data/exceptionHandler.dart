
import 'dart:async';

class ExceptionHandler{

  String ex = "";
  StreamController<String> _streamController = StreamController.broadcast();


  Stream<String> get stream => _streamController.stream;

  void addExceptionWithText(String exceptionText){
    _streamController.add(exceptionText);
  }

  
}