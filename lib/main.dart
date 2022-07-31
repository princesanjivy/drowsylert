import 'package:drowsylert/screens/authentication.dart';
import 'package:drowsylert/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(home: Drowsylert()));

class Drowsylert extends StatelessWidget {
  const Drowsylert({Key? key}) : super(key: key);

  Future<bool?> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('is_logged_in');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkLoginStatus(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == true) {
          return HomePage();
        } else if (snapshot.data == false) {
          return Authentication();
        }
        return Authentication();
      },
    );
  }
}
