class MessagesModel {
  String messageText;
  String senderID;
  String receiverID;
  String dateTime;

  MessagesModel(
      {this.messageText, this.senderID, this.receiverID, this.dateTime});

  MessagesModel.fromJson(Map<String, dynamic> json) {
    messageText = json['messageText'];
    senderID = json['senderID'];
    receiverID = json['receiverID'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toMap() {
    return {
      'messageText': messageText,
      'senderID': senderID,
      'receiverID': receiverID,
      'dateTime': dateTime,
    };
  }
}
