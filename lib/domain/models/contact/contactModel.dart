

class ContactModel{
  String uid;

  ContactModel({required this.uid});

  // Конструктор fromJson для ContactModel
  static ContactModel fromJson(Map<String, dynamic> json) {
    return ContactModel(
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
    };
  }

}