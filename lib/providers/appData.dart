import 'package:connext/models/eventModel.dart';
import 'package:flutter/cupertino.dart';

class AppData with ChangeNotifier {
  int numberOfTrips = 0;
  List<String> tripHistoryKeys = [];
  List<EventModel> tripHistoryDataList = [];

  void updateNumberOfTrips(int newTrips) {
    numberOfTrips = newTrips;
    notifyListeners();
  }

  void updateTripKeys(List<String> newKeys) {
    tripHistoryKeys = newKeys;
    notifyListeners();
  }

  void updateTripHistoryData(EventModel eachHistory) {
    tripHistoryDataList.add(eachHistory);
    notifyListeners();
  }
}
