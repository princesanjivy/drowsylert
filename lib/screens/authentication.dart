import 'package:drowsylert/components/my_text.dart';
import 'package:drowsylert/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:drowsylert/constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication extends StatelessWidget {
  Authentication({Key? key}) : super(key: key);

  final TextEditingController _firstName = new TextEditingController();
  final TextEditingController _lastName = new TextEditingController();
  final TextEditingController _emailId = new TextEditingController();
  final TextEditingController _carNo = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

  _login(String firstName, String lastName, String carNo, String password,
      BuildContext context, String emailId) async {
    if (password == '2580') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('is_logged_in', true);
      prefs.setString('first_name', firstName);
      prefs.setString('last_name', lastName);
      prefs.setString('email_id', emailId);
      prefs.setString('car_no', carNo);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Invalid Key',
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 300,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/Drowsylert.png',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Sign In to',
                            style: GoogleFonts.poppins(
                              color: secondary,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' Drowsylert',
                            style: GoogleFonts.poppins(
                              color: btnColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.poppins(
                            fontSize: 16,
                          ),
                          prefixIcon: Icon(
                            Icons.person_rounded,
                            color: btnColor,
                          ),
                          label: MyText(
                            'First name',
                            16,
                            'Light',
                            secondary,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: btnColor,
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: btnColor,
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        controller: _firstName,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.poppins(
                            fontSize: 16,
                          ),
                          prefixIcon: Icon(
                            Icons.person_rounded,
                            color: btnColor,
                          ),
                          label: MyText(
                            'Last name',
                            16,
                            'Light',
                            secondary,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: btnColor,
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: btnColor,
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        controller: _lastName,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.poppins(
                            fontSize: 16,
                          ),
                          prefixIcon: Icon(
                            Icons.mail_rounded,
                            color: btnColor,
                          ),
                          label: MyText(
                            'Email ID',
                            16,
                            'Light',
                            secondary,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: btnColor,
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: btnColor,
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        controller: _emailId,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.poppins(
                            fontSize: 16,
                          ),
                          hintText: 'Enter the Car Registration Number',
                          hintStyle: TextStyle(
                            fontSize: 10,
                          ),
                          prefixIcon: Icon(
                            Icons.car_repair,
                            color: btnColor,
                          ),
                          label: MyText(
                            'Car No.',
                            16,
                            'Light',
                            secondary,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: btnColor,
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: btnColor,
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        controller: _carNo,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.poppins(
                            fontSize: 16,
                          ),
                          prefixIcon: Icon(
                            Icons.key,
                            color: btnColor,
                          ),
                          label: MyText(
                            'Key',
                            16,
                            'Light',
                            secondary,
                          ),
                          hintText:
                              'Please enter the Key present inside the ZIP File.',
                          hintStyle: TextStyle(
                            fontSize: 10,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: btnColor,
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: btnColor,
                            ),
                            borderRadius: BorderRadius.circular(13),
                          ),
                        ),
                        controller: _password,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () async {
                    _login(_firstName.text, _lastName.text, _carNo.text,
                        _password.text, context, _emailId.text);
                  },
                  style: ButtonStyle(
                    // elevation: MaterialStateProperty.all<double>(15),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(Size(120, 55)),
                    backgroundColor: MaterialStateProperty.all((btnColor)),
                  ),
                  child: MyText(
                    'Login',
                    16,
                    'Medium',
                    primary,
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
