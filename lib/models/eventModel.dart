import 'package:firebase_database/firebase_database.dart';

class EventModel {
  String? eventKey;
  String? eventTitle;
  String? eventDiscription;
  String? eventTime;
  String? eventLocation;
  String? postedby;
  String? postedDateTime;

  EventModel(
      {this.eventKey,
      this.eventTitle,
      this.eventDiscription,
      this.eventTime,
      this.eventLocation,
      this.postedby,
      this.postedDateTime});

  EventModel.fromSnapshot(DataSnapshot snapshot) {
    eventKey = snapshot.key!;
    var data = snapshot.value as Map?;

    if (data != null) {
      eventTitle = data["event_name"];
      eventDiscription = data["event_discription"];
      eventTime = data["event_date"];
      eventLocation = data["event_location"];
      postedby = data["posted_by_fname"];
      postedDateTime = data["posted_dateTime"];
    }
  }
}
