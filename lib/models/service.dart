import 'package:firebase_database/firebase_database.dart';

class Service {
  String? serviceKey;
  String? serviceName;
  String? serviceDiscription;
  String? serviceCategory;
  String? serviceSubCategory;
  String? serviceImage;
  String? servicePrice;
  String? postedByImage;
  String? postedByName;
  String? postedDateTime;

  Service(
      {this.serviceKey,
      this.serviceName,
      this.serviceDiscription,
      this.serviceCategory,
      this.serviceSubCategory,
      this.servicePrice,
      this.serviceImage,
      this.postedByName,
      this.postedByImage,
      this.postedDateTime});

  Service.fromSnapshot(DataSnapshot snapshot) {
    serviceKey = snapshot.key!;
    var data = snapshot.value as Map?;

    if (data != null) {
      serviceName = data["service_name"];
      serviceDiscription = data["description"];
      serviceCategory = data["category"];
      serviceSubCategory = data["sub-category"];
      serviceImage = data["service_image"];
      servicePrice = data["service_price"];
      postedByImage = data["posted_by_image"];
      postedByName = data["posted_by_name"];
      postedDateTime = data["posted_dateTime"];
    }
  }
}
