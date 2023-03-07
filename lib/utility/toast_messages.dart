import 'package:connext/main.dart';
import 'package:connext/models/student.dart';
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

Future retriveEventData(BuildContext context) async {
  print('retriveEventData .....');
  await eventRef.once().then((DatabaseEvent event) async {
    DataSnapshot snap = event.snapshot;
    if (snap.exists) {
      print('snap.exists event......');
      Map<dynamic, dynamic> keys = snap.value as Map;
      int eventCounter = keys.length;
      print('number of event :: $eventCounter');
      Provider.of<AppData>(context, listen: false)
          .updateNumberOfTrips(eventCounter);

      List<String> eventkeys = [];
      keys.forEach((key, value) {
        eventkeys.add(key);
      });
      Provider.of<AppData>(context, listen: false).updateTripKeys(eventkeys);
      await obtainEventData(context);
    } else {
      print('snap.donot exist event......');
    }
  });
}

Future obtainEventData(BuildContext context) async {
  var keys = Provider.of<AppData>(context, listen: false).tripHistoryKeys;
  for (String key in keys) {
    eventRef.child(key).once().then((DatabaseEvent event) {
      DataSnapshot snap = event.snapshot;
      if (snap.exists) {
        eventModel = EventModel.fromSnapshot(snap);
        // eventDataList.add(eventModel!);
        print('data of event :: ${snap.value}');
        Provider.of<AppData>(context, listen: false)
            .updateTripHistoryData(eventModel!);
      }
    });
  }
}
