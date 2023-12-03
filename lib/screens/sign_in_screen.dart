import 'package:flutter/material.dart';
import 'package:bolt_app/screens/dashboad.dart'; // Import your dashboard screen
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bolt_app/utils/constants.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _success;
  late String _userEmail;
  final FirebaseAuth _auth = FirebaseAuth.instance; // Add this line

  void _signIn() async {
  try {
    // Show a loading indicator or disable the button here
    // You can use a package like 'modal_progress_hud' or 'flutter_spinkit' for loading indicators

    final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (mounted) {
      if (userCredential.user != null) {
        setState(() {
          _success = true;
          _userEmail = userCredential.user!.email!;
        });

        // Navigate to the Dashboard screen after successful sign-in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(),
          ),
        );
      } else {
        setState(() {
          _success = false;
        });
      }
    }
  } catch (e) {
    print('Error during sign-in: $e');
    if (mounted) {
      setState(() {
        _success = false;
      });
    }
  } finally {
    // Hide the loading indicator or enable the button here
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color here
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15, 110, 0, 0),
                  child: Text("Sign Into Bolt Metrics",
                      style: TextStyle(
                          fontSize: 40, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35, left: 20, right: 30),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'EMAIL',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kThemeTertiaryColor),
                      )),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kThemeTertiaryColor),
                      )),
                  obscureText: true,
                ),
                SizedBox(height: 5.0,),
                SizedBox(height: 40,),
                Container(
                  height: 40,
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    shadowColor: Colors.black,
                    color: kThemeTertiaryColor,
                    elevation: 7,
                    child: GestureDetector(
                      onTap: () async {
                        _signIn();
                      },
                      child: Center(
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
