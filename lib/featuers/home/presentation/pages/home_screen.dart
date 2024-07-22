import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/core/helper/extentions.dart';
import 'package:todo_task/core/widgets/dialogbox.dart';
import 'package:todo_task/core/widgets/loading_indicator.dart';
import 'package:todo_task/featuers/home/data/models/todo_model.dart';
import 'package:todo_task/featuers/home/presentation/bloc/todo_cubit.dart';
import 'package:todo_task/featuers/home/presentation/widgets/update_todo_dialog_box.dart';
import 'package:todo_task/featuers/login/data/models/login_respond_model.dart';

class HomeScreen extends StatefulWidget {
  final LoginResponesModel? loginResponesModel;
  const HomeScreen({super.key, this.loginResponesModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userIDController = TextEditingController();
  final todoController = TextEditingController();

  TextEditingController? titleController = TextEditingController();
  TextEditingController? statusController = TextEditingController();

  // void createNewTask() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return DialogBox(
  //         userIDController: userIDController,
  //         todoController: todoController,
  //         onSave: () {
  //           BlocProvider.of<TodoCubit>(context).createTodo(
  //                 TODO(
  //                   userId: int.parse(userIDController.text),
  //                   title: todoController.text,
  //                   status: "pending",
  //                 ),
  //               );
  //         },
  //         onCancel: () => Navigator.of(context).pop(),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoInitial) {
            return const LoadingIndicator();
          } else if (state is GetTodoLoading) {
            return const LoadingIndicator();
          } else if (state is GetTodoSuccess) {
            return ListView.builder(
              itemCount: state.allTodos.length,
              itemBuilder: (context, index) {
                TodoModel todo = state.allTodos[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 15.0),
                  decoration: const BoxDecoration(color: Colors.blueGrey),
                  child: ListTile(
                    title: Text(
                      todo.title!,
                      style: const TextStyle(
                        color: Colors.amberAccent,
                      ),
                    ),
                    subtitle: Center(
                      child: Text(
                        "Status : ${todo.status!}",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: todo.status == "completed"
                              ? Colors.green
                              : Colors.orange,
                        ),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.white),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return UpdateTodoDialogBox(
                                  currentTodo: todo,
                                  titleController: titleController!,
                                  statusController: statusController!,
                                  onSave: () {
                                    context.read<TodoCubit>().updateTodo(
                                          TodoModel(
                                            id: todo.id,
                                            userId: todo.userId,
                                            title: titleController!.text.isEmpty
                                                ? todo.title
                                                : titleController!.text,
                                            dueOn: todo.dueOn,
                                            status:
                                                statusController!.text.isEmpty
                                                    ? todo.status
                                                    : statusController!.text,
                                          ),
                                        );
                                    context.pop();
                                    titleController!.clear();
                                    statusController!.clear();
                                  },
                                  onCancel: () => Navigator.of(context).pop(),
                                );
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.white),
                          onPressed: () {
                            context.read<TodoCubit>().deleteTodo(todo.id!);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is GetTodofailed) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return DialogBox(
                userIDController: userIDController,
                todoController: todoController,
                onSave: () {
                  BlocProvider.of<TodoCubit>(context).createTodo(
                    TodoModel(
                      userId: int.parse(userIDController.text),
                      title: todoController.text,
                      status: "pending",
                    ),
                  );
                  context.pop();
                  titleController!.clear();
                  statusController!.clear();
                },
                onCancel: () => Navigator.of(context).pop(),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // create a new task
}
