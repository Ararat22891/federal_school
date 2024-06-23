
class ComplaintModel{
  String chatUid;
  String messageUid;
  String complaintSenderId;
  String complaintId;

  ComplaintModel({required this.chatUid, required this.messageUid, required this.complaintSenderId, required this.complaintId});

  Map<String, dynamic> toJson() {
    return {
      'chatUid': chatUid,
      'messageUid': messageUid,
      'complaintSenderId':complaintSenderId,
      'complaintId': complaintId
    };
  }
}