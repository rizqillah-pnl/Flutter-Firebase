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
            child: Column(),
          ),
        ),
      ),
    );
  }
}
