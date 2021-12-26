// import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_services2.dart';

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

import 'package:flutter/material.dart';
import 'nav-drawer.dart';

// void main() {
//   runApp(MaterialApp(
//     title: "BelajarFlutter.com",
//     home: NavigationDrawer(),
//   ));
// }

class NavigationDrawer extends StatelessWidget {
  final User user;
  NavigationDrawer(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.email),
      ),
      drawer: DrawerWidget(),
      endDrawer: DrawerWidget(),
      body: Center(
        child: Text(
          user.uid,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
