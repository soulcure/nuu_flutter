class Device {
  String _deviceSN;
  String _deviceId;

  Device(this._deviceSN, this._deviceId);

  String get deviceSN => _deviceSN;

  String get deviceId => _deviceId;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['deviceSN'] = _deviceSN;
    map['deviceId'] = _deviceId;
    return map;
  }

  Device.fromMap(Map<String, dynamic> map) {
    this._deviceSN = map['deviceSN'];
    this._deviceId = map['deviceId'];
  }
}
