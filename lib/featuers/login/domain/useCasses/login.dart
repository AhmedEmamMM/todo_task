import 'package:dartz/dartz.dart';
import 'package:todo_task/featuers/login/data/models/login_request_model.dart';
import 'package:todo_task/featuers/login/data/models/login_respond_model.dart';
import 'package:todo_task/featuers/login/domain/repositories/login_repositories.dart';

class LoginUseCase {
  LoginRepositories repositories;
  LoginUseCase(this.repositories);

  Future<Either<String, LoginResponesModel>> call(
      LoginRequestModel loginRequestModel) async {
    return await repositories.login(loginRequestModel);
  }
}
