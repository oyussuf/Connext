import 'package:connext/models/service.dart';
import 'package:connext/utility/roommate_details.dart';
import 'package:connext/utility/roommate_tile.dart';
import 'package:connext/utility/service_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/appData.dart';
import '../utility/post_details.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  // This list holds the data for the list view
  List<Service> _foundUsers = [];
  bool showService = true;
  Color textColorService = Colors.white;
  Color textColorRoomMates = Colors.black;
  Color backColorService = Colors.deepOrange.shade400;
  Color backColorRoomMates = Colors.grey.shade400;

  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = Provider.of<AppData>(context, listen: false).serviceDataList;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _foundUsers.sort((a, b) {
      DateTime dateTime = DateTime.parse(b.postedDateTime!);
      DateTime now = DateTime.parse(a.postedDateTime!);
      return dateTime.microsecondsSinceEpoch
          .compareTo(now.microsecondsSinceEpoch);
    });
    Provider.of<AppData>(context, listen: false).foundRoommatePost.sort((a, b) {
      DateTime dateTime = DateTime.parse(b.roomMatePostedDate!);
      DateTime now = DateTime.parse(a.roomMatePostedDate!);
      return dateTime.microsecondsSinceEpoch
          .compareTo(now.microsecondsSinceEpoch);
    });
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    if (Provider.of<AppData>(context, listen: false)
        .foundRoommatePost
        .isEmpty) {
      Provider.of<AppData>(context, listen: false).updatefoundRoommatePostList(
          Provider.of<AppData>(context, listen: false).roommatePostDataList);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    showService = true;
                    textColorService = Colors.white;
                    textColorRoomMates = Colors.black;
                    backColorService = Colors.deepOrange.shade400;
                    backColorRoomMates = Colors.grey.shade400;
                  });
                },
                child: Container(
                  color: backColorService,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    'Service',
                    style: TextStyle(
                        color: textColorService,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                  width: screenWidth / 2,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showService = false;
                    textColorService = Colors.black;
                    textColorRoomMates = Colors.white;
                    backColorService = Colors.grey.shade400;
                    backColorRoomMates = Colors.deepOrange.shade400;
                  });
                },
                child: Container(
                  color: backColorRoomMates,
                  height: 50,
                  child: Text(
                    'Roommates',
                    style: TextStyle(
                        color: textColorRoomMates,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                  width: screenWidth / 2,
                  alignment: Alignment.center,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            onChanged: (value) => _runFilter(value),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
              hintText: "Search",
              suffixIcon: const Icon(Icons.search),
              // prefix: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          showService
              ? Flexible(
                  child: _foundUsers.isNotEmpty
                      ? ListView.builder(
                          itemCount: _foundUsers.length,
                          itemBuilder: (context, index) => Card(
                            elevation: 1,
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PostDetailed(_foundUsers[index])));
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => HomeScreen()));
                              },
                              child: ServiceTile(_foundUsers[index]),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(20),
                          child: const Text(
                            'No results found Please try with diffrent search',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                )
              : Flexible(
                  child: Provider.of<AppData>(context, listen: false)
                          .foundRoommatePost
                          .isNotEmpty
                      ? ListView.builder(
                          itemCount:
                              Provider.of<AppData>(context, listen: false)
                                  .foundRoommatePost
                                  .length,
                          itemBuilder: (context, index) => Card(
                            elevation: 1,
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RoommateDetails(
                                            Provider.of<AppData>(context,
                                                    listen: false)
                                                .foundRoommatePost[index])));
                              },
                              child: RoomMateTiles(
                                  Provider.of<AppData>(context, listen: false)
                                      .foundRoommatePost[index]),
                              // child: ListTile(
                              //   leading: CircleAvatar(
                              //     radius: 30.0,
                              //     backgroundImage: NetworkImage(
                              //         _foundUsers[index].postedByImage!),
                              //     backgroundColor: Colors.transparent,
                              //   ),
                              //   title: Text(_foundUsers[index].postedByName!),
                              //   subtitle: Text('${_foundUsers[index].serviceName}'),
                              // ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(20),
                          child: const Text(
                            'No results found Please try with diffrent search',
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                ),
        ],
      ),
    );
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Service> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = Provider.of<AppData>(context, listen: false).serviceDataList;
    } else {
      results = Provider.of<AppData>(context, listen: false)
          .serviceDataList
          .where((element) => element.serviceName!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();

      // we use the toLowerCase() method to make it case-insensitive
      // Refresh the UI
      setState(() {
        _foundUsers = results;
      });
    }
  }
}
