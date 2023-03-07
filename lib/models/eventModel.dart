import 'package:firebase_database/firebase_database.dart';

class EventModel {
  String? eventTitle;
  String? eventDiscription;
  String? eventTime;
  String? eventLocation;

  EventModel({
    this.eventTitle,
    this.eventDiscription,
    this.eventTime,
    this.eventLocation,
  });

  EventModel.fromSnapshot(DataSnapshot snapshot) {
    var data = snapshot.value as Map?;

    if (data != null) {
      eventTitle = data["event_name"];
      eventDiscription = data["event_discription"];
      eventTime = data["event_date"];
      eventLocation = data["event_location"];
    }
  }
}
