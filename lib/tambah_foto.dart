import 'package:flutter/material.dart';
import 'wrapper2.dart';
import 'database_services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(TambahFoto());

class TambahFoto extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<TambahFoto> {
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Gallery Foto"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                (imagePath != null)
                    ? Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(image: NetworkImage(imagePath), fit: BoxFit.cover),
                        ),
                      )
                    : Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: Text("Upload Image"),
                  onPressed: () async {
                    XFile file = await getImage();
                    imagePath = await DatabaseServices.uploadImage(file);

                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<XFile> getImage() async {
  final picker = ImagePicker();
  return await picker.pickImage(source: ImageSource.gallery);
  // return File(pickedFile.path);
}
