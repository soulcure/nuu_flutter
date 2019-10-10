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

  Function func;

  void onSuccess(List<String> list, Function func) {
    setState(() {
      countries = list;
      this.func = func;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0),
      alignment: AlignmentDirectional.center,
      child: DropdownButton(
        hint: Container(
          padding: EdgeInsets.only(left: 15.0),
          alignment: AlignmentDirectional.center,
          child: Text("all"),
        ),
        items: countries.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        value: dropdownSelectedItem,
        onChanged: (val) {
          dropdownSelectedItem = val;
          this.func(val);
          setState(() {});
        },
      ),
    );
  }
}
