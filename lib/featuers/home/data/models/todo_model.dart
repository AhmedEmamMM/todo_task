import 'package:todo_task/featuers/home/domain/entities/todo.dart';

class TodoModel extends TODO {
  TodoModel({super.id, super.userId, super.title, super.dueOn, super.status});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    dueOn = json['due_on'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    data['due_on'] = dueOn;
    data['status'] = status;
    return data;
  }
}
