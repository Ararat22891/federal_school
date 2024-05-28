
import 'package:mobx/mobx.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

part 'courseInfoViewModel.g.dart';

class CourseInfoViewModel = _CourseInfoViewModel with _$CourseInfoViewModel;

abstract class _CourseInfoViewModel with Store{


  late YoutubePlayerController controller;
  bool isVideoLoaded = true;

  @observable
  String _url = "";
  set url(String value) {
    _url = value;
  }

  @observable
  String _videoId = "";
  String get videoId => _videoId;


  @action
  Future<void> loadVideo() async{
    isVideoLoaded = false;

    controller = YoutubePlayerController.fromVideoId(
      videoId: YoutubePlayerController.convertUrlToId(_url)!
    );
    isVideoLoaded = true;
  }
}