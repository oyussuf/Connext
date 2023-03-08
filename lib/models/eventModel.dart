import 'package:firebase_database/firebase_database.dart';

class EventModel {
  String? eventTitle;
  String? eventDiscription;
  String? eventTime;
  String? eventLocation;
  String? postedby;

  EventModel(
      {this.eventTitle,
      this.eventDiscription,
      this.eventTime,
      this.eventLocation,
      this.postedby});

  EventModel.fromSnapshot(DataSnapshot snapshot) {
    var data = snapshot.value as Map?;

    if (data != null) {
      eventTitle = data["event_name"];
      eventDiscription = data["event_discription"];
      eventTime = data["event_date"];
      eventLocation = data["event_location"];
      postedby = data["posted_by_fname"];
    }
  }
}
