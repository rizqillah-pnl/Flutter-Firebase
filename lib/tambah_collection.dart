import 'package:flutter/material.dart';
import 'database_services.dart';
import 'main1-voting.dart';
import 'color.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(TambahCollection());

class TambahCollection extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<TambahCollection> {
  TextEditingController data = TextEditingController(text: "");
  TextEditingController data1 = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tambah Koleksi"),
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
                Container(
                  width: 320,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Nama Tabel",
                        style: TextStyle(color: Colors.blue),
                      ),
                      Form(
                        autovalidateMode: AutovalidateMode.always,
                        child: TextFormField(
                          validator: validator,
                          controller: data1,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 3.0,
                              ),
                            ),
                            hintText: "Tabel Baru",
                            hintStyle: TextStyle(color: Color(0xffccd1ff)),
                          ),
                          style: TextStyle(color: Colors.black),
                          autofocus: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Container(
                  width: 320,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Nama",
                        style: TextStyle(color: Colors.blue),
                      ),
                      Form(
                        autovalidateMode: AutovalidateMode.always,
                        child: TextFormField(
                          validator: validator,
                          controller: data,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 3.0,
                              ),
                            ),
                            hintText: "Koleksi Baru",
                            hintStyle: TextStyle(color: Color(0xffccd1ff)),
                          ),
                          style: TextStyle(color: Colors.black),
                          autofocus: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 200),
                ),
                ElevatedButton(
                  child: Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () async {
                    Fluttertoast.showToast(msg: "Menambahkan " + data.text, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: ColorPalette.back, textColor: ColorPalette.front, fontSize: 16.0);
                    DatabaseServices.createUpdateProduct(data1.text, name: data.text);
                    Navigator.pop(context);
                    print("Menambah " + data.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Voting()));
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

String validator(String value) {
  if (value.length <= 2)
    return 'Harus lebih 2 huruf';
  else
    return null;
}
