import 'package:connext/models/service.dart';
import 'package:connext/utility/my_roommate_post_tile.dart';
import 'package:connext/utility/my_service_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/appData.dart';
import '../utility/post_details.dart';
import '../utility/roommate_details.dart';

class MyPostList extends StatefulWidget {
  const MyPostList({Key? key}) : super(key: key);

  @override
  State<MyPostList> createState() => _MyPostListState();
}

class _MyPostListState extends State<MyPostList> {
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
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Post List'),
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                              },
                              child: MyServiceList(_foundUsers[index]),
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
                )
              : Flexible(
                  child: Provider.of<AppData>(context, listen: false)
                          .myRoommatePostDataList
                          .isNotEmpty
                      ? ListView.builder(
                          itemCount:
                              Provider.of<AppData>(context, listen: false)
                                  .myRoommatePostDataList
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
                                                    .myRoommatePostDataList[
                                                index])));
                              },
                              child: MyRoomMateList(
                                  Provider.of<AppData>(context, listen: false)
                                      .myRoommatePostDataList[index]),
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
          // ListView.separated(
          //   scrollDirection: Axis.vertical,
          //   itemBuilder: (BuildContext context, index) {
          //     return GestureDetector(
          //       onTap: () {
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => RoommateDetails(
          //                     Provider.of<AppData>(context,
          //                             listen: false)
          //                         .myRoommatePostDataList[index])));
          //       },
          //       child: MyRoomMateList(
          //           Provider.of<AppData>(context, listen: false)
          //               .myRoommatePostDataList[index]),
          //     );
          //   },
          //   separatorBuilder: (BuildContext context, index) =>
          //       SizedBox(
          //     height: 3,
          //   ),
          //   itemCount: Provider.of<AppData>(context, listen: false)
          //       .myRoommatePostDataList
          //       .length,
          //   padding: EdgeInsets.all(5),
          //   physics: ClampingScrollPhysics(),
          //   shrinkWrap: true,
          // ),
        ],
      ),
    );
  }
}
