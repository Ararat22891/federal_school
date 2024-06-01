class CourseModel{
  String uid;
  String creatorID;
  String? imagePath;
  String theme;
  String name;
  String description;
  String? videoUrl;
  DateTime availableTo;


  CourseModel({
    required this.uid,
    required this.creatorID,
    required this.imagePath,
    required this.theme,
    required this.name,
    required this.description,
    required this.availableTo,
    required this.videoUrl
  });


  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'creatorID': creatorID,
      'imagePath': imagePath,
      'theme': theme,
      'name': name,
      'description': description,
      'availableTo': availableTo.toIso8601String(), // Serialize DateTime to ISO 8601 format
      'videoUrl': videoUrl
    };
  }

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      uid: json['uid'],
      creatorID: json['creatorID'],
      imagePath: json['imagePath'],
      theme: json['theme'],
      name: json['name'],
      description: json['description'],
      availableTo: DateTime.parse(json['availableTo']), // Deserialize DateTime from ISO 8601 string
      videoUrl: json['videoUrl']
    );
  }



}

