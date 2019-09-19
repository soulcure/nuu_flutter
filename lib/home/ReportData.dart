class ReportData {
  int adb;
  int charge;
  String deviceId;
  String deviceSN;
  int hotAmount;
  int hotPoint;
  String ip;
  String mac;
  int netBrock;
  int netStatus;
  int pow;
  Sim sim1;
  Sim sim2;
  String speedState;
  int unixTime;

  ReportData(
      {this.adb,
      this.charge,
      this.deviceId,
      this.deviceSN,
      this.hotAmount,
      this.hotPoint,
      this.ip,
      this.mac,
      this.netBrock,
      this.netStatus,
      this.pow,
      this.sim1,
      this.sim2,
      this.speedState,
      this.unixTime});

  ReportData.fromJson(Map<String, dynamic> json) {
    adb = json['adb'];
    charge = json['charge'];
    deviceId = json['deviceId'];
    deviceSN = json['deviceSN'];
    hotAmount = json['hotAmount'];
    hotPoint = json['hotPoint'];
    ip = json['ip'];
    mac = json['mac'];
    netBrock = json['netBrock'];
    netStatus = json['netStatus'];
    pow = json['pow'];
    sim1 = json['sim1'] != null ? new Sim.fromJson(json['sim1']) : null;
    sim2 = json['sim2'] != null ? new Sim.fromJson(json['sim2']) : null;
    speedState = json['speedState'];
    unixTime = json['unixTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adb'] = this.adb;
    data['charge'] = this.charge;
    data['deviceId'] = this.deviceId;
    data['deviceSN'] = this.deviceSN;
    data['hotAmount'] = this.hotAmount;
    data['hotPoint'] = this.hotPoint;
    data['ip'] = this.ip;
    data['mac'] = this.mac;
    data['netBrock'] = this.netBrock;
    data['netStatus'] = this.netStatus;
    data['pow'] = this.pow;
    if (this.sim1 != null) {
      data['sim1'] = this.sim1.toJson();
    }
    if (this.sim2 != null) {
      data['sim2'] = this.sim2.toJson();
    }
    data['speedState'] = this.speedState;
    data['unixTime'] = this.unixTime;
    return data;
  }
}

class Sim {
  int ci;
  String imsi;
  int lac;
  int netMode;
  String plmn;
  int psc;
  int signal;

  Sim(
      {this.ci,
      this.imsi,
      this.lac,
      this.netMode,
      this.plmn,
      this.psc,
      this.signal});

  Sim.fromJson(Map<String, dynamic> json) {
    ci = json['ci'];
    imsi = json['imsi'];
    lac = json['lac'];
    netMode = json['netMode'];
    plmn = json['plmn'];
    psc = json['psc'];
    signal = json['signal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ci'] = this.ci;
    data['imsi'] = this.imsi;
    data['lac'] = this.lac;
    data['netMode'] = this.netMode;
    data['plmn'] = this.plmn;
    data['psc'] = this.psc;
    data['signal'] = this.signal;
    return data;
  }
}
