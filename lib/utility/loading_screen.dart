import 'package:connext/utility/toast_messages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../homepage/default_page.dart';
import '../providers/appData.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String dataReadingStatus = 'Loading...';
  @override
  void initState() {
    checkingData();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              dataReadingStatus,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
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
      ),
    );
  }

  void checkingData() async {
    Provider.of<AppData>(context, listen: false).numberOfEvents = 0;
    Provider.of<AppData>(context, listen: false).eventKeys = [];
    Provider.of<AppData>(context, listen: false).eventDataList = [];
    Provider.of<AppData>(context, listen: false).numberOfService = 0;
    Provider.of<AppData>(context, listen: false).numberOfRoommatePost = 0;
    Provider.of<AppData>(context, listen: false).numberOfMyPost = 0;
    Provider.of<AppData>(context, listen: false).numberOfMyRoommatePost = 0;
    Provider.of<AppData>(context, listen: false).serviceKeys = [];
    Provider.of<AppData>(context, listen: false).roommatePostKeys = [];
    Provider.of<AppData>(context, listen: false).serviceDataList = [];
    Provider.of<AppData>(context, listen: false).roommatePostDataList = [];
    Provider.of<AppData>(context, listen: false).myPostKeys = [];
    Provider.of<AppData>(context, listen: false).myPostDataList = [];
    Provider.of<AppData>(context, listen: false).myRoommatePostKeys = [];
    Provider.of<AppData>(context, listen: false).myRoommatePostDataList = [];
    Provider.of<AppData>(context, listen: false).foundRoommatePost = [];
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      dataReadingStatus = 'App Loading...';
    });
    await readingUserData();
    if (student == null) {
      await Future.delayed(Duration(seconds: 5));
    }
    await Future.delayed(Duration(seconds: 5));
    retriveMyPostInfo(context);
    retriveMyRoommatePostInfo(context);
    await retriveRoommateKeys(context);
    await retriveServiceKeys(context);
    await retriveEventKeys(context);
    if (Provider.of<AppData>(context, listen: false).eventDataList.isEmpty) {
      setState(() {
        dataReadingStatus = 'Reading App Data...';
      });
      await Future.delayed(Duration(seconds: 10));
    }

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => DefaultPage()),
        (route) => false);
  }
}
