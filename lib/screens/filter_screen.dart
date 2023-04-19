import 'package:connext/homepage/service_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/roomMateModel.dart';
import '../providers/appData.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String dropdownValueServiceTitle = 'All';
  String dropdownValueCategory = 'All';
  String dropdownValueSubCategory = 'less than 5 miles';
  String dropdownValuePriceRange = 'less than 5 miles';
  List<String> categoryList = ['All'];
  List<String> beautyCategoryList = [
    'All',
    'Hair',
    'MakeUp',
    'Nails',
    'Lashes',
  ];
  List<String> musicCategoryList = [
    'All',
    'Producer',
    'DJ',
  ];
  List<String> photographyCategoryList = [
    'All',
    'Photo Editing',
    'Video Editing',
  ];
  List<String> serviceTypeList = [
    'All',
    'Beauty',
    'Cooking',
    'Music',
    'Photography',
    'Roommates'
  ];
  // Roommate filtering list
  List<String> bedroomList = ['All', '1', '2', '3+'];
  List<String> distanceList = [
    'All',
    'less than 5 miles',
    '5-10 miles',
    '10-15 miles',
    '15+ miles'
  ];
  List<String> petAllowedList = ['All', 'Yes', 'No'];
  List<String> prefGenderList = ['All', 'Male', 'Female'];
  // roommate filtering dropdown
  String dropdownValueBedroom = 'All';
  String dropdownValueDistance = 'All';
  String dropdownValuePetAllowed = 'All';
  String dropdownValuePrefGender = 'All';
  // roommate filtering dropdownlist value
  List<String> bedroomDropDownList = ['All'];
  List<String> distanceDropDownList = ['All'];
  List<String> petDropDownList = ['All'];
  List<String> genderDropDownList = ['All'];

  @override
  Widget build(BuildContext context) {
    Provider.of<AppData>(context, listen: false).updatefoundRoommatePostList(
        Provider.of<AppData>(context, listen: false).roommatePostDataList);
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Search"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Select A Service',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            SizedBox(
              height: 12,
            ),
            DropdownButton<String>(
              value: dropdownValueServiceTitle,
              iconSize: 30,
              elevation: 16,
              style: const TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.bold),
              underline: Container(
                height: 1,
                color: Colors.black54,
              ),
              onChanged: (String? newValue) {
                if (newValue == 'Beauty') {
                  categoryList = [];
                  setState(() {
                    // bedroomDropDownList = ['All'];
                    // distanceDropDownList = ['All'];
                    // petDropDownList = ['All'];
                    // genderDropDownList = ['All'];
                    categoryList = categoryList + beautyCategoryList;
                  });
                } else if (newValue == 'Roommates') {
                  bedroomDropDownList = [];
                  distanceDropDownList = [];
                  petDropDownList = [];
                  genderDropDownList = [];
                  setState(() {
                    categoryList = ['All'];
                    bedroomDropDownList = bedroomList + bedroomDropDownList;
                    distanceDropDownList = distanceDropDownList + distanceList;
                    petDropDownList = petDropDownList + petAllowedList;
                    genderDropDownList = genderDropDownList + prefGenderList;
                  });
                }
                setState(() {
                  dropdownValueServiceTitle = newValue!;
                });
              },
              items:
                  serviceTypeList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 12,
            ),
            categoryList.length == 1
                ? Column()
                : Column(
                    children: [
                      Text('Select A Category'),
                      SizedBox(
                        height: 12,
                      ),
                      DropdownButton<String>(
                        value: dropdownValueCategory,
                        iconSize: 30,
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold),
                        underline: Container(
                          height: 1,
                          color: Colors.black54,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueCategory = newValue!;
                          });
                        },
                        items: categoryList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
            SizedBox(
              height: 12,
            ),
            bedroomDropDownList.length == 1
                ? Column()
                : Column(
                    children: [
                      Text('Select Avaiable Bedroom'),
                      SizedBox(
                        height: 12,
                      ),
                      DropdownButton<String>(
                        value: dropdownValueBedroom,
                        iconSize: 30,
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold),
                        underline: Container(
                          height: 1,
                          color: Colors.black54,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueBedroom = newValue!;
                            print(
                                'bedroom value selected = $dropdownValueBedroom');
                          });
                        },
                        items: bedroomDropDownList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
            SizedBox(
              height: 12,
            ),
            distanceDropDownList.length == 1
                ? Column()
                : Column(
                    children: [
                      Text('Select Distance From School'),
                      SizedBox(
                        height: 12,
                      ),
                      DropdownButton<String>(
                        value: dropdownValueDistance,
                        iconSize: 30,
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold),
                        underline: Container(
                          height: 1,
                          color: Colors.black54,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueDistance = newValue!;
                          });
                        },
                        items: distanceDropDownList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
            SizedBox(
              height: 12,
            ),
            petDropDownList.length == 1
                ? Column()
                : Column(
                    children: [
                      Text('Pet Permission'),
                      SizedBox(
                        height: 12,
                      ),
                      DropdownButton<String>(
                        value: dropdownValuePetAllowed,
                        iconSize: 30,
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold),
                        underline: Container(
                          height: 1,
                          color: Colors.black54,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValuePetAllowed = newValue!;
                          });
                        },
                        items: petDropDownList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
            SizedBox(
              height: 12,
            ),
            genderDropDownList.length == 1
                ? Column()
                : Column(
                    children: [
                      Text('Select Preferred Gender'),
                      SizedBox(
                        height: 12,
                      ),
                      DropdownButton<String>(
                        value: dropdownValuePrefGender,
                        iconSize: 30,
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold),
                        underline: Container(
                          height: 1,
                          color: Colors.black54,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValuePrefGender = newValue!;
                          });
                        },
                        items: genderDropDownList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
            // SizedBox(
            //   height: 12,
            // ),
            // Text('Select A Sub_Category'),
            // SizedBox(
            //   height: 12,
            // ),
            // DropdownButton<String>(
            //   value: dropdownValueSubCategory,
            //   icon: const Icon(Icons.arrow_downward),
            //   iconSize: 24,
            //   elevation: 16,
            //   style: const TextStyle(
            //       color: Colors.black54, fontWeight: FontWeight.bold),
            //   underline: Container(
            //     height: 2,
            //     color: Colors.black54,
            //   ),
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       dropdownValueSubCategory = newValue!;
            //     });
            //   },
            //   items: <String>[
            //     'less than 5 miles',
            //     '5-10 miles',
            //     '10-15 miles',
            //     '15+ miles'
            //   ].map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),
            // SizedBox(
            //   height: 12,
            // ),
            // Text('Select A Price Range'),
            // SizedBox(
            //   height: 12,
            // ),
            // DropdownButton<String>(
            //   value: dropdownValuePriceRange,
            //   icon: const Icon(Icons.arrow_downward),
            //   iconSize: 24,
            //   elevation: 16,
            //   style: const TextStyle(
            //       color: Colors.black54, fontWeight: FontWeight.bold),
            //   underline: Container(
            //     height: 2,
            //     color: Colors.black54,
            //   ),
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       dropdownValuePriceRange = newValue!;
            //     });
            //   },
            //   items: <String>[
            //     'less than 5 miles',
            //     '5-10 miles',
            //     '10-15 miles',
            //     '15+ miles'
            //   ].map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),
            // SizedBox(
            //   height: 12,
            // ),
            SizedBox(
              height: 30,
            ),
            dropdownValueServiceTitle != 'All'
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(150, 50),
                        maximumSize: const Size(150, 50),
                        backgroundColor: Colors.deepOrange),
                    onPressed: () {
                      runFilterRoommate(
                          dropdownValueBedroom,
                          dropdownValueDistance,
                          dropdownValuePetAllowed,
                          dropdownValuePrefGender);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServicePage()));
                    },
                    child: Text(
                      'Apply Filters',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ))
                : Container(),
          ],
        ),
      ),
    );
  }

  // This function is called whenever the text field changes
  void runFilterRoommate(String bed, String away, String pet, String gender) {
    print('bedroom = $bed');
    print('distance = $away');
    print('pet = $pet');
    print('gender = $gender');
    print('chalo');
    List<RoommatesModel> results = [];
    if (bed == 'All') {
      print('bed is empty bro.. bed the passed variable');
      // if the search field is empty or only contains white-space, we'll display all users
      results =
          Provider.of<AppData>(context, listen: false).roommatePostDataList;
    } else {
      print('bed value bro = $bed');
      results = Provider.of<AppData>(context, listen: false)
          .roommatePostDataList
          .where((element) {
        final roomMate = element.roomMateBedrooms!.toLowerCase();
        final filtertto = bed.toLowerCase();
        return roomMate == filtertto;
      })
          // .where((element) => element.roomMateDistance!
          //     .toLowerCase()
          //     .contains(away.toLowerCase()))
          // .where((element) => element.roomMatePetAllowed!
          //     .toLowerCase()
          //     .contains(pet.toLowerCase()))
          // .where((element) => element.roomMatePrefGender!
          //     .toLowerCase()
          //     .contains(gender.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    // Refresh the UI
    setState(() {
      Provider.of<AppData>(context, listen: false)
          .updatefoundRoommatePostList(results);
    });
  }
}
