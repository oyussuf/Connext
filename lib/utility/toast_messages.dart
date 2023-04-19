import 'package:connext/main.dart';
import 'package:connext/models/roomMateModel.dart';
import 'package:connext/models/service.dart';
import 'package:connext/models/student.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../models/eventModel.dart';
import '../providers/appData.dart';

// Toast messages are popup messages in flutter
// we are using fluttertoast package

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.grey.shade800,
    fontSize: 16,
    textColor: Colors.deepOrangeAccent,
  );
}

Student? student;

EventModel? eventModel;

Service? serviceModel;

RoommatesModel? roommatePostModel;

Future retriveEventKeys(BuildContext context) async {
  print('retriveEventData .....');
  await eventRef.once().then((DatabaseEvent event) async {
    DataSnapshot snap = event.snapshot;
    if (snap.exists) {
      print('snap.exists event......');
      Map<dynamic, dynamic> keys = snap.value as Map;
      int eventCounter = keys.length;
      print('number of event :: $eventCounter');
      Provider.of<AppData>(context, listen: false)
          .updateNumberOfEvents(eventCounter);

      List<String> eventkeys = [];
      keys.forEach((key, value) {
        eventkeys.add(key);
      });
      Provider.of<AppData>(context, listen: false).updateEventKeys(eventkeys);
      await obtainEventData(context);
    } else {
      print('snap.donot exist event......');
    }
  });
}

Future obtainEventData(BuildContext context) async {
  var keys = Provider.of<AppData>(context, listen: false).eventKeys;
  for (String key in keys) {
    eventRef.child(key).once().then((DatabaseEvent event) {
      DataSnapshot snap = event.snapshot;
      if (snap.exists) {
        eventModel = EventModel.fromSnapshot(snap);
        // eventDataList.add(eventModel!);
        print('data of event :: ${snap.value}');
        Provider.of<AppData>(context, listen: false)
            .updatEventData(eventModel!);
      }
    });
  }
}

Future retriveServiceKeys(BuildContext context) async {
  print('retriveEventData .....');
  await serviceRef.once().then((DatabaseEvent event) async {
    DataSnapshot snap = event.snapshot;
    if (snap.exists) {
      print('snap.exists service......');
      Map<dynamic, dynamic> keys = snap.value as Map;
      int serviceCounter = keys.length;
      print('number of service :: $serviceCounter');
      Provider.of<AppData>(context, listen: false)
          .updateNumberOfService(serviceCounter);

      List<String> serviceKeys = [];
      keys.forEach((key, value) {
        serviceKeys.add(key);
      });
      Provider.of<AppData>(context, listen: false)
          .updateServiceKeys(serviceKeys);
      await obtainServiceData(context);
    } else {
      print('snap.donot exist service......');
    }
  });
}

Future obtainServiceData(BuildContext context) async {
  var keys = Provider.of<AppData>(context, listen: false).serviceKeys;
  for (String key in keys) {
    serviceRef
        .child(key)
        .orderByChild('posted_dateTime')
        .once()
        .then((DatabaseEvent event) {
      DataSnapshot snap = event.snapshot;
      if (snap.exists) {
        serviceModel = Service.fromSnapshot(snap);
        // eventDataList.add(eventModel!);
        print('data of service :: ${snap.value}');
        Provider.of<AppData>(context, listen: false)
            .updatServiceData(serviceModel!);
      }
    });
  }
}

Future readingUserData() async {
  User? firebaseUser = FirebaseAuth.instance.currentUser;
  await userRef
      .child(firebaseUser!.uid)
      .once()
      .then((DatabaseEvent event) async {
    DataSnapshot snap = event.snapshot;
    if (snap.exists) {
      student = Student.fromSnapshot(snap);
    }
  });
}

void retriveMyPostInfo(BuildContext context) {
  userRef
      .child(student!.id!)
      .child('my_post')
      .once()
      .then((DatabaseEvent event) {
    print(
        "in-number-of-myposts...... retrive-mypost-Info Functions-------------------");
    DataSnapshot snap = event.snapshot;
    print(snap.value);
    if (snap.exists) {
      Map<dynamic, dynamic> keys = snap.value as Map;
      int myPostCounter = keys.length;

      Provider.of<AppData>(context, listen: false)
          .updateNumberOfMyPost(myPostCounter);

      print('number of my posts = $myPostCounter');

      List<String> myPostKeys = [];
      keys.forEach((key, value) {
        myPostKeys.add(key);
      });
      Provider.of<AppData>(context, listen: false).updateMyPostKeys(myPostKeys);
      obtainmyPostData(context);
    }
  });
}

void obtainmyPostData(BuildContext context) {
  var keys = Provider.of<AppData>(context, listen: false).myPostKeys;

  for (String key in keys) {
    serviceRef.child(key).once().then((DatabaseEvent event) {
      print('keys my post = $key');
      DataSnapshot snap = event.snapshot;
      if (snap.exists) {
        print(snap);
        var myPostData = Service.fromSnapshot(snap);
        Provider.of<AppData>(context, listen: false)
            .updateMyPostData(myPostData);
      }
    });
  }
}

Future retriveRoommateKeys(BuildContext context) async {
  print('retriveRoommateKeysss .....');
  await roommateRef.once().then((DatabaseEvent event) async {
    DataSnapshot snap = event.snapshot;
    if (snap.exists) {
      print('snap.exists roommates......');
      Map<dynamic, dynamic> keys = snap.value as Map;
      int roommatePostCounter = keys.length;
      print('number of roommate posts :: $roommatePostCounter');
      Provider.of<AppData>(context, listen: false)
          .updateNumberOfRoommatePost(roommatePostCounter);

      List<String> roomMatePostKeys = [];
      keys.forEach((key, value) {
        roomMatePostKeys.add(key);
      });
      Provider.of<AppData>(context, listen: false)
          .updateRoommatePostKeys(roomMatePostKeys);
      await obtainRoommatePostData(context);
    } else {
      print('snap.donot exist roommatepposts......');
    }
  });
}

Future obtainRoommatePostData(BuildContext context) async {
  var keys = Provider.of<AppData>(context, listen: false).roommatePostKeys;
  for (String key in keys) {
    roommateRef.child(key).once().then((DatabaseEvent event) {
      DataSnapshot snap = event.snapshot;
      if (snap.exists) {
        roommatePostModel = RoommatesModel.fromSnapshot(snap);
        // eventDataList.add(eventModel!);
        print('data of roomMates :: ${snap.value}');
        Provider.of<AppData>(context, listen: false)
            .updatRoommatePostData(roommatePostModel!);
      }
    });
  }
}

void retriveMyRoommatePostInfo(BuildContext context) {
  userRef
      .child(student!.id!)
      .child('my_roommate_post')
      .once()
      .then((DatabaseEvent event) {
    print(
        "in-number-of-my-roommate-posts...... retrive-my-roommate-post-Info Functions-------------------");
    DataSnapshot snap = event.snapshot;
    print(snap.value);
    if (snap.exists) {
      Map<dynamic, dynamic> keys = snap.value as Map;
      int myRoommatePostCounter = keys.length;

      Provider.of<AppData>(context, listen: false)
          .updateNumberOfMyRoommatePost(myRoommatePostCounter);

      print('number of my roommate posts = $myRoommatePostCounter');

      List<String> myRoommatePostKeys = [];
      keys.forEach((key, value) {
        myRoommatePostKeys.add(key);
      });
      Provider.of<AppData>(context, listen: false)
          .updateMyRoommatePostKeys(myRoommatePostKeys);
      obtainmyRoommatePostData(context);
    }
  });
}

void obtainmyRoommatePostData(BuildContext context) {
  var keys = Provider.of<AppData>(context, listen: false).myRoommatePostKeys;

  for (String key in keys) {
    roommateRef.child(key).once().then((DatabaseEvent event) {
      print('keys my Roommate post = $key');
      DataSnapshot snap = event.snapshot;
      if (snap.exists) {
        print(snap);
        var myRoommatePostData = RoommatesModel.fromSnapshot(snap);
        Provider.of<AppData>(context, listen: false)
            .updateMyRoommatePostData(myRoommatePostData);
      }
    });
  }
}
