import 'package:connext/auth/login_user.dart';
import 'package:connext/providers/appData.dart';
import 'package:connext/utility/loading_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AppData()),
    ],
    child: MyApp(),
  ));
}

DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users");
DatabaseReference eventRef = FirebaseDatabase.instance.ref().child("Events");
DatabaseReference roommateRef =
    FirebaseDatabase.instance.ref().child("Roommates");
DatabaseReference serviceRef =
    FirebaseDatabase.instance.ref().child("Services");

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppData>(
      create: (context) => AppData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Connext',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: FirebaseAuth.instance.currentUser == null
            ? LoginUser()
            : LoadingScreen(),
      ),
    );
  }
}
