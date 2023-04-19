import 'package:connext/auth/login_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/toast_messages.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight / 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight / 20,
                ),
                // Signin text
                Text('Forgot Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono')),
                // welcome line
                SizedBox(
                  height: screenHeight / 100,
                ),
                Text(
                    'Enter your email address to receive a link to reset your password.',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono')),
                // email text field
                SizedBox(
                  height: screenHeight / 40,
                ),
                Container(
                  width: screenWidth / 1,
                  height: 50,
                  decoration: BoxDecoration(
                      // color: Colors.grey.shade200,
                      ),
                  child: TextField(
                    cursorColor: Colors.deepOrange,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.deepOrange),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.black26)
                        // border: InputBorder.none,
                        ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight / 30,
          ),
          // sign-in Button
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    maximumSize: const Size(300, 50),
                    backgroundColor: Colors.deepOrange),
                onPressed: () {
                  if (_emailController.text.isEmpty) {
                    print('email field is empty');
                    displayToastMessage("Please enter email", context);
                  } else if (!_emailController.text.endsWith('@pvamu.edu')) {
                    displayToastMessage("Invalid Email", context);
                  } else {
                    passwordReset();
                  }
                },
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 20),
                )),
          ),
          SizedBox(
            height: screenHeight / 60,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginUser()));
            },
            child: Text(
              'Back to Sign In?',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'RobotoMono'),
            ),
          ),
        ],
      ),
    );
  }

  Future passwordReset() async {
    try {
      // sending Password ResetEmail to the entered email
      // sendPasswordResetEmail is an inbuilt firebaseAuth function
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      print('email sent');
      displayToastMessage('Reset password email sent', context);
      // send the user to sigin screen
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginUser()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      displayToastMessage('An error occurred', context);
      print(e.toString());
    }
  }
}
