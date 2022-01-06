import 'package:flutter/material.dart';
import 'wrapper2.dart';
import 'database_services.dart';

void main() => runApp(TambahFoto());

class TambahFoto extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<TambahFoto> {
  TextEditingController data = TextEditingController(text: "");
  TextEditingController data1 = TextEditingController(text: "");
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
            child: Column(),
          ),
        ),
      ),
    );
  }
}
