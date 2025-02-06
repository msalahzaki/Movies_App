class UserModel {
  UserModel({required this.message, required this.token});

  final String message;
  final String token;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(message: json['message'] ?? "", token: json['data'] ?? "");
  }

  Map<String, dynamic> toJson() => {'message': message, 'token': token};
}
