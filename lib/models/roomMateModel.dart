import 'package:firebase_database/firebase_database.dart';

class RoommatesModel {
  String? roomMateKey;
  String? roomMateTitle;
  String? roomMateBedrooms;
  String? roomMateDistance;
  String? roomMatePetAllowed;
  String? roomMatePrefGender;
  String? roomMateDiscription;
  String? roomMateRent;
  String? roomMateImage;
  String? roomMatePostedDate;
  String? postedBy;
  String? postedImage;

  RoommatesModel(
      {this.roomMateKey,
      this.roomMateTitle,
      this.roomMateBedrooms,
      this.roomMateDistance,
      this.roomMatePetAllowed,
      this.roomMatePrefGender,
      this.roomMateDiscription,
      this.roomMateRent,
      this.roomMateImage,
      this.roomMatePostedDate,
      this.postedBy,
      this.postedImage});

  RoommatesModel.fromSnapshot(DataSnapshot snapshot) {
    roomMateKey = snapshot.key!;
    var data = snapshot.value as Map?;

    if (data != null) {
      roomMateTitle = data["roomMate_title"];
      roomMateBedrooms = data["roomMate_bedrooms"];
      roomMateDistance = data["roomMate_distance"];
      roomMatePetAllowed = data["roomMate_pet_allowed"];
      roomMatePrefGender = data["roomMate_pref_gender"];
      roomMateDiscription = data["roomMate_discription"];
      roomMateRent = data["roomMate_rent"];
      roomMateImage = data["roomMate_image"];
      roomMatePostedDate = data["posted_dateTime"];
      postedBy = data["posted_by_name"];
      postedImage = data["posted_by_image"];
    }
  }
}
