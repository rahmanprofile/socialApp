import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social/view/home.dart';
import '../model/post_model.dart';

class CreateNew extends StatefulWidget {
  const CreateNew({Key? key}) : super(key: key);

  @override
  State<CreateNew> createState() => _CreateNewState();
}

class _CreateNewState extends State<CreateNew> {
  List<PostModel> postList = [];

  Future post() async {
    final store = FirebaseFirestore.instance;
    try {
      store.collection('post').add({
        'title': titleController.text.trim(),
        'body': bodyController.text.trim(),
        'bio': bioController.text.trim(),
      }).then((value) => {
            debugPrint(value.toString()),
            titleController.clear(),
            bioController.clear(),
            bodyController.clear(),
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Home())),
          });
    } on FirebaseException catch (e) {
      log(e.message.toString());
    }
  }

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Column(
            children: [
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Title"),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: TextFormField(
                    controller: bodyController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Body"),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: TextFormField(
                    controller: bioController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Bio"),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              InkWell(
                onTap: () {
                  post();
                },
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0.0),
                      color: Colors.blueGrey),
                  child: Center(
                    child: Text(
                      "Publish",
                      style: GoogleFonts.lato(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
