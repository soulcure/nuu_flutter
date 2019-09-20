class BaseResp {
  int code;
  String msg;

  BaseResp({this.code, this.msg});

  BaseResp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    return data;
  }
}
