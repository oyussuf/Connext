import 'package:connext/models/eventModel.dart';
import 'package:connext/models/roomMateModel.dart';
import 'package:flutter/cupertino.dart';

import '../models/service.dart';

class AppData with ChangeNotifier {
  int numberOfEvents = 0;
  List<String> eventKeys = [];
  List<EventModel> eventDataList = [];
  int numberOfService = 0;
  int numberOfRoommatePost = 0;
  int numberOfMyPost = 0;
  int numberOfMyRoommatePost = 0;
  List<String> serviceKeys = [];
  List<String> roommatePostKeys = [];
  List<Service> serviceDataList = [];
  List<RoommatesModel> roommatePostDataList = [];
  List<String> myPostKeys = [];
  List<Service> myPostDataList = [];
  List<String> myRoommatePostKeys = [];
  List<RoommatesModel> myRoommatePostDataList = [];
  List<RoommatesModel> foundRoommatePost = [];

  void updatefoundRoommatePostList(List<RoommatesModel> newList) {
    foundRoommatePost = newList;
    notifyListeners();
  }

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

  void updateNumberOfService(int newService) {
    numberOfService = newService;
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

  void updateNumberOfMyPost(int updateNumberOfMyPost) {
    print('number of my Post in AppData');
    numberOfMyPost = updateNumberOfMyPost;
    print('Number Of Trips in Appdata');
    print(numberOfMyPost);
    notifyListeners();
  }

  void updateMyPostKeys(List<String> newKeys) {
    myPostKeys = newKeys;
    notifyListeners();
  }

  void updateMyPostData(Service eachPost) {
    myPostDataList.add(eachPost);
    notifyListeners();
  }

  void updateNumberOfMyRoommatePost(int updateNumberOfMyRoommatePost) {
    print('number of my Post in AppData');
    numberOfMyRoommatePost = updateNumberOfMyRoommatePost;
    print('Number Of Trips in Appdata');
    print(numberOfMyRoommatePost);
    notifyListeners();
  }

  void updateMyRoommatePostKeys(List<String> newKeys) {
    myRoommatePostKeys = newKeys;
    notifyListeners();
  }

  void updateMyRoommatePostData(RoommatesModel eachPost) {
    myRoommatePostDataList.add(eachPost);
    notifyListeners();
  }

  void updateNumberOfRoommatePost(int newRoommatePost) {
    numberOfRoommatePost = newRoommatePost;
    notifyListeners();
  }

  void updateRoommatePostKeys(List<String> newKeys) {
    roommatePostKeys = newKeys;
    notifyListeners();
  }

  void updatRoommatePostData(RoommatesModel eachRoommatePost) {
    roommatePostDataList.add(eachRoommatePost);
    notifyListeners();
  }
}
