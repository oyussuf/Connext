import 'package:connext/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/roomMateModel.dart';
import 'loading_screen.dart';

class MyRoomMateList extends StatelessWidget {
  RoommatesModel roommateModel;
  MyRoomMateList(this.roommateModel);
  final double profileHeight = 144;
  String? picURL;
  DateTime dateTimeNow = DateTime.now();
  @override
  Widget build(BuildContext context) {
    picURL = roommateModel.postedImage;
    DateTime dateTime = DateTime.parse(roommateModel.roomMatePostedDate!);
    print('${dateTime.difference(dateTimeNow)}');

    String timeAgo({bool numericDates = true}) {
      final date2 = DateTime.now();
      final difference = date2.difference(dateTime);

      if ((difference.inDays / 7).floor() >= 1) {
        return (numericDates) ? '1w ago' : 'Last week';
      } else if (difference.inDays >= 2) {
        return '${difference.inDays} days ago';
      } else if (difference.inDays >= 1) {
        return (numericDates) ? '1d ago' : 'Yesterday';
      } else if (difference.inHours >= 2) {
        return '${difference.inHours}h ago';
      } else if (difference.inHours >= 1) {
        return (numericDates) ? '1h ago' : 'An hour ago';
      } else if (difference.inMinutes >= 2) {
        return '${difference.inMinutes}m ago';
      } else if (difference.inMinutes >= 1) {
        return (numericDates) ? '1m ago' : 'A minute ago';
      } else if (difference.inSeconds >= 3) {
        return '${difference.inSeconds}s ago';
      } else {
        return 'Just now';
      }
    }

    print(timeAgo().toString());
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade300,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${roommateModel.roomMateTitle}',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 24,
                            letterSpacing: 2),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bedroom',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            letterSpacing: 1),
                      ),
                      Text(
                        '${roommateModel.roomMateBedrooms}',
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Away',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            letterSpacing: 1),
                      ),
                      Text(
                        '${roommateModel.roomMateDistance}',
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pets Allowed',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            letterSpacing: 1),
                      ),
                      Text(
                        '${roommateModel.roomMatePetAllowed}',
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Preferred Gender',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            letterSpacing: 1),
                      ),
                      Text(
                        '${roommateModel.roomMatePrefGender}',
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Monthly Rent',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            letterSpacing: 1),
                      ),
                      Text(
                        '\$ ${roommateModel.roomMateRent}',
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Posted On',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            letterSpacing: 1),
                      ),
                      Text(
                        '${timeAgo()}',
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(120, 50),
                                maximumSize: const Size(120, 50),
                                backgroundColor: Colors.deepOrange),
                            onPressed: () {
                              roommateRef
                                  .child(roommateModel.roomMateKey!)
                                  .remove();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoadingScreen()),
                                  (route) => false);
                            },
                            child: Text(
                              'Delete Post',
                              style: TextStyle(fontSize: 14, letterSpacing: 1),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
