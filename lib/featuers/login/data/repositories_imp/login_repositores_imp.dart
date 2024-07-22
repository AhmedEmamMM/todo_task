import 'package:dartz/dartz.dart';
import 'package:todo_task/featuers/login/data/dataSources/login_api.dart';
import 'package:todo_task/featuers/login/data/models/login_request_model.dart';
import 'package:todo_task/featuers/login/data/models/login_respond_model.dart';
import 'package:todo_task/featuers/login/domain/repositories/login_repositories.dart';

class LoginRepositoresImp implements LoginRepositories {
  final LoginApi loginApi;
  LoginRepositoresImp(this.loginApi);
  @override
  Future<Either<String, LoginResponesModel>> login(
      LoginRequestModel loginRequestModel) async {
    try {
      final loginResponse = await loginApi.login(loginRequestModel);
      return Right(LoginResponesModel.fromJson(loginResponse));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
