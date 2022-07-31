import 'package:drowsylert/components/my_text.dart';
import 'package:drowsylert/constants/constants.dart';
import 'package:drowsylert/screens/authentication.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? firstName;
  String? lastName;
  String? carNo;
  String? emailId;

  _loadUserData() async {
    SharedPreferences pr = await SharedPreferences.getInstance();

    firstName = pr.getString('first_name');
    lastName = pr.getString('last_name');
    carNo = pr.getString('car_no');
    emailId = pr.getString('email_id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: btnColor,
        title: MyText(
          'Drowsylert',
          16,
          'MEDIUM',
          primary,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout_rounded),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setBool('is_logged_in', false);
              prefs.remove('first_name');
              prefs.remove('last_name');
              prefs.remove('car_no');
              prefs.remove('email_id');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Authentication(),
                ),
              );
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: _loadUserData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 16.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 160,
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          MyText(
                            'First Name : ',
                            14,
                            'Medium',
                            btnColor,
                          ),
                          MyText(
                            firstName ?? '',
                            14,
                            'Light',
                            secondary,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        children: [
                          MyText(
                            'Last Name : ',
                            14,
                            'Medium',
                            btnColor,
                          ),
                          MyText(
                            lastName ?? "",
                            14,
                            'Light',
                            secondary,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        children: [
                          MyText(
                            'Car Number: ',
                            14,
                            'Medium',
                            btnColor,
                          ),
                          MyText(
                            carNo ?? "",
                            14,
                            'Light',
                            secondary,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Wrap(
                        children: [
                          MyText(
                            'Email address : ',
                            14,
                            'Medium',
                            btnColor,
                          ),
                          MyText(
                            emailId ?? "",
                            14,
                            'Light',
                            secondary,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: btnColor,
        child: Icon(
          Icons.drive_eta,
        ),
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          print(prefs.getString('first_name'));
        },
      ),
    );
  }
}
