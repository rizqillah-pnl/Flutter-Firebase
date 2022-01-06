import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  int num = 1;

  static CollectionReference productCollection = Firestore.instance.collection("products" + num.toString);

  static Future<void> createUpdateProduct(String id, {String name}) async {
    await productCollection.doc(id).set({
      'name': name,
      'vote': 0
    });
  }
}
