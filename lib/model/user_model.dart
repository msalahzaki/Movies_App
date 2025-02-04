class UserModel {
  UserModel(
      {required this.email,
      required this.password,
      required this.message,
      required this.token});

  final String email;
  final String password;
  final String message;
  final String token;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json["email"] ?? "",
        password: json["password"] ?? "",
        message: json['message'] ?? "",
        token: json['data'] ?? "");
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        "email": email,
        "password": password,
        'token': token
      };
}
