import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_services2.dart';
import 'main1-voting.dart';
import 'tambah_collection.dart';
import 'tambah_foto.dart';
import 'deleteCollection.dart';
import 'package:fluttertoast/fluttertoast.dart';

// class MainPage extends StatelessWidget {
//   final User user;
//   MainPage(this.user);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('RIZQILLAH / 1957301020 - MAIN'),
//           backgroundColor: Colors.red,
//         ),
//         body: Center(
//           child: Column(
//             children: <Widget>[
//               Text(user.uid),
//               ElevatedButton(
//                 child: Text("Sign Out"),
//                 onPressed: () async {
//                   await AuthServices.signOut();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MainPage extends StatelessWidget {
  final User user;
  MainPage(this.user);
  String nama = "Anonymous";
  String getNama() {
    if (user.email == null || user.email == "") {
      return nama;
    }
    return user.email;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(getNama()),
        ),
        drawer: sideBar(context),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                user.uid,
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                child: Text("Sign Out"),
                onPressed: () async {
                  await AuthServices.signOut();
                  Fluttertoast.showToast(msg: "Sampai Jumpa " + getNama(), toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: ColorPalette.back, textColor: ColorPalette.front, fontSize: 16.0);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sideBar(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(icon: Icons.group, text: 'Shared with me', onTap: () => print('Tekan Shared menu')),
          _drawerItem(icon: Icons.access_time, text: 'Recent', onTap: () => print('Tekan Recent menu')),
          _drawerItem(icon: Icons.delete, text: 'Trash', onTap: () => print('Tekan Trash menu')),
          _drawerItem(
            icon: Icons.add,
            text: 'Foto',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TambahFoto()));
            },
          ),
          _drawerItem(
            icon: Icons.add,
            text: 'Tambah Collection',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TambahCollection()));
            },
          ),
          _drawerItem(
            icon: Icons.check_box,
            text: 'Voting',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Voting()));
            },
          ),
          _drawerItem(
            icon: Icons.delete,
            text: 'Delete Collection',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HapusMobil()));
            },
          ),
          Divider(height: 25, thickness: 1),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text(
              "Labels",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
          _drawerItem(icon: Icons.bookmark, text: 'Family', onTap: () => print('Tekan Family menu')),
        ],
      ),
    );
  }

  Widget _drawerHeader() {
    return UserAccountsDrawerHeader(
      currentAccountPicture: ClipOval(
        child: Image(image: AssetImage('assets/images/images3.jpg'), fit: BoxFit.cover),
      ),
      otherAccountsPictures: [
        ClipOval(
          child: Image(image: AssetImage('assets/images/images2.JPG'), fit: BoxFit.cover),
        ),
        ClipOval(
          child: Image(image: AssetImage('assets/images/image1.png'), fit: BoxFit.cover),
        )
      ],
      accountName: Text(user.uid),
      accountEmail: Text(getNama()),
    );
  }

  Widget _drawerItem({IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
