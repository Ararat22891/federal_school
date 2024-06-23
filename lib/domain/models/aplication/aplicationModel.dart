
class AplicationModel{
  String text;
  String userUid;

  AplicationModel({required this.text, required this.userUid});

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'userUid': userUid,
    };
  }
}