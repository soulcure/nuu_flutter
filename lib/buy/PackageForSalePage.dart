import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:fluintl/fluintl.dart';
import 'package:flutter/material.dart';
import 'package:konnect/config/AppConfig.dart';
import 'package:konnect/http/HttpUtil.dart';
import 'package:konnect/model/PackInfo.dart';
import 'package:konnect/res/strings.dart';

import 'CountryDropDownPage.dart';
import 'PackageListPage.dart';

class PackageForSalePage extends StatefulWidget {
  final String deviceSN;

  PackageForSalePage(this.deviceSN);

  @override
  State<StatefulWidget> createState() => _PackageForSaleState();
}

class _PackageForSaleState extends State<PackageForSalePage> {
  GlobalKey<CountryDropDownState> _dropdownKey = GlobalKey();
  GlobalKey<PackListState> _packKey = GlobalKey();

  var countries = List<String>();

  var packLists = List<PackInfo>();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(IntlUtil.getString(context, Ids.packageTitle)),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Text(IntlUtil.getString(context, Ids.chooseCountry)),
              CountryDropDownPage(_dropdownKey),
            ],
          ),
          Expanded(
            child: ListViewPackage(_packKey, widget.deviceSN),
          ),
        ],
      ),
    );
  }

  _getData() async {
    FormData formData = new FormData.from({
      'deviceSn': widget.deviceSN,
    });
    var response =
        await HttpUtil.post(AppConfig.PACKAGE_FOR_SALE, data: formData);

    List movies = response['package'];
    LinkedHashSet set = LinkedHashSet();
    for (var item in movies) {
      var packageId = item['package_id'];
      var packageName = item['package_name'];
      var currency = item['currency'];
      var cost = item['cost'];
      var data = item['data'];
      var cycleTimeType = item['cycle_time_type'];
      var cycleTime = item['cycle_time'];
      var timeZone = item['time_zone'];
      var remark = item['remark'];
      var country = item['country'];

      PackInfo packInfo = PackInfo(
          packageId: packageId,
          packageName: packageName,
          currency: currency,
          cost: cost,
          data: data,
          cycleTimeType: cycleTimeType,
          cycleTime: cycleTime,
          timeZone: timeZone,
          remark: remark,
          country: country);

      packLists.add(packInfo);

      print('print country:$country');
      set.addAll(country);
    }

    countries = List.from(set);

    print('print countries:$countries');

    _dropdownKey.currentState.onSuccess(countries, callback);
    _packKey.currentState.onSuccess(packLists);
  }

  callback(String select) {
    var tempList = List<PackInfo>();
    for (var item in packLists) {
      if (item.country.contains(select)) {
        tempList.add(item);
      }
    }
    _packKey.currentState.onSuccess(tempList);
  }
}
