import 'package:dio/dio.dart';

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

  Future<List<dynamic>> getTodos() async {
    final response = await dio.get('https://gorest.co.in/public/v2/todos');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(response.statusMessage);
    }
  }

  Future<dynamic> createTodo(Map<String, dynamic> todo) async {
    final response = await dio.post('https://gorest.co.in/public/v2/todos',
        data: todo,
        options: Options(headers: {
          'Authorization':
              'Bearer 91408509a45e23a97864b7f467ed9fee61daf674a195eb526f91dd36c796ee07'
        }));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(response.statusMessage);
    }
  }

  Future<dynamic> updateTodo(int id, Map<String, dynamic> todo) async {
    final response = await dio.put('https://gorest.co.in/public/v2/todos/$id',
        data: todo,
        options: Options(headers: {
          'Authorization':
              'Bearer 91408509a45e23a97864b7f467ed9fee61daf674a195eb526f91dd36c796ee07'
        }));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(response.statusMessage);
    }
  }

  Future<dynamic> deleteTodo(int id) async {
    final response =
        await dio.delete('https://gorest.co.in/public/v2/todos/$id',
            options: Options(headers: {
              'Authorization':
                  'Bearer 91408509a45e23a97864b7f467ed9fee61daf674a195eb526f91dd36c796ee07'
            }));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
