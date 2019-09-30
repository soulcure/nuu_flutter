import 'package:flutter/material.dart';

class CountryDropDownPage extends StatefulWidget {
  CountryDropDownPage(Key key) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CountryDropDownState();
  }
}

class CountryDropDownState extends State<CountryDropDownPage> {
  var countries = List<String>();
  var dropdownSelectedItem;

  void onSuccess(List<String> list) {
    setState(() {
      countries = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text("all"),
      items: countries.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      value: dropdownSelectedItem,
      onChanged: (val) {
        dropdownSelectedItem = val;
        setState(() {});
      },
    );
  }
}