import 'package:flutter/material.dart';
import 'wrapper2.dart';
import 'package:provider/provider.dart';
import 'auth_services2.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: AuthServices.firebaseUserStream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider.value(
//       initialData: null,
//       value: AuthServices.firebaseUserStream,
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Wrapper(),
//       ),
//     );
//   }
// }
