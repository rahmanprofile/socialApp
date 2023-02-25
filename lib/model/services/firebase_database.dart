import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirebaseDatabase extends ChangeNotifier {

  Future<void> create(String id) async {
    final _collection = FirebaseFirestore.instance;
    await _collection.doc(id).set({
      "id" : id,
      "" : '',
    });

  }
}