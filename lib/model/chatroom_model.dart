import 'package:flutter/cupertino.dart';
import 'message.dart';

class ChatroomModel extends ChangeNotifier {
  final String? name;
  final String? id;
  final List<Message>? message;

  ChatroomModel ({
    this.message,
     this.name,
    this.id,
});
}


