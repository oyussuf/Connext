import 'package:connext/homepage/profile_page.dart';
import 'package:connext/homepage/service_page.dart';
import 'package:flutter/material.dart';

import 'event_page.dart';
import 'home_page.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({Key? key}) : super(key: key);

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  int currentIndexBot = 0;
  final screens = [HomePage(), ServicePage(), EventPage(), ProfilePage()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndexBot,
        children: screens,
      ),

      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade900,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          selectedFontSize: 10,
          currentIndex: currentIndexBot,
          onTap: (index) {
            setState(() {
              currentIndexBot = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.grey.shade800),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Colors.grey.shade800),
            BottomNavigationBarItem(
                icon: Icon(Icons.event),
                label: 'Events',
                backgroundColor: Colors.grey.shade800),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Colors.grey.shade800),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
