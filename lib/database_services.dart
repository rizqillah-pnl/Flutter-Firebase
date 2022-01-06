import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static int num = 1;

  static CollectionReference productCollection = FirebaseFirestore.instance.collection("mobil");

  static Future<void> createUpdateProduct(String id, {String name}) async {
    await productCollection.doc(id + num.toString()).set({
      'name': name,
      'vote': 0
    });
    num += 1;
  }
}
