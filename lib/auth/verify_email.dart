import 'dart:async';

import 'package:connext/auth/login_user.dart';
import 'package:connext/utility/loading_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utility/toast_messages.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  // initstate is a already defined flutter function that runs before everything whenever a screen is lunched
  // we are checking if user has email verified or not
  @override
  void initState() {
    super.initState();
    //checking is email is verified or not
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    // if not we are sending the verification email
    if (!isEmailVerified) {
      // send verification email function send new verification email to user
      sendVerificationEmail();
      // tost message show to user after verification email is sent.
      displayToastMessage("Verification email sent,", context);
    }
    // a timer that tests very 3 second if email is verified or not.
    timer = Timer.periodic(Duration(seconds: 3), (_) => checkEmailVerified());
  }

  // a function that sends verification email
  Future sendVerificationEmail() async {
    try {
      // looking for current user logined
      final user = FirebaseAuth.instance.currentUser;
      // sendEmailverification function is a firebaseAuth function that is called on user
      await user!.sendEmailVerification();

      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(Duration(seconds: 10));
      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  // this is checking if email is verified or not
  Future checkEmailVerified() async {
    // here we are reloading user information
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      timer!.cancel();
    }
  }

  // we are using a if else statement is a short form here
  // if isEmailverified is true go to HomePage()
  // if it is false load scaffold

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? LoadingScreen()
      : Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Verify Email'),
            backgroundColor: Colors.deepOrange,
          ),
          body: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Text(
                'An email with a link was sent to verify your account. Click the link to continue.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 40),
                      maximumSize: const Size(150, 40),
                      backgroundColor: Colors.deepOrange),
                  onPressed: () {
                    if (canResendEmail == true) {
                      sendVerificationEmail();
                      displayToastMessage("Verification Email Sent", context);
                    }
                  },
                  child: Text(
                    'Resend Email',
                    style: TextStyle(fontSize: 16),
                  )),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 40),
                      maximumSize: const Size(150, 40),
                      backgroundColor: Colors.grey),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginUser()),
                        (route) => false);
                    displayToastMessage("Successfully Signed Out", context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 16),
                  )),
            ],
          ),
        );
}
