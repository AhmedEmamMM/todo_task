import 'package:dartz/dartz.dart';
import 'package:todo_task/featuers/home/data/models/todo_model.dart';
import 'package:todo_task/featuers/home/domain/repositories/todo_repositories.dart';

class AddTodouseCase {
  TodoRepositories repositories;

  AddTodouseCase(this.repositories);
  Future<Either<String, TodoModel>> call(TodoModel todo) async {
    return await repositories.addTodo(todo);
  }
}
