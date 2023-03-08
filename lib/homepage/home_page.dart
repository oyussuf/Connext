import 'package:connext/homepage/profile_page.dart';
import 'package:connext/homepage/service_page.dart';
import 'package:connext/utility/service_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/appData.dart';
import 'event_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndexBot = 0;
  final screens = [HomePage(), EventPage(), ServicePage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    print(
        'in Page Event Page //  TripHistoryDataList :: ${Provider.of<AppData>(context, listen: false).serviceDataList.length}');
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 60),
        child: ListView.separated(
          itemBuilder: (BuildContext context, index) {
            return ServiceItem(
              serviceM: Provider.of<AppData>(context, listen: false)
                  .serviceDataList[index],
            );
          },
          separatorBuilder: (BuildContext context, index) => SizedBox(
            height: 2,
          ),
          itemCount: Provider.of<AppData>(context, listen: false)
              .serviceDataList
              .length,
          padding: EdgeInsets.all(5),
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
        ),
      ),
    );
  }
}
