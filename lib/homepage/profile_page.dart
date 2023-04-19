import 'dart:io';

import 'package:connext/screens/my_post_list.dart';
import 'package:connext/utility/toast_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/login_user.dart';
import '../utility/edit_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GlobalKey<ScaffoldState> _scaffoldKEY = GlobalKey<ScaffoldState>();
  int currentIndexBot = 0;
  final double coverHeight = 200;
  final double profileHeight = 144;
  Color statusColor = Colors.green;
  bool adminBadge = false;
  late List<bool> isSelected;

  UploadTask? task;
  File? image;
  String? picURL;

  @override
  void initState() {
    picURL = student!.profileimage;
    print('initstate of profilepage');
    adminBadge = student!.admin!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                '${student!.firstname} ${student!.lastname}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.white, width: 4)),
                child: CircleAvatar(
                  radius: profileHeight / 2,
                  backgroundColor: Colors.grey.shade800,
                  backgroundImage: NetworkImage(picURL != null
                      ? picURL!
                      : 'https://firebasestorage.googleapis.com/v0/b/connext-pv.appspot.com/o/profilepictures%2FFile%3A%20\'%2Fdata%2Fuser%2F0%2Fcom.pvamu.connext.connext%2Fcache%2Fe8008a49-b929-4c42-9dee-763582f26904%2FIMG-20230328-WA0000.jpg\'?alt=media&token=36384ea8-5517-47ec-a371-0feaba5b0f41'),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '${student!.email}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '${student!.gender}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              adminBadge
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ADMIN',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orangeAccent,
                        )
                      ],
                    )
                  : SizedBox(
                      height: 0,
                    ),
              SizedBox(
                height: 60,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyPostList()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(
                              color: Colors.grey.shade300, width: 2))),
                  child: Row(
                    children: [
                      Icon(Icons.post_add, color: Colors.deepOrange, size: 35),
                      SizedBox(
                        width: 12,
                      ),
                      Text('iew Posts'),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(
                              color: Colors.grey.shade300, width: 2))),
                  child: Row(
                    children: [
                      Icon(Icons.manage_accounts,
                          color: Colors.deepOrange, size: 35),
                      SizedBox(
                        width: 12,
                      ),
                      Text('Edit Profile'),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginUser()),
                      (route) => false);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Colors.grey.shade300, width: 2))),
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.deepOrange, size: 35),
                      SizedBox(
                        width: 12,
                      ),
                      Text('Log Out'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
