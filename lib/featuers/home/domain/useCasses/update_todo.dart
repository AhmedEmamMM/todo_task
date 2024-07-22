import 'package:dartz/dartz.dart';
import 'package:todo_task/featuers/home/data/models/todo_model.dart';
import 'package:todo_task/featuers/home/domain/repositories/todo_repositories.dart';

class UpdateTodouseCase {
  TodoRepositories repositories;

  UpdateTodouseCase(this.repositories);
  Future<Either<String, TodoModel>> call(int todoID, TodoModel todo) async {
    return await repositories.updateTodo(todoID, todo);
  }
}
