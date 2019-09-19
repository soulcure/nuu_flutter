class DetailToday {
  String itfName;
  String transSerial;
  int errCode;
  String errDesc;
  String date;
  int usedData;
  int totalData;
  List<UsedDtl> usedDtl;

  DetailToday(
      {this.itfName,
      this.transSerial,
      this.errCode,
      this.errDesc,
      this.date,
      this.usedData,
      this.totalData,
      this.usedDtl});

  DetailToday.fromJson(Map<String, dynamic> json) {
    itfName = json['itf_name'];
    transSerial = json['trans_serial'];
    errCode = json['err_code'];
    errDesc = json['err_desc'];
    date = json['date'];
    usedData = json['used_data'];
    totalData = json['total_data'];
    if (json['used_dtl'] != null) {
      usedDtl = new List<UsedDtl>();
      json['used_dtl'].forEach((v) {
        usedDtl.add(new UsedDtl.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itf_name'] = this.itfName;
    data['trans_serial'] = this.transSerial;
    data['err_code'] = this.errCode;
    data['err_desc'] = this.errDesc;
    data['date'] = this.date;
    data['used_data'] = this.usedData;
    data['total_data'] = this.totalData;
    if (this.usedDtl != null) {
      data['used_dtl'] = this.usedDtl.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UsedDtl {
  int mcc;
  String country;
  int usedData;

  UsedDtl({this.mcc, this.country, this.usedData});

  UsedDtl.fromJson(Map<String, dynamic> json) {
    mcc = json['mcc'];
    country = json['country'];
    usedData = json['used_data '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mcc'] = this.mcc;
    data['country'] = this.country;
    data['used_data '] = this.usedData;
    return data;
  }
}
