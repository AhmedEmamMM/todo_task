part of 'todo_cubit.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

final class TodoInitial extends TodoState {}

class GetTodoLoading extends TodoState {}

class GetTodoSuccess extends TodoState {
  final List<TODO> allTodos;

  const GetTodoSuccess(this.allTodos);
  @override
  List<Object> get props => [allTodos];
}

class GetTodofailed extends TodoState {
  final String message;

  const GetTodofailed(this.message);
  @override
  List<Object> get props => [message];
}
