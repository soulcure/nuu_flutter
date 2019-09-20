class Profile {
  String token;
  int expired;
  int id;
  String uuid;
  String username;
  String email;

  Profile(
      {this.token,
      this.expired,
      this.id,
      this.uuid,
      this.username,
      this.email});

  Profile.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expired = json['expired'];
    id = json['id'];
    uuid = json['uuid'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expired'] = this.expired;
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['username'] = this.username;
    data['email'] = this.email;
    return data;
  }
}
