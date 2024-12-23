
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

class MessageModel {

  String senderId ;
  String messageTxt;
  DateTime timeStamp;

  MessageModel({required this.senderId,required this.messageTxt,required this.timeStamp});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
          senderId: json["senderId"],
      messageTxt: json["messageTxt"],
      timeStamp: (json['timeStamp'] as Timestamp).toDate(),
    );
  }

  // factory MessageModel.fromJson(DocumentSnapshot doc ) {
  //   final data = doc.data() as Map<String, dynamic>;
  //      return MessageModel(
  //     id: doc.id,
  //     senderId: data["senderId"],
  //     messageTxt: data["messageTxt"],
  //     //timeStamp: DateTime.parse(data["timeStamp"]),
  //        timeStamp: (data['timeStamp'] as Timestamp).toDate(),
  //      );
  // }



  Map<String, dynamic> toJson() {
    return {
      "senderId": this.senderId,
      "messageTxt": this.messageTxt,
      "timeStamp": Timestamp.fromDate(this.timeStamp),
    };
  }
//



}