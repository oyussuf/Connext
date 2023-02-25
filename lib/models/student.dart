import 'package:firebase_database/firebase_database.dart';

class Student {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? gender;

  Student({this.id, this.firstname, this.lastname, this.email, this.gender});

  Student.fromSnapshot(DataSnapshot dataSnapshot) {
    id = dataSnapshot.key!;

    var data = dataSnapshot.value as Map?;

    if (data != null) {
      firstname = data["first_name"];
      lastname = data["last_name"];
      email = data["email"];
      gender = data["gender"];
    }
  }
}
