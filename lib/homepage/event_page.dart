import 'package:connext/providers/appData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/adding_event.dart';
import '../utility/event_item.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60),
        child: ListView.separated(
          itemBuilder: (BuildContext context, index) {
            return EventItem(
              eventM: Provider.of<AppData>(context, listen: false)
                  .eventDataList[index],
            );
          },
          separatorBuilder: (BuildContext context, index) => SizedBox(
            height: 2,
          ),
          itemCount:
              Provider.of<AppData>(context, listen: false).eventDataList.length,
          padding: EdgeInsets.all(5),
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddEvent()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
