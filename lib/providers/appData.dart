import 'package:connext/models/eventModel.dart';
import 'package:flutter/cupertino.dart';

import '../models/service.dart';

class AppData with ChangeNotifier {
  int numberOfEvents = 0;
  List<String> eventKeys = [];
  List<EventModel> eventDataList = [];
  int numberOfService = 0;
  List<String> serviceKeys = [];
  List<Service> serviceDataList = [];

  void updateNumberOfEvents(int newEvent) {
    numberOfEvents = newEvent;
    notifyListeners();
  }

  void updateEventKeys(List<String> newKeys) {
    eventKeys = newKeys;
    notifyListeners();
  }

  void updatEventData(EventModel eachEvent) {
    eventDataList.add(eachEvent);
    notifyListeners();
  }

  void updateNumberOfService(int newEvent) {
    numberOfService = newEvent;
    notifyListeners();
  }

  void updateServiceKeys(List<String> newKeys) {
    serviceKeys = newKeys;
    notifyListeners();
  }

  void updatServiceData(Service eachService) {
    serviceDataList.add(eachService);
    notifyListeners();
  }
}
