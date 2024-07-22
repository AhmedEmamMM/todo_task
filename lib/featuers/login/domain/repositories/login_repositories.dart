import 'package:dartz/dartz.dart';
import 'package:todo_task/featuers/login/data/models/login_request_model.dart';
import 'package:todo_task/featuers/login/data/models/login_respond_model.dart';

abstract class LoginRepositories {
  Future<Either<String, LoginResponesModel>> login(LoginRequestModel loginRequestModel);
}
