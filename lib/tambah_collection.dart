import 'package:flutter/material.dart';
import 'wrapper2.dart';

void main() => runApp(TambahCollection());

class TambahCollection extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<TambahCollection> {
  TextEditingController data = TextEditingController(text: "");
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => Wrapper()));
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
                  child: TextField(
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
                      hintText: "Nama",
                      hintStyle: TextStyle(color: Color(0xffccd1ff)),
                    ),
                    style: TextStyle(color: Colors.white),
                    autofocus: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 200),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
