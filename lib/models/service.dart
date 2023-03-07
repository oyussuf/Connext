import 'package:firebase_database/firebase_database.dart';

class Service {
  String? serviceName;
  String? serviceDiscription;
  String? serviceCategory;
  String? serviceSubCategory;

  Service({
    this.serviceName,
    this.serviceDiscription,
    this.serviceCategory,
    this.serviceSubCategory,
  });

  Service.fromSnapshot(DataSnapshot snapshot) {
    var data = snapshot.value as Map?;

    if (data != null) {
      serviceName = data["service_name"];
      serviceDiscription = data["description"];
      serviceCategory = data["category"];
      serviceSubCategory = data["sub-category"];
    }
  }
}
