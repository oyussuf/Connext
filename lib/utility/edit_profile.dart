import 'dart:io';

import 'package:connext/utility/toast_messages.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';
import 'loading_screen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  int genderValue = 0;
  UploadTask? task;
  File? image;
  String? picURL;
  String filename = 'no image';
  String genderString = 'Gender N/D';
  String? urlDownloadAdd = student!.profileimage;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 20,
            ),
            Text('Edit Profile',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono')),
            SizedBox(
              height: screenHeight / 20,
            ),
            Container(
              width: screenWidth / 1,
              height: 50,
              decoration: BoxDecoration(
                  // color: Colors.grey.shade200,
                  ),
              child: TextField(
                cursorColor: Colors.deepOrange,
                controller: _firstNameController,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                //controller: phoneController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepOrange, width: 2.0),
                    ),
                    labelText: 'First Name',
                    labelStyle: TextStyle(color: Colors.deepOrange),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepOrange, width: 2.0),
                    ),
                    hintText: 'First Name',
                    hintStyle: TextStyle(color: Colors.black26)
                    // border: InputBorder.none,
                    ),
              ),
            ),
            SizedBox(
              height: screenHeight / 60,
            ),
            Container(
              width: screenWidth / 1,
              height: 50,
              decoration: BoxDecoration(
                  // color: Colors.grey.shade200,
                  ),
              child: TextField(
                cursorColor: Colors.deepOrange,
                controller: _lastNameController,
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.sentences,
                //controller: phoneController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepOrange, width: 2.0),
                    ),
                    labelText: 'last Name',
                    labelStyle: TextStyle(color: Colors.deepOrange),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepOrange, width: 2.0),
                    ),
                    hintText: 'Last Name',
                    hintStyle: TextStyle(color: Colors.black26)
                    // border: InputBorder.none,
                    ),
              ),
            ),
            SizedBox(
              height: screenHeight / 60,
            ),
            Container(
                width: screenWidth / 1,
                decoration: BoxDecoration(
                    // color: Colors.grey.shade200,
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.black54),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Male',
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold)),
                        Radio(
                            value: 1,
                            activeColor: Colors.deepOrange,
                            groupValue: genderValue,
                            onChanged: (value) {
                              setState(() {
                                if (genderValue == 1) {
                                  genderValue = 2;
                                } else {
                                  genderValue = 1;
                                }
                              });
                            }),
                        SizedBox(
                          width: 24,
                        ),
                        Text('Female',
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold)),
                        Radio(
                            value: 2,
                            groupValue: genderValue,
                            activeColor: Colors.deepOrange,
                            onChanged: (value) {
                              setState(() {
                                if (genderValue == 2) {
                                  genderValue = 1;
                                } else {
                                  genderValue = 2;
                                }
                              });
                            }),
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: screenHeight / 60,
            ),
            Column(
              children: [
                Text('Add Image',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: Colors.black54)),
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
              height: screenHeight / 5,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    maximumSize: const Size(300, 50),
                    backgroundColor: Colors.deepOrange),
                onPressed: () {
                  if (genderValue == 1) {
                    genderString = 'Male';
                  } else if (genderValue == 2) {
                    genderString = 'Female';
                  } else {
                    genderString = 'Gender N/D';
                  }
                  updateProfile();
                },
                child: Text(
                  'Update Profile',
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                    maximumSize: const Size(300, 50),
                    backgroundColor: Colors.grey),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }

  Future pickImage() async {
    // checkStoragePermission();
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);

    String destination = 'profilepictures/';
    this.image = imageTemporary;

    task = uploadFile(
      destination,
      this.image!,
    );

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL().then((value) {
      print('value of getDownloadURL : $value');
      // userRef.child(student!.id!).child('profile_image').set(value);
      urlDownloadAdd = value;
      setState(() {
        picURL = value;
      });
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

  Future<void> updateProfile() async {
    print(student!.email);
    print(student!.firstname);
    print(student!.lastname);
    print(student!.gender);
    Map userDataMap = {
      "first_name": _firstNameController.text.trim(),
      "last_name": _lastNameController.text.trim(),
      'gender': genderString,
      'profile_image': urlDownloadAdd,
      "email": student!.email,
    };
    await userRef.child(student!.id!).set(userDataMap).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoadingScreen()),
          (route) => false);
    });

    displayToastMessage("Profile Updated", context);
  }
}
