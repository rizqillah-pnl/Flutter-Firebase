import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseServices {
  static CollectionReference productCollection = FirebaseFirestore.instance.collection("mobil");

  static Future<void> createUpdateProduct(String id, {String name}) async {
    await productCollection.doc(id).set({
      'name': name,
      'vote': 0,
    });
  }

  static Future uploadImage(File imageFile) async {
    String fileName = basename(imageFile.path);
    FirebaseStorage storage = FirebaseStorage.instance;
    print(storage);
    Reference ref = storage.ref().child(fileName + DateTime.now().toString());
    UploadTask task = ref.putFile(imageFile);

    task.whenComplete(() {
      return ref.getDownloadURL();
    }).catchError((onError) {
      print(onError);
    });
  }
}

// FirebaseStorage storage = FirebaseStorage.instance;
// Reference ref = storage.ref().child("image1" + DateTime.now().toString());
// UploadTask uploadTask = ref.putFile(_image1);
// uploadTask.then((res) {
//    res.ref.getDownloadURL();
// });
