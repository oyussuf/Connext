import 'package:connext/homepage/profile_page.dart';
import 'package:connext/homepage/service_page.dart';
import 'package:flutter/material.dart';

import 'event_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndexBot = 0;
  final screens = [HomePage(), EventPage(), ServicePage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        width: 50,
        color: Colors.deepOrange,
        child: Text('Event Page'),
      ),
    );
  }
}
