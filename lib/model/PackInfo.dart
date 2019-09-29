class PackInfo {
  int packageId;
  String packageName;
  String currency;
  String cost;
  int data;
  int cycleTimeType;
  int cycleTime;
  int timeZone;
  String remark;
  List<dynamic> country;

  PackInfo(
      {this.packageId,
      this.packageName,
      this.currency,
      this.cost,
      this.data,
      this.cycleTimeType,
      this.cycleTime,
      this.timeZone,
      this.remark,
      this.country});

  PackInfo.fromJson(Map<String, dynamic> json) {
    packageId = json['package_id'];
    packageName = json['package_name'];
    currency = json['currency'];
    cost = json['cost'];
    data = json['data'];
    cycleTimeType = json['cycle_time_type'];
    cycleTime = json['cycle_time'];
    timeZone = json['time_zone'];
    remark = json['remark'];
    country = json['country'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_id'] = this.packageId;
    data['package_name'] = this.packageName;
    data['currency'] = this.currency;
    data['cost'] = this.cost;
    data['data'] = this.data;
    data['cycle_time_type'] = this.cycleTimeType;
    data['cycle_time'] = this.cycleTime;
    data['time_zone'] = this.timeZone;
    data['remark'] = this.remark;
    data['country'] = this.country;
    return data;
  }
}
