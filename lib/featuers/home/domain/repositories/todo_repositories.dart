import 'package:dartz/dartz.dart';
import 'package:todo_task/featuers/home/data/models/todo_model.dart';

abstract class TodoRepositories {
  Future<Either<String, List<TodoModel>>> getAllTodos();
  Future<Either<String, TodoModel>> addTodo(TodoModel todo);
  Future<Either<String, TodoModel>> updateTodo(int todoID, TodoModel todo);
  Future<Either<String, bool>> deletTodo(int id);
}
