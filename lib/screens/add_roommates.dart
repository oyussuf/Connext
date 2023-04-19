import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';
import '../utility/loading_screen.dart';
import '../utility/toast_messages.dart';

class AddRoommates extends StatefulWidget {
  const AddRoommates({Key? key}) : super(key: key);

  @override
  State<AddRoommates> createState() => _AddRoommatesState();
}

class _AddRoommatesState extends State<AddRoommates> {
  String dropdownValueGender = 'Any';
  String dropdownValueDistance = 'less than 5 miles';
  String dropdownValuePet = 'Yes';
  String dropdownValueBedRooms = '1';
  UploadTask? task;
  String filename = 'no image';
  File? image;
  String? urlDownloadAdd;
  TextEditingController discriptionController = TextEditingController();
  TextEditingController monthlyRentController = TextEditingController();
  TextEditingController distanceController = TextEditingController();
  DatabaseReference? serviceKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Service'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    // service  titles
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Service Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                                fontSize: 18)),
                        SizedBox(
                          width: 60,
                        ),
                        Text('Find Roommate',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                fontSize: 16)),
                      ],
                    ),
                    // Bedrooms
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Bedrooms',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange)),
                        SizedBox(
                          width: 60,
                        ),
                        DropdownButton<String>(
                          value: dropdownValueBedRooms,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                          underline: Container(
                            height: 2,
                            color: Colors.black54,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValueBedRooms = newValue!;
                            });
                          },
                          items: <String>[
                            '1',
                            '2',
                            '3+',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    // distance from campus
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Distance From School',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange)),
                        SizedBox(
                          width: 40,
                        ),
                        DropdownButton<String>(
                          value: dropdownValueDistance,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                          underline: Container(
                            height: 2,
                            color: Colors.black54,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValueDistance = newValue!;
                            });
                          },
                          items: <String>[
                            'less than 5 miles',
                            '5-10 miles',
                            '10-15 miles',
                            '15+ miles'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    // pets allowed?
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pet Allowed',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange)),
                        SizedBox(
                          width: 60,
                        ),
                        DropdownButton<String>(
                          value: dropdownValuePet,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                          underline: Container(
                            height: 2,
                            color: Colors.black54,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValuePet = newValue!;
                            });
                          },
                          items: <String>[
                            'Yes',
                            'No',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    // preferred gender
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Preferred Gender',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange)),
                        SizedBox(
                          width: 60,
                        ),
                        DropdownButton<String>(
                          value: dropdownValueGender,
                          icon: const Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                          underline: Container(
                            height: 2,
                            color: Colors.black54,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValueGender = newValue!;
                            });
                          },
                          items: <String>[
                            'Male',
                            'Female',
                            'Any',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Description:',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 120,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 2)),
                            child: TextField(
                              controller: discriptionController,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              minLines: 1,
                              maxLines: 5,
                            ),
                          ),
                        )
                      ],
                    ),
                    // monthly  rent
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Monthly Rent',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange)),
                        SizedBox(
                          width: 90,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(),
                          alignment: Alignment.centerLeft,
                          child: TextField(
                              cursorColor: Colors.deepOrange,
                              controller: monthlyRentController,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              )),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 12,
                    ),
                    // preferred gender
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text('Room Images',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrange.shade200,
                      border: Border.all(
                          width: 2, color: Colors.deepOrange.shade200),
                    ),
                    width: 100,
                    height: 100,
                    child: GestureDetector(
                      onTap: () {
                        pickImage();
                      },
                      child: Icon(
                        Icons.add,
                        size: 60,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(filename,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 50),
                      maximumSize: const Size(300, 50),
                      backgroundColor: Colors.deepOrange),
                  onPressed: () {
                    if (discriptionController.text.isEmpty) {
                      displayToastMessage(
                          "Please Enter Service Discription", context);
                    } else if (monthlyRentController.text.isEmpty) {
                      displayToastMessage("Please Enter Monthy Rent", context);
                    } else if (urlDownloadAdd == 'Empty') {
                      displayToastMessage("Please Add Service Image", context);
                    } else {
                      postService();
                    }
                  },
                  child: Text(
                    'Post Service',
                    style: TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future postService() async {
    serviceKey =
        await FirebaseDatabase.instance.ref().child("Roommates").push();

    Map serviceDataMap = {
      'roomMate_title': 'Roommates',
      'roomMate_bedrooms': dropdownValueBedRooms,
      'roomMate_distance': dropdownValueDistance,
      'roomMate_pet_allowed': dropdownValuePet,
      'roomMate_pref_gender': dropdownValueGender,
      'roomMate_discription': discriptionController.text.trim(),
      'roomMate_rent': monthlyRentController.text.trim(),
      'roomMate_image': urlDownloadAdd,
      'posted_by_name': '${student!.firstname} ${student!.lastname}',
      'posted_by_image': student!.profileimage,
      'posted_dateTime': DateTime.now().toString(),
    };
    String key = serviceKey!.key!;
    await userRef
        .child(student!.id!)
        .child('my_roommate_post')
        .child(key)
        .set(true);

    await serviceKey!.set(serviceDataMap).then((value) {
      displayToastMessage('Service Posted Successfully', context);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoadingScreen()),
          (route) => false);
    });
  }

  Future pickImage() async {
    // checkStoragePermission();
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);

    String destination = 'serviceImages/$imageTemporary';
    this.image = imageTemporary;

    task = uploadFile(
      destination,
      this.image!,
    );

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL().then((value) {
      urlDownloadAdd = value;
      print('value of getDownloadURL : $value');
    });
    setState(() {
      filename = task!.snapshot.ref.name;
    });
    print('Download-Link: $urlDownload');
  }

  static UploadTask? uploadFile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);

      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
