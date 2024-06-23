
import 'package:mobx/mobx.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

part 'courseInfoViewModel.g.dart';

class CourseInfoViewModel = _CourseInfoViewModel with _$CourseInfoViewModel;

abstract class _CourseInfoViewModel with Store{


  late YoutubePlayerController controller;
  bool isVideoLoaded = true;

  @observable
  String _url = "";

  @observable
  String? _yotubeUrl;

  @computed
  String? get yotubeUrl => _yotubeUrl;


  set url(String value) {
    _url = value;
  }

  @observable
  String _videoId = "";
  String get videoId => _videoId;


  @action
  Future<void> loadVideo() async{
      isVideoLoaded = false;
      _yotubeUrl =  YoutubePlayerController.convertUrlToId(_url);
      print(_yotubeUrl);

      if(_yotubeUrl != null){
        controller = YoutubePlayerController.fromVideoId(videoId: _yotubeUrl!);
      }
      controller = YoutubePlayerController();
      isVideoLoaded = true;

  }
}