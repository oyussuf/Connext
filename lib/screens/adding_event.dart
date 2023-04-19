import 'package:connext/utility/toast_messages.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../utility/loading_screen.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  TextEditingController eventNameController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  DatabaseReference? eventRefKey;
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            // page Title
            Text(
              'Add Event',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
            SizedBox(
              height: 20,
            ),
            // event name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Event Name',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange)),
                  Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(),
                    child: TextField(
                      cursorColor: Colors.deepOrange,
                      textCapitalization: TextCapitalization.words,
                      controller: eventNameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // event discription
            Column(
              children: [
                Text('Description',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 120,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2)),
                    child: TextField(
                      controller: discriptionController,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(border: InputBorder.none),
                      minLines: 1,
                      maxLines: 5,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // event date
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Event Date',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange)),
                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(),
                        child: TextField(
                            cursorColor: Colors.deepOrange,
                            controller: dateController,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // event location
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Event Location',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange)),
                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(),
                        child: TextField(
                            cursorColor: Colors.deepOrange,
                            controller: locationController,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Posted by ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange)),
                      Text('${student!.firstname} ${student!.lastname}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontSize: 20)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: CheckboxListTile(
                  title: GestureDetector(
                      onTap: () {},
                      child: Text(
                          'I agree to Term of Services and Privacy Policy',
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 14,
                              fontWeight: FontWeight.bold))),
                  value: checkedValue,
                  activeColor: Colors.deepOrange,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue = newValue!;
                      print(newValue);
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                )),
            // post button
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    maximumSize: const Size(300, 50),
                    backgroundColor: Colors.deepOrange),
                onPressed: () {
                  if (eventNameController.text.isEmpty) {
                    displayToastMessage('Please enter event name', context);
                  } else if (discriptionController.text.isEmpty) {
                    displayToastMessage(
                        'Please enter event description', context);
                  } else if (dateController.text.isEmpty) {
                    displayToastMessage(
                        'Please enter event description', context);
                  } else if (locationController.text.isEmpty) {
                    displayToastMessage(
                        'Please enter event description', context);
                  } else if (checkedValue == false) {
                    print('Accept term and conditions to continue.');
                    displayToastMessage(
                        "Accept term and conditions to continue.", context);
                  } else {
                    postEvent();
                  }
                },
                child: Text(
                  'Post Event',
                  style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }

  // posting event

  Future postEvent() async {
    // creates a folder for a event with a unique name
    eventRefKey = await FirebaseDatabase.instance.ref().child("Events").push();

    // map veriable stores multiple values in it
    Map serviceDataMap = {
      'event_name': eventNameController.text.trim(),
      'event_discription': discriptionController.text.trim(),
      'event_date': dateController.text.trim(),
      'event_location': locationController.text.trim(),
      'posted_by_fname': student!.firstname,
      'posted_by_lname': student!.lastname,
      'posted_dateTime': DateTime.now().toString(),
    };

    await eventRefKey!.set(serviceDataMap);
    displayToastMessage('Event Posted', context);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoadingScreen()),
        (route) => false);
  }
}
