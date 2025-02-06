
  class UserModel {
  String? message;
  String? error;
  int? statusCode;
  String? token;

  UserModel({
  required this.message,
  required this.error,
  required this.statusCode,
  required this.token,
  });

   UserModel.fromJson(Map<String, dynamic> json) {
  token= json['data'];
  message= json['message'] is List
  ? (json['message'] as List).join(', ') // Convert list to string
      : json['message'].toString(); // Convert single string to string
  error= json['error'] ?? 'Unknown Error';
  statusCode=  json['statusCode'] ?? 0;

  }
  }




