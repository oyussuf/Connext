import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';
import '../utility/loading_screen.dart';
import '../utility/toast_messages.dart';

class AddMusic extends StatefulWidget {
  const AddMusic({Key? key}) : super(key: key);

  @override
  State<AddMusic> createState() => _AddMusicState();
}

class _AddMusicState extends State<AddMusic> {
  String dropdownValueCategory = 'Producer';
  String dropdownValueSC = 'All';
  UploadTask? task;
  String filename = 'no image';
  File? image;
  String urlDownloadAdd = 'Empty';
  TextEditingController discription = TextEditingController();
  TextEditingController servicePriceController = TextEditingController();
  DatabaseReference? serviceKey;

  List<String> subCategoryList = [
    'All',
    'Beats',
    'Music',
  ];
  List<String> proSubList = [
    'All',
    'Beats',
    'Music',
  ];
  List<String> djSubList = [
    'All',
    'Host Event',
    'Recording',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Service'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  // service
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Service Name',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                              fontSize: 16)),
                      SizedBox(
                        width: 60,
                      ),
                      Text('Music',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontSize: 16)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // category
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Category',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange)),
                      SizedBox(
                        width: 90,
                      ),
                      DropdownButton<String>(
                        value: dropdownValueCategory,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                        underline: Container(
                          height: 2,
                          color: Colors.black54,
                        ),
                        onChanged: (String? newValue) {
                          subCategoryList = [];
                          setState(() {
                            if (newValue == 'Producer') {
                              subCategoryList = subCategoryList + proSubList;
                            } else if (newValue == 'DJ') {
                              subCategoryList = subCategoryList + djSubList;
                            } else {
                              subCategoryList = subCategoryList + proSubList;
                            }
                            dropdownValueCategory = newValue!;
                          });
                        },
                        items: <String>[
                          'Producer',
                          'DJ',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  // sub-category
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sub-Category',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange)),
                      SizedBox(
                        width: 60,
                      ),
                      DropdownButton<String>(
                        value: dropdownValueSC,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                        underline: Container(
                          height: 2,
                          color: Colors.black54,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueSC = newValue!;
                          });
                        },
                        items: subCategoryList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  // service price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Service Price',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange)),
                      SizedBox(
                        width: 90,
                      ),
                      Text(
                        '\$',
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(),
                        child: TextField(
                            cursorColor: Colors.deepOrange,
                            controller: servicePriceController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Text('Discription',
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
                      controller: discription,
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
              height: 10,
            ),
            Column(
              children: [
                Text('Add Image',
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
                    border:
                        Border.all(width: 2, color: Colors.deepOrange.shade200),
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
                  if (servicePriceController.text.isEmpty) {
                    displayToastMessage("Please Enter Service Price", context);
                  } else if (discription.text.isEmpty) {
                    displayToastMessage(
                        "Please Enter Service Discription", context);
                  } else if (urlDownloadAdd == 'Empty') {
                    print('$urlDownloadAdd');
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
                ))
          ],
        ),
      ),
    );
  }

  Future postService() async {
    serviceKey = await FirebaseDatabase.instance.ref().child("Services").push();

    Map serviceDataMap = {
      'service_name': 'Music',
      'category': dropdownValueCategory,
      'sub-category': dropdownValueSC,
      'description': discription.text.trim(),
      'service_price': servicePriceController.text.trim(),
      'posted_by_name': '${student!.firstname} ${student!.lastname}',
      'posted_by_image': student!.profileimage,
      'service_image': urlDownloadAdd,
      'posted_dateTime': DateTime.now().toString(),
    };
    String key = serviceKey!.key!;
    await userRef.child(student!.id!).child('my_post').child(key).set(true);
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
