import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/featuers/home/data/todo.dart';
import 'package:todo_task/featuers/login/data/login_request_model.dart';
import 'package:todo_task/featuers/login/data/login_respond_model.dart';

class ApiServcies {
  late Dio dio;
  ApiServcies() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    dio = Dio(options);
  }

  Future<Either<String, LoginResponesModel>> loginIn(
      LoginRequestModel loginRequestModel) async {
    try {
      final response = await dio.post('https://dummyjson.com/auth/login',
          data: loginRequestModel.toJson());
      debugPrint('response: $response');
      return Right(LoginResponesModel.fromJson(response.data));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<List<dynamic>> getTodos() async {
    try {
      final response = await dio.get('https://gorest.co.in/public/v2/todos');
      return response.data;
    } catch (e) {
      return [e.toString()];
    }
  }

  Future<Either<String, TODO>> createTodo(Map<String, dynamic> todo) async {
    try {
      final response = await dio.post(
        'https://gorest.co.in/public/v2/todos',
        data: todo,
        options: Options(
          headers: {
            'Authorization':
                'Bearer 91408509a45e23a97864b7f467ed9fee61daf674a195eb526f91dd36c796ee07'
          },
        ),
      );
      return Right(TODO.fromJson(response.data));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, TODO>> updateTodo(
      int id, Map<String, dynamic> todo) async {
    try {
      final response = await dio.put(
        'https://gorest.co.in/public/v2/todos/$id',
        data: todo,
        options: Options(
          headers: {
            'Authorization':'Bearer 91408509a45e23a97864b7f467ed9fee61daf674a195eb526f91dd36c796ee07'
          },
        ),
      );
      return Right(TODO.fromJson(response.data));
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, dynamic>> deleteTodo(int id) async {
    try {
      final response = await dio.delete(
        'https://gorest.co.in/public/v2/todos/$id',
        options: Options(
          headers: {
            'Authorization':
                'Bearer 91408509a45e23a97864b7f467ed9fee61daf674a195eb526f91dd36c796ee07'
          },
        ),
      );
      return Right(response.data);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
