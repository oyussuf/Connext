import 'package:connext/models/service.dart';
import 'package:flutter/material.dart';

class ServiceTile extends StatelessWidget {
  Service servicemodel;
  ServiceTile(this.servicemodel);
  final double profileHeight = 144;
  String? picURL;
  DateTime dateTimeNow = DateTime.now();
  @override
  Widget build(BuildContext context) {
    picURL = servicemodel.postedByImage;
    DateTime dateTime = DateTime.parse(servicemodel.postedDateTime!);

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
                        '${servicemodel.serviceName}',
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
                        'Category',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            letterSpacing: 1),
                      ),
                      Text(
                        '${servicemodel.serviceCategory}',
                        style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sub-Category',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            letterSpacing: 1),
                      ),
                      Text(
                        '${servicemodel.serviceSubCategory}',
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
                        'Price',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            letterSpacing: 1),
                      ),
                      Text(
                        '\$ ${servicemodel.servicePrice}',
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
                ],
              ),
            ),
            Container(
              color: Colors.grey.shade300,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Posted By',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            letterSpacing: 1),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.white, width: 4)),
                        child: CircleAvatar(
                          radius: profileHeight / 4,
                          backgroundColor: Colors.grey.shade800,
                          backgroundImage: NetworkImage(picURL != null
                              ? picURL!
                              : 'https://firebasestorage.googleapis.com/v0/b/connext-pv.appspot.com/o/profilepictures%2FFile%3A%20\'%2Fdata%2Fuser%2F0%2Fcom.pvamu.connext.connext%2Fcache%2Fe8008a49-b929-4c42-9dee-763582f26904%2FIMG-20230328-WA0000.jpg\'?alt=media&token=36384ea8-5517-47ec-a371-0feaba5b0f41'),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                letterSpacing: 1),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            '${servicemodel.postedByName}',
                            style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
