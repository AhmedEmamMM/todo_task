import 'package:dartz/dartz.dart';
import 'package:todo_task/featuers/home/domain/repositories/todo_repositories.dart';

class DeleteTodouseCase {
  TodoRepositories repositories;

  DeleteTodouseCase(this.repositories);
  Future<Either<String, bool>> call(int todoID) async {
    return await repositories.deletTodo(todoID);
  }
}
