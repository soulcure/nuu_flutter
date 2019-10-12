class Order {
  int code;
  String msg;
  Data data;

  Order({this.code, this.msg, this.data});

  bool isSuccess() {
    return code == 0;
  }

  bool needLogin() {
    return code == 300 || code == 301;
  }

  Order.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String orderId;
  String money;

  Data({this.orderId, this.money});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    money = json['money'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['money'] = this.money;
    return data;
  }
}
