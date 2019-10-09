class UsedDetail {
  String itfName;
  String transSerial;
  int errCode;
  String errDesc;
  List<Used> used;

  UsedDetail(
      {this.itfName, this.transSerial, this.errCode, this.errDesc, this.used});

  UsedDetail.fromJson(Map<String, dynamic> json) {
    itfName = json['itf_name'];
    transSerial = json['trans_serial'];
    errCode = json['err_code'];
    errDesc = json['err_desc'];
    if (json['used'] != null) {
      used = new List<Used>();
      json['used'].forEach((v) {
        used.add(new Used.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itf_name'] = this.itfName;
    data['trans_serial'] = this.transSerial;
    data['err_code'] = this.errCode;
    data['err_desc'] = this.errDesc;
    if (this.used != null) {
      data['used'] = this.used.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Used {
  String country;
  String packageName;
  int usedData;
  String endDate;

  Used({this.country, this.packageName, this.usedData, this.endDate});

  Used.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    packageName = json['package_name'];
    usedData = json['used_data'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['package_name'] = this.packageName;
    data['used_data'] = this.usedData;
    data['end_date'] = this.endDate;
    return data;
  }
}
