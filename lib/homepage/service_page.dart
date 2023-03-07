import 'package:flutter/material.dart';

import '../screens/adding_service.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          // Tile
          Text(
            'Select a Service',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // First row with beauty and Cooking
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.deepOrange.shade200,
                        border: Border.all(
                            width: 2, color: Colors.deepOrange.shade200),
                        shape: BoxShape.circle),
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.account_tree_rounded,
                      size: 60,
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
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.deepOrange.shade200,
                        border: Border.all(
                            width: 2, color: Colors.deepOrange.shade200),
                        shape: BoxShape.circle),
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.cookie,
                      size: 60,
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
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.deepOrange.shade200,
                        border: Border.all(
                            width: 2, color: Colors.deepOrange.shade200),
                        shape: BoxShape.circle),
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.music_note,
                      size: 60,
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
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.deepOrange.shade200,
                        border: Border.all(
                            width: 2, color: Colors.deepOrange.shade200),
                        shape: BoxShape.circle),
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.photo_album_outlined,
                      size: 60,
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
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.deepOrange.shade200,
                        border: Border.all(
                            width: 2, color: Colors.deepOrange.shade200),
                        shape: BoxShape.circle),
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.people,
                      size: 60,
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
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.deepOrange.shade200,
                        border: Border.all(
                            width: 2, color: Colors.deepOrange.shade200),
                        shape: BoxShape.circle),
                    width: 100,
                    height: 100,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddService()));
                      },
                      child: Icon(
                        Icons.add,
                        size: 60,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Provide Service',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
          // second row with music and photography
          // roommates
        ],
      ),
    ));
  }
}
