import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:konnect/utils/HttpUtil.dart';

import 'config/AppConfig.dart';

class TutorialFragment extends StatelessWidget {
  final tutorialItems = [
    TutorialItem(
        "NUU Konnect basic operation", "assets/videos/buy_package.mp4"),
    TutorialItem(
        "how to connect NUU Konnect i1", "assets/videos/connect_wifi.mp4"),
    TutorialItem("how to buy package", "assets/videos/on_off_reset.mp4"),
  ];

  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(
      color: Colors.blue,
    );
    Widget divider2 = Divider(color: Colors.green);
    return ListView.separated(
      itemCount: tutorialItems.length,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return Column(children: <Widget>[
          Text(tutorialItems[index].title),
          Text(tutorialItems[index].resId),
        ]);
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    );
  }

}

class TutorialItem {
  String title;
  String resId;

  TutorialItem(this.title, this.resId);
}
