import 'package:dartz/dartz.dart';
import 'package:todo_task/featuers/home/data/models/todo_model.dart';
import 'package:todo_task/featuers/home/domain/repositories/todo_repositories.dart';

class GetAllTodoUseCase {
  TodoRepositories repositories;
  GetAllTodoUseCase(this.repositories);
  Future<Either<String, List<TodoModel>>> call() async {
    return await repositories.getAllTodos();
  }
}
