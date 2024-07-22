import 'package:dartz/dartz.dart';
import 'package:todo_task/featuers/home/data/dataSources/api_servcies.dart';
import 'package:todo_task/featuers/home/data/models/todo_model.dart';
import 'package:todo_task/featuers/home/domain/repositories/todo_repositories.dart';

class TodoRepositoriesImp implements TodoRepositories {
  final ApiServcies apiServcies;
  TodoRepositoriesImp(this.apiServcies);

  @override
  Future<Either<String, List<TodoModel>>> getAllTodos() async {
    try {
      final todos = await apiServcies.getTodos();
      return Right(todos.map((todo) => TodoModel.fromJson(todo)).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, TodoModel>> addTodo(TodoModel todo) async {
    try {
      final addedTodo = await apiServcies.createTodo(todo.toJson());
      return Right(TodoModel.fromJson(addedTodo));
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override // updateTodo
  Future<Either<String, TodoModel>> updateTodo(
      int todoID, TodoModel todo) async {
    try {
      final updatedTodo = await apiServcies.updateTodo(todoID, todo.toJson());
      return Right(TodoModel.fromJson(updatedTodo));
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> deletTodo(int todoID) async {
    try {
      await apiServcies.deleteTodo(todoID);
      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
