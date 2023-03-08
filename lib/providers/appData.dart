import 'package:connext/models/eventModel.dart';
import 'package:flutter/cupertino.dart';

class AppData with ChangeNotifier {
  int numberOfEvents = 0;
  List<String> tripHistoryKeys = [];
  List<EventModel> tripHistoryDataList = [];

  void updateNumberOfTrips(int newEvent) {
    numberOfEvents = newEvent;
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
