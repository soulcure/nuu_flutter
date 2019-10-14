class PayResp {
  int code;
  String msg;
  Data data;

  PayResp({this.code, this.msg, this.data});

  bool isSuccess() {
    return code == 0;
  }

  bool needLogin() {
    return code == 300 || code == 301;
  }

  PayResp.fromJson(Map<String, dynamic> json) {
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
  String itfName;
  String transSerial;
  int errCode;
  String errDesc;
  int devicePackageId;
  String devicePackageIdList;
  String orderId;

  Data(
      {this.itfName,
      this.transSerial,
      this.errCode,
      this.errDesc,
      this.devicePackageId,
      this.devicePackageIdList,
      this.orderId});

  Data.fromJson(Map<String, dynamic> json) {
    itfName = json['itf_name'];
    transSerial = json['trans_serial'];
    errCode = json['err_code'];
    errDesc = json['err_desc'];
    devicePackageId = json['device_package_id'];
    devicePackageIdList = json['device_package_id_list'];
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itf_name'] = this.itfName;
    data['trans_serial'] = this.transSerial;
    data['err_code'] = this.errCode;
    data['err_desc'] = this.errDesc;
    data['device_package_id'] = this.devicePackageId;
    data['device_package_id_list'] = this.devicePackageIdList;
    data['order_id'] = this.orderId;
    return data;
  }
}
