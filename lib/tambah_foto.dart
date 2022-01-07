import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'color.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';

void main() => runApp(TambahFoto());

class TambahFoto extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<TambahFoto> {
  String imagePath;
  File _image;

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
                    await getImage();
                    // await DatabaseServices.uploadImage(_image);
                    imagePath = _image.path;
                    Fluttertoast.showToast(msg: "Menambahkan Foto " + basename(imagePath), toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: ColorPalette.back, textColor: ColorPalette.front, fontSize: 16.0);

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

  Future getImage() async {
    final picker = ImagePicker();
    PickedFile pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(
      () {
        _image = File(pickedFile.path);
      },
    );
  }
}
