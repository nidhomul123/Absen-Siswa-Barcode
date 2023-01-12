import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.qrCode,
    required this.username,
    required this.password,
    required this.name,
    required this.studentClass,
    required this.role,
  });
  
  String qrCode;
  String username;
  String password;
  String name;
  String studentClass;
  String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
    qrCode: json["qr_code"],
    username: json["username"],
    password: json["password"],
    name: json["name"],
    studentClass: json["student_class"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "qr_code": qrCode,
    "username": username,
    "password": password,
    "name": name,
    "student_class": studentClass,
    "role": role,
  };
}
