import 'dart:math';

import 'package:connext/models/service.dart';
import 'package:flutter/material.dart';

import 'details.dart';

class PostDetailed extends StatefulWidget {
  Service servicemodel;
  PostDetailed(this.servicemodel);

  @override
  State<PostDetailed> createState() => _PostDetailedState();
}

class _PostDetailedState extends State<PostDetailed> {
  late PageController _pageController;
  List<String> dataList = [
    'https://firebasestorage.googleapis.com/v0/b/connext-pv.appspot.com/o/img1.png?alt=media&token=53bf2bf9-0d73-4d33-a0c2-2cb2f909f9fd',
  ];
  int _currentPage = 0;
  final double profileHeight = 144;
  String? picURL;
  DateTime dateTimeNow = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.servicemodel.serviceImage != null) {
      dataList[0] = widget.servicemodel.serviceImage!;
    }
    picURL = widget.servicemodel.postedByImage;
    DateTime dateTime = DateTime.parse(widget.servicemodel.postedDateTime!);

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

    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: Text('Service Details'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Center(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${timeAgo()}'),
                          Text(
                            '${widget.servicemodel.serviceName}',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w800,
                                fontSize: 24,
                                letterSpacing: 2),
                          ),
                          Text(
                            '${timeAgo()}',
                            style: TextStyle(color: Colors.transparent),
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
                            '${widget.servicemodel.serviceCategory}',
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
                            '${widget.servicemodel.serviceSubCategory}',
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
                SizedBox(
                  height: 1,
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            letterSpacing: 1),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '${widget.servicemodel.serviceDiscription}',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Images',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            letterSpacing: 1),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      AspectRatio(
                        aspectRatio: 1,
                        child: PageView.builder(
                            itemCount: dataList.length,
                            physics: const ClampingScrollPhysics(),
                            controller: _pageController,
                            itemBuilder: (context, index) {
                              return carouselView(index);
                            }),
                      )
                      // Image(
                      //   image:
                      //       NetworkImage("${widget.servicemodel.serviceImage}"),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1,
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
                                border:
                                    Border.all(color: Colors.white, width: 4)),
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
                                '${widget.servicemodel.postedByName}',
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
          )),
          Positioned(
              right: 10,
              top: 15,
              child: Row(
                children: [
                  Text(
                    '\$',
                    style: TextStyle(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        letterSpacing: 2),
                  ),
                  Text(
                    '${widget.servicemodel.servicePrice}',
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                    ),
                  )
                ],
              ))
        ],
      )),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
          print("value $value index $index");
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(dataList[index]),
        );
      },
    );
  }

  Widget carouselCard(String data) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Hero(
              tag: 'Images',
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                data: data,
                              )));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: NetworkImage('${data}'), fit: BoxFit.fill),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: Colors.black26)
                      ]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
