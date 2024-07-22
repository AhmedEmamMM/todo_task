import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/featuers/login/data/models/login_request_model.dart';

class LoginApi {
  late Dio dio;
  LoginApi() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    dio = Dio(options);
  }
  Future<dynamic> login(LoginRequestModel loginRequestModel) async {
    final response = await dio.post('https://dummyjson.com/auth/login',
        data: loginRequestModel.toJson());
    debugPrint('response: $response');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
