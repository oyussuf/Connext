import 'package:connext/auth/forgot_password.dart';
import 'package:connext/auth/register_user.dart';
import 'package:connext/auth/verify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({Key? key}) : super(key: key);

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var phoneController;
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
                Text('Hi there, Nice to see you again!',
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
                    //controller: phoneController,
                    decoration: InputDecoration(
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
                  print('sign in clicked');
                  if (_emailController.text.isEmpty) {
                    print('email field is empty');
                  } else if (!_emailController.text.endsWith('@pvamu.edu')) {
                    print('invalid email');
                  } else if (_passwordController.text.isEmpty ||
                      _passwordController.text.length < 6) {
                    print('invalid password');
                  } else {
                    print('all good');
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

  Future signInUser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text)
        .then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => VerifyEmail()),
          (route) => false);
    }).onError((error, stackTrace) {
      print('signinError');
    });
  }
}
