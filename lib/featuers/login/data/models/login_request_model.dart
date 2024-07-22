import 'package:todo_task/featuers/login/domain/entities/login_request.dart';

class LoginRequestModel extends LoginRequest {
  LoginRequestModel({super.username, super.password});
  
  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
