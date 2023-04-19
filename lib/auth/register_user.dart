import 'package:connext/auth/login_user.dart';
import 'package:connext/auth/verify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/student.dart';
import '../utility/toast_messages.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  bool checkedValue = false;
  bool _isObscure = true;

  String genderString = 'Male';
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordTwoController = TextEditingController();

  // Initializing Firebase Auth Package
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight / 8,
                ),
                // Signin text
                Text('Sign Up',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono')),
                // welcome line
                SizedBox(
                  height: screenHeight / 100,
                ),
                Text('Register a new account!',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoMono')),
                // email text field
                SizedBox(
                  height: screenHeight / 20,
                ),
                // first name TextField inside container
                Container(
                  width: screenWidth / 1,
                  height: 50,
                  decoration: BoxDecoration(
                      // color: Colors.grey.shade200,
                      ),
                  child: TextField(
                    cursorColor: Colors.deepOrange,
                    keyboardType: TextInputType.name,
                    controller: _firstNameController,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        labelText: 'First Name',
                        labelStyle: TextStyle(color: Colors.deepOrange),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        hintText: 'First Name',
                        hintStyle: TextStyle(color: Colors.black26)
                        // border: InputBorder.none,
                        ),
                  ),
                ),
                SizedBox(
                  height: screenHeight / 60,
                ),
                // second name TextField inside container
                Container(
                  width: screenWidth / 1,
                  height: 50,
                  decoration: BoxDecoration(
                      // color: Colors.grey.shade200,
                      ),
                  child: TextField(
                    cursorColor: Colors.deepOrange,
                    controller: _lastNameController,
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    //controller: phoneController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        labelText: 'Last Name',
                        labelStyle: TextStyle(color: Colors.deepOrange),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        hintText: 'Last Name',
                        hintStyle: TextStyle(color: Colors.black26)
                        // border: InputBorder.none,
                        ),
                  ),
                ),
                SizedBox(
                  height: screenHeight / 60,
                ),
                // email TextField inside container
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
                    //controller: phoneController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        labelText: 'Student Email',
                        labelStyle: TextStyle(color: Colors.deepOrange),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        hintText: 'Student Email',
                        hintStyle: TextStyle(color: Colors.black26)
                        // border: InputBorder.none,
                        ),
                  ),
                ),
                SizedBox(
                  height: screenHeight / 60,
                ),
                // password TextField inside container
                Container(
                  width: screenWidth / 1,
                  height: 50,
                  decoration: BoxDecoration(
                      // color: Colors.grey.shade200,
                      ),
                  child: TextField(
                    cursorColor: Colors.deepOrange,
                    obscureText: _isObscure,
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
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
                SizedBox(
                  height: screenHeight / 60,
                ),
                // confirm password TextField inside container
                Container(
                  width: screenWidth / 1,
                  height: 50,
                  decoration: BoxDecoration(
                      // color: Colors.grey.shade200,
                      ),
                  child: TextField(
                    cursorColor: Colors.deepOrange,
                    obscureText: _isObscure,
                    controller: _passwordTwoController,
                    keyboardType: TextInputType.visiblePassword,
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
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(color: Colors.deepOrange),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange, width: 2.0),
                        ),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: Colors.black26)
                        // border: InputBorder.none,
                        ),
                  ),
                ),
                SizedBox(
                  height: screenHeight / 60,
                ),

                SizedBox(
                  height: screenHeight / 60,
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: CheckboxListTile(
                      title: GestureDetector(
                          onTap: () {},
                          child: Text(
                              'I agree to Term of Services and Privacy Policy',
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold))),
                      value: checkedValue,
                      activeColor: Colors.deepOrange,
                      onChanged: (newValue) {
                        setState(() {
                          checkedValue = newValue!;
                          print(newValue);
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    )),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight / 20,
          ),
          // sign-in Button
          Center(
              child: Column(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 50),
                      maximumSize: const Size(300, 50),
                      backgroundColor: Colors.deepOrange),
                  onPressed: () {
                    // if / else if are being user to check user entries
                    if (_emailController.text.isEmpty) {
                      print('email field is empty');
                      displayToastMessage("Please enter your email", context);
                    } else if (!_emailController.text.endsWith('@pvamu.edu')) {
                      print('Invalid Email');
                      displayToastMessage("Invalid Email", context);
                    } else if (_firstNameController.text.isEmpty ||
                        _lastNameController.text.isEmpty) {
                      print('please enter name');
                      displayToastMessage("Enter your name", context);
                    } else if (_passwordController.text.isEmpty ||
                        _passwordController.text.length < 6) {
                      print('please enter a valid password');
                      displayToastMessage(
                          "Password must be at least six characters.", context);
                    }
                    // else if (_passwordController != _passwordTwoController) {
                    //   print(
                    //       '${_passwordController.text.trim().length} and ${_passwordTwoController.text.trim().length}');
                    //   displayToastMessage('Password donot match', context);
                    // }
                    else if (checkedValue == false) {
                      print('Accept Terms and Conditions to continue.');
                      displayToastMessage("Please accept TOS", context);
                    } else {
                      print('all good');
                      print(checkedValue);
                      // if (genderValue == 1) {
                      //   genderString = 'Male';
                      // } else {
                      //   genderString = 'Female';
                      // }

                      // register new user function
                      registerNewUser(context);
                    }
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  )),
              SizedBox(
                height: screenHeight / 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // forgot password
                  Text(
                    'Have an account?',
                    style: TextStyle(
                        color: Colors.black54, fontFamily: 'RobotoMono'),
                  ),
                  SizedBox(
                    width: screenWidth / 30,
                  ),
                  // signup
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginUser()),
                          (route) => false);
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'RobotoMono'),
                    ),
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }

  // function for registring new users
  void registerNewUser(BuildContext context) async {
    //registring new user in firebase base and storing values in a veriable firebaseUser to user later.
    final User? firebaseUser = (await auth
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text)
            .catchError((errMsg) {
      displayToastMessage("An error occurred", context);
      print('error at signup');
    }))
        .user;

// checking if firebase user exist or not and then storing data in realtime database
    if (firebaseUser != null) //user created
    {
      displayToastMessage("Registration Successfull", context);
      // userRef is a Referrence of user data.. means address on database
      // it is initialized in main.dart.
      // userRef.child(firebaseUser.uid);

      // it a veriable called Map that containes multiple values.
      Map userDataMap = {
        "first_name": _firstNameController.text.trim(),
        "last_name": _lastNameController.text.trim(),
        "email": _emailController.text.trim(),
        'gender': 'Gender N/D',
        'profile_image':
            'https://firebasestorage.googleapis.com/v0/b/connext-pv.appspot.com/o/profilepictures%2FFile%3A%20\'%2Fdata%2Fuser%2F0%2Fcom.pvamu.connext.connext%2Fcache%2Fe8008a49-b929-4c42-9dee-763582f26904%2FIMG-20230328-WA0000.jpg\'?alt=media&token=36384ea8-5517-47ec-a371-0feaba5b0f41',
        'admin': false,
        'service_provider': true
      };
// sotring our Map user referance in child user id
      // set is used to store the data

      await userRef.child(firebaseUser.uid).set(userDataMap);

      displayToastMessage("Account Created", context);
// after storing data we will navigate to verify screen
      await userRef.child(firebaseUser.uid).once().then((DatabaseEvent event) {
        DataSnapshot snap = event.snapshot;
        if (snap.exists) {
          student = Student.fromSnapshot(snap);
        }
      });
      await retriveServiceKeys(context);
      await retriveEventKeys(context);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => VerifyEmail()),
          (route) => false);
    } else {
      displayToastMessage('Error Occurred', context);
      print('user not created');
    }
  } //signUpwithwmailapass

}
