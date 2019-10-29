import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:konnect/buy/PackageInfoPage.dart';
import 'package:konnect/model/PackInfo.dart';
import 'package:konnect/res/strings.dart';

class ListViewPackage extends StatefulWidget {
  final String devicesSn;

  ListViewPackage(Key key, this.devicesSn) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PackListState();
  }
}

class PackListState extends State<ListViewPackage> {
  var packLists = List<PackInfo>();

  void onSuccess(List<PackInfo> list) {
    setState(() {
      packLists = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => _itemBuilder(context, index, packLists),
      itemCount: packLists.length * 2,
    );
  }

  Widget _itemBuilder(BuildContext context, int index, List<PackInfo> packs) {
    if (index.isOdd) {
      return Divider();
    }
    index = index ~/ 2;

    int cycleTime = packs[index].cycleTime;
    int cycleTimeType = packs[index].cycleTimeType;

    var list = packs[index].country;
    String country = "";
    if (list != null && list.length > 0) {
      for (int i = 0; i < list.length; i++) {
        country = country + list[i];
        if (i < list.length - 1) {
          country = country + " , ";
        }
      }
    }

    String type;
    switch (cycleTimeType) {
      case 1:
        type = IntlUtil.getString(context, Ids.day);
        break;
      case 3:
        type = IntlUtil.getString(context, Ids.month);
        break;
      case 4:
        type = IntlUtil.getString(context, Ids.year);
        break;
      case 5:
        type = IntlUtil.getString(context, Ids.hour);
        break;
      default:
        type = IntlUtil.getString(context, Ids.day);
        break;
    }
    String time = IntlUtil.getString(context, Ids.cycleTimeValue,
        params: [cycleTime, type]);

    return InkWell(
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(IntlUtil.getString(context, Ids.packageName),
                    style: TextStyle(color: Color(0xFF122634))),
                SizedBox(
                  width: 10.0,
                ),
                Text(packs[index].packageName,
                    style: TextStyle(color: Color(0xFFACACAC))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(IntlUtil.getString(context, Ids.packageType),
                    style: TextStyle(color: Color(0xFF122634))),
                SizedBox(
                  width: 10.0,
                ),
                Text(packs[index].currency,
                    style: TextStyle(color: Color(0xFFACACAC))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(IntlUtil.getString(context, Ids.data),
                    style: TextStyle(color: Color(0xFF122634))),
                SizedBox(
                  width: 10.0,
                ),
                Text(packs[index].cost,
                    style: TextStyle(color: Color(0xFFACACAC))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(IntlUtil.getString(context, Ids.cycleTime),
                    style: TextStyle(color: Color(0xFF122634))),
                SizedBox(
                  width: 10.0,
                ),
                Text(time, style: TextStyle(color: Color(0xFFACACAC))),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Row(
//          spacing: 8.0, // 主轴(水平)方向间距
//          runSpacing: 4.0, // 纵轴（垂直）方向间距
//          alignment: WrapAlignment.center, //沿主轴方向居中
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Text(IntlUtil.getString(context, Ids.useCountry),
                    style: TextStyle(color: Color(0xFF122634))),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Text(
                    country,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color(0xFFACACAC)),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
        ]),
        onTap: () {
          _buyPack(packs[index]);
        });
  }

  _buyPack(PackInfo pack) async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PackageInfoPage(pack.packageId, pack.cost,
                pack.currency, pack.packageName, widget.devicesSn)));

    print('paypal result: $result');
    String title;
    if (result) {
      title = 'buy package success';
    } else {
      title = 'buy package failure';
    }

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(title),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(IntlUtil.getString(context, Ids.confirm)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }
}
