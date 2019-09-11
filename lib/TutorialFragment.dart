import 'package:flutter/material.dart';
import 'VideosState.dart';




class TutorialFragment extends StatefulWidget {
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<TutorialFragment> {

  final tutorialItems = [
    TutorialItem(
        "NUU Konnect basic operation", "assets/videos/buy_package.mp4"),
    TutorialItem(
        "how to connect NUU Konnect i1", "assets/videos/connect_wifi.mp4"),
    TutorialItem("how to buy package", "assets/videos/on_off_reset.mp4"),
  ];

  @override
  void initState() {
    super.initState();
  }

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
          Container(
            height: 250,
            child: VideoPlayerScreen(path: tutorialItems[index].resId),
          ),
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
