import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/featuers/home/data/models/todo_model.dart';
import 'package:todo_task/featuers/home/data/repositories_imp/todo_repositories_imp.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepositoriesImp todoRepositoriesImp;
  TodoCubit(this.todoRepositoriesImp) : super(TodoInitial());

  void getTodos() async {
    emit(GetTodoLoading());
    final result = await todoRepositoriesImp.getAllTodos();
    result.fold(
      (error) => emit(GetTodofailed(error.toString())),
      (allTodos) => emit(GetTodoSuccess(allTodos)),
    );
  }

  Future<void> createTodo(TodoModel todo) async {
    final result = await todoRepositoriesImp.addTodo(todo);
    result.fold(
      (error) => emit(GetTodofailed(error.toString())),
      (createdTodo) {
        emit(GetTodoSuccess([createdTodo]));
        // getTodos();
      },
    );
  }

  Future<void> updateTodo(TodoModel todo) async {
    final result = await todoRepositoriesImp.updateTodo(todo.id!, todo);
    result.fold(
      (error) => emit(GetTodofailed(error.toString())),
      (updatedTodo) {
        emit(GetTodoSuccess([updatedTodo]));
        // getTodos();
      },
    );
  }

  Future<void> deleteTodo(int id) async {
    final result = await todoRepositoriesImp.deletTodo(id);
    result.fold(
      (error) => emit(GetTodofailed(error.toString())),
      (_) => getTodos(),
    );
  }
}
