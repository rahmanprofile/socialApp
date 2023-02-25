import 'package:flutter/cupertino.dart';

class PostModel extends ChangeNotifier{
  String? title;
  String? body;
  String? bio;

  PostModel({
     this.title,
     this.body,
     this.bio,
});
  Map<String, dynamic> toMap() {
    final map = <String, dynamic> {};
    map['title'] = title;
    map['body'] = body;
    map['bio'] = bio;
    return map;
  }

  PostModel.fromJson( json) {
    title = json['title'];
    body = json['body'];
    bio = json['bio'];
  }
}