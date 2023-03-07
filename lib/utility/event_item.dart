import 'package:connext/models/eventModel.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  EventModel eventM;
  EventItem({required this.eventM});

  @override
  Widget build(BuildContext context) {
    print(eventM.eventDiscription);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.indigo.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 10, right: 10, bottom: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Event Title',
                        style: TextStyle(
                            color: Colors.indigo, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${eventM.eventTitle}',
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Event Time',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${eventM.eventTime}',
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Event Location',
                        style: TextStyle(
                            color: Colors.indigo, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${eventM.eventLocation}',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Details',
                        style: TextStyle(
                            color: Colors.indigo, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${eventM.eventDiscription}',
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
