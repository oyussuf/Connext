import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth/login_user.dart';
import '../utility/toast_messages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
            ),
            // under construction icon
            Icon(
              Icons.construction,
              size: 100,
              color: Colors.deepOrange,
            ),
            // Text
            SizedBox(
              height: 30,
            ),
            Text(
              'Home Page is Under Construction',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            // name
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'First Name :: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${student!.firstname}',
                  style: TextStyle(color: Colors.deepOrange),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Last Name :: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${student!.lastname}',
                  style: TextStyle(color: Colors.deepOrange),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Student Email :: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${student!.email}',
                  style: TextStyle(color: Colors.deepOrange),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Gender :: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${student!.gender}',
                  style: TextStyle(color: Colors.deepOrange),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 40),
                    maximumSize: const Size(200, 40),
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
                  'Sign Out',
                  style: TextStyle(fontSize: 16),
                )),
            // email
            //gender
          ],
        ),
      ),
    );
  }
}
