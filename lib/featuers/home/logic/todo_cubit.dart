import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/core/networking/api_servcies.dart';
import 'package:todo_task/featuers/home/data/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final ApiServcies apiServcies;
  TodoCubit(this.apiServcies) : super(TodoInitial());

  void getTodos() async {
    emit(GetTodoLoading());
    try {
      final allTodos = await apiServcies.getTodos();
      emit(
          GetTodoSuccess(allTodos.map((todo) => TODO.fromJson(todo)).toList()));
    } catch (e) {
      emit(GetTodofailed(e.toString()));
    }
  }

  Future<void> createTodo(TODO todo) async {
    final result = await apiServcies.createTodo(todo.toJson());
    result.fold(
      (error) => emit(GetTodofailed(error.toString())),
      (createdTodo) {
        emit(GetTodoSuccess([createdTodo]));
        // getTodos();
      },
    );
  }

  Future<void> updateTodo(TODO todo) async {
    final result = await apiServcies.updateTodo(todo.id!, todo.toJson());
    result.fold(
      (error) => emit(GetTodofailed(error.toString())),
      (updatedTodo) {
        emit(GetTodoSuccess([updatedTodo]));
        // getTodos();
      },
    );
  }

  Future<void> deleteTodo(int id) async {
    final result = await apiServcies.deleteTodo(id);
    result.fold(
      (error) => emit(GetTodofailed(error.toString())),
      (_) => getTodos(),
    );
  }
}
