
import 'package:flutter/widgets.dart';

class UserModel extends ChangeNotifier{
   String? name;
   String? email;
   String? phone;
   String? bio;
   String? password;
   UserModel({
    this.name,
    this.email,
    this.phone,
    this.bio,
    this.password,
});
  Map<String, dynamic>  toMap(){
    final map = <String, dynamic> {};
    name : map['name'];
    email : map['email'];
    phone : map['phone'];
    bio : map['bio'];
    password : map['password'];
    return map;
  }

   UserModel.fromJson(json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    bio = json['bio'];
    password = json['password'];
  }

}