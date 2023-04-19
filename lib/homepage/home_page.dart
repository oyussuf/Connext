import 'package:connext/homepage/profile_page.dart';
import 'package:connext/homepage/service_page.dart';
import 'package:connext/screens/add_cooking.dart';
import 'package:connext/screens/add_music.dart';
import 'package:connext/screens/add_photography.dart';
import 'package:connext/screens/add_roommates.dart';
import 'package:connext/screens/adding_service.dart';
import 'package:connext/utility/toast_messages.dart';
import 'package:flutter/material.dart';

import 'event_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndexBot = 0;
  bool isServiceProvider = false;
  final screens = [HomePage(), EventPage(), ServicePage(), ProfilePage()];

  @override
  void initState() {
    isServiceProvider = student!.serviceprovider!;
  }

  @override
  Widget build(BuildContext context) {
    print(student!.serviceprovider);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Select A Service',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              // Tile
              // Text(
              //   'Select a Service',
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              // First row with beauty and Cooking
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!isServiceProvider) {
                            displayToastMessage(
                                'No Are Not Authorized to Add a Service',
                                context);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddService()));
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.deepOrange.shade200,
                              image: DecorationImage(
                                  image: AssetImage("assets/beauty.png"),
                                  scale: 4),
                              border: Border.all(
                                  width: 2, color: Colors.deepOrange.shade200),
                              shape: BoxShape.circle),
                          width: 100,
                          height: 100,
                          // child: Icon(
                          //   Icons.account_tree_rounded,
                          //   size: 60,
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Beauty',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!isServiceProvider) {
                            displayToastMessage(
                                'No Are Not Authorized to Add a Service',
                                context);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddCooking()));
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.deepOrange.shade200,
                              image: DecorationImage(
                                  image: AssetImage("assets/cooking.png"),
                                  scale: 8),
                              border: Border.all(
                                  width: 2, color: Colors.deepOrange.shade200),
                              shape: BoxShape.circle),
                          width: 100,
                          height: 100,
                          // child: Icon(
                          //   Icons.cookie,
                          //   size: 60,
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Cooking',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!isServiceProvider) {
                            displayToastMessage(
                                'No Are Not Authorized to Add a Service',
                                context);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddMusic()));
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.deepOrange.shade200,
                              image: DecorationImage(
                                  image: AssetImage("assets/music.png"),
                                  scale: 8),
                              border: Border.all(
                                  width: 2, color: Colors.deepOrange.shade200),
                              shape: BoxShape.circle),
                          width: 100,
                          height: 100,
                          // child: Icon(
                          //   Icons.music_note,
                          //   size: 60,
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Music',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!isServiceProvider) {
                            displayToastMessage(
                                'No Are Not Authorized to Add a Service',
                                context);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddPhotoGraphy()));
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/photography.png"),
                                  scale: 8),
                              color: Colors.deepOrange.shade200,
                              border: Border.all(
                                  width: 2, color: Colors.deepOrange.shade200),
                              shape: BoxShape.circle),
                          width: 100,
                          height: 100,
                          // child:
                          // Icon(
                          //   Icons.photo_album_outlined,
                          //   size: 60,
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Photography',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!isServiceProvider) {
                            displayToastMessage(
                                'No Are Not Authorized to Add a Service',
                                context);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddRoommates()));
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.deepOrange.shade200,
                              image: DecorationImage(
                                  image: AssetImage("assets/roommates.png"),
                                  scale: 4),
                              border: Border.all(
                                  width: 2, color: Colors.deepOrange.shade200),
                              shape: BoxShape.circle),
                          width: 100,
                          height: 100,
                          // child: Icon(
                          //   Icons.people,
                          //   size: 60,
                          // ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Roommates',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
