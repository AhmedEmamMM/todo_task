import 'package:todo_task/featuers/login/domain/entities/login_response.dart';

class LoginResponesModel extends LoginRespones {
  LoginResponesModel({
    super.id,
    super.username,
    super.email,
    super.firstName,
    super.lastName,
    super.gender,
    super.image,
    super.token,
    super.refreshToken,
  });

  LoginResponesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    image = json['image'];
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['image'] = image;
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
