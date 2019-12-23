class Payment {
  String money;
  String currency;
  String packageName;
  String invoice;
  String sandboxClientId;
  String liveClientId;
  bool isSendBox;

  Payment(
      {this.money,
        this.currency,
        this.packageName,
        this.invoice,
        this.sandboxClientId,
        this.liveClientId,
        this.isSendBox});

  Payment.fromJson(Map<String, dynamic> json) {
    money = json['money'].toString();
    currency = json['currency'];
    packageName = json['packageName'];
    invoice = json['invoice'];
    sandboxClientId = json['sandboxClientId'];
    liveClientId = json['liveClientId'];
    isSendBox = json['isSendBox'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['money'] = this.money;
    data['currency'] = this.currency;
    data['packageName'] = this.packageName;
    data['invoice'] = this.invoice;
    data['sandboxClientId'] = this.sandboxClientId;
    data['liveClientId'] = this.liveClientId;
    data['isSendBox'] = this.isSendBox;
    return data;
  }
}