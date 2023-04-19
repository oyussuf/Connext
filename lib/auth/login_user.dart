import 'package:connext/auth/forgot_password.dart';
import 'package:connext/auth/register_user.dart';
import 'package:connext/auth/verify_email.dart';
import 'package:connext/utility/toast_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../models/student.dart';
import '../providers/appData.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({Key? key}) : super(key: key);

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                height: screenHeight / 8,
              ),
              // logo
              Image(
                  image: AssetImage('assets/connextLogo.png'),
                  width: 80,
                  height: 80),
              // logo text
              SizedBox(
                height: screenHeight / 100,
              ),
              Text(
                'Connext',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Text(
              //   'Connext',
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold,
              //       fontFamily: 'RobotoMono'),
              // ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight / 20,
                ),
                // Signin text
                Text('Sign In',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono')),
                // welcome line
                SizedBox(
                  height: screenHeight / 100,
                ),
                Text('Hi there, welcome!',
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
                // password text field
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
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _isObscure,
                    //controller: phoneController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                          icon: _isObscure
                              ? Icon(
                                  Icons.visibility_off,
                                  color: Colors.deepOrange,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: Colors.deepOrange,
                                ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.deepOrange),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        hintText: 'Password',
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
                  // after button  is clicked we are checking user entered information if its valid or not
                  print('sign in clicked');
                  if (_emailController.text.isEmpty) {
                    print('email field is empty');
                    displayToastMessage("Please enter an email", context);
                    // for example here we are checking if the email ends with @pvamu.edu or not
                    // if not it will show a tost message that email is invalid
                  } else if (!_emailController.text.endsWith('@pvamu.edu')) {
                    print('invalid email');
                    displayToastMessage("Invalid Email", context);
                  } else if (_passwordController.text.isEmpty ||
                      _passwordController.text.length < 6) {
                    print('invalid password');
                    displayToastMessage("Invalid Password", context);
                  } else {
                    print('all good');
                    // signinuser function is being called
                    signInUser();
                  }
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 20),
                )),
          ),
          SizedBox(
            height: screenHeight / 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // forgot password
              GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                      (Route<dynamic> route) => false);
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: Colors.black54, fontFamily: 'RobotoMono'),
                ),
              ),
              // signup
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterUser()));
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // we are signing in user using inbuild firebaseAuth function signInWithEmailAndPassword
  // and providing it with email and password.
  // then is called when operation is successful and onError is called if its unsuccessful
  Future signInUser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then((value) async {
      displayToastMessage('Sign In Successful', context);
      // sending user to verified email page to check if that is verified user or not
      User? firebaseUser = FirebaseAuth.instance.currentUser;
      await userRef
          .child(firebaseUser!.uid)
          .once()
          .then((DatabaseEvent event) async {
        DataSnapshot snap = event.snapshot;
        if (snap.exists) {
          student = Student.fromSnapshot(snap);
        }
      });
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => VerifyEmail()),
          (route) => false);
      print(
          'in Login Page //  eventDataList :: ${Provider.of<AppData>(context, listen: false).eventDataList.length}');
    }).onError((error, stackTrace) {
      // displaying a toast message about the error
      displayToastMessage("Invalid Email or Password", context);
    });
  }
}
