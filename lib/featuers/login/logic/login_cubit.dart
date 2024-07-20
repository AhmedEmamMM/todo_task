import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/core/networking/api_servcies.dart';
import 'package:todo_task/featuers/login/data/login_request_model.dart';
import 'package:todo_task/featuers/login/data/login_respond_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ApiServcies apiServcies;
  LoginCubit(this.apiServcies) : super(LoginInitial());

  void login(LoginRequestModel loginRequestModel) async {
    emit(LoginLoading());
    final result = await apiServcies.loginIn(loginRequestModel);
    result.fold(
      (error) {
        emit(LoginFailure(error));
        print("all is bad");
      },
      (loginResponesModel) {
        emit(LoginSuccess(loginResponesModel));
        print("all is good");

      },
    );
  }
}
