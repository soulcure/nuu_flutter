import 'package:konnect/model/Profile.dart';

class LoginResp {
  int code;
  String msg;
  Profile profile;

  LoginResp({this.code, this.msg, this.profile});

  LoginResp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    profile = json['data'] != null ? new Profile.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.profile != null) {
      data['data'] = this.profile.toJson();
    }
    return data;
  }
}
