import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static CollectionReference productCollection = FirebaseFirestore.instance.collection("mobil");

  static Future<void> createUpdateProduct(String id, {String name}) async {
    await productCollection.doc(id).set({
      'name': name,
      'vote': 0
    });
  }
}
