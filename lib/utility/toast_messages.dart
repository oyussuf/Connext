import 'package:connext/models/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
