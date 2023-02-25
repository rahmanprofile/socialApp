import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social/view/home.dart';
import 'package:social/viewmodel/authentication/signin.dart';
import '../../viewmodel/component/notify.dart';

class FirebaseService extends ChangeNotifier {
  final uid = FirebaseAuth.instance.currentUser;

  Future signUp(
      BuildContext context, String email, String password, String name) async {
    final store = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    String? url;
    try {
      final user =
          auth.createUserWithEmailAndPassword(email: email, password: password);
      try{
        final response = await store.collection('users').add({
          'name': name,
          'email': email,
          'url' : url,
          'password': password,
          'time': Timestamp.now(),
          'uid': uid!.uid,
        }).whenComplete(() => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              ),
            });
        print(response.toString());
      }on FirebaseException catch (e) {
        Navigator.pop(context);
        Notify().message(e.message.toString());
      }
    } on FirebaseAuthException catch (e) {
      Notify().message(e.message.toString());
    }
  }

  Future signIn(BuildContext context, String email, String password) async {
    final auth = FirebaseAuth.instance;
    try {
      final user =
          auth.signInWithEmailAndPassword(email: email, password: password);
      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
      } else {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      Notify().message(e.message.toString());
    }
  }

  Future signOut(BuildContext context) async {
    final auth = FirebaseAuth.instance;
    try{
      final user = auth.signOut();
      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignIn(),
          ),
        );
      }
    }on FirebaseException catch (e) {
      Notify().message(e.message.toString());
    }
  }
}
