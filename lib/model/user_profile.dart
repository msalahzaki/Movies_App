/// message : "Profile fetched successfully"
/// data : {"_id":"679b5f98d981b4ed9b2b6b57","email":"msalahzaki@gmail.com","password":"$2b$10$xoLtYVqjMWygiKay6ieXDOYVp09SdTs6bRHkzCi2rE4.nKXadmI06","name":"Mohamed Salah","phone":"+201234567889","avaterId":2,"createdAt":"2025-01-30T11:16:40.316Z","updatedAt":"2025-01-30T11:16:40.316Z","__v":0}
library;

class UserProfile {
  UserProfile({
    this.message,
    this.data,
  });

  UserProfile.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

/// _id : "679b5f98d981b4ed9b2b6b57"
/// email : "msalahzaki@gmail.com"
/// password : "$2b$10$xoLtYVqjMWygiKay6ieXDOYVp09SdTs6bRHkzCi2rE4.nKXadmI06"
/// name : "Mohamed Salah"
/// phone : "+201234567889"
/// avaterId : 2
/// createdAt : "2025-01-30T11:16:40.316Z"
/// updatedAt : "2025-01-30T11:16:40.316Z"
/// __v : 0

class Data {
  Data({
    this.id,
    this.email,
    this.password,
    this.name,
    this.phone,
    this.avaterId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    avaterId = json['avaterId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }
  String? id;
  String? email;
  String? password;
  String? name;
  String? phone;
  int? avaterId;
  String? createdAt;
  String? updatedAt;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['phone'] = phone;
    map['avaterId'] = avaterId;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }
}
