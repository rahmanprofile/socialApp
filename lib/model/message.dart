import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Message extends ChangeNotifier{
  final String? msg;
  final String? senderId;
  final String? receiverId;
  final Timestamp? time;

  Message({
     this.msg,
     this.receiverId,
     this.senderId,
      this.time
});

}