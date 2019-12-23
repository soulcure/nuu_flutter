import 'dart:convert';

class JsAccount {
  String sn;
  String token;
  String locale;

  JsAccount({this.sn, this.token, this.locale});

  JsAccount.fromJson(Map<String, dynamic> json) {
    sn = json['sn'];
    token = json['token'];
    locale = json['locale'];
  }

  String toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sn'] = this.sn;
    data['token'] = this.token;
    data['locale'] = this.locale;
    return json.encode(data);
  }
}
