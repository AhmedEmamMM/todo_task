import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/featuers/login/data/models/login_request_model.dart';
import 'package:todo_task/featuers/login/data/models/login_respond_model.dart';
import 'package:todo_task/featuers/login/data/repositories_imp/login_repositores_imp.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepositoresImp loginRepositoresImp;
  LoginCubit(this.loginRepositoresImp) : super(LoginInitial());

  void login(LoginRequestModel loginRequestModel) async {
    emit(LoginLoading());
    final result = await loginRepositoresImp.login(loginRequestModel);
    result.fold(
      (error) => emit(LoginFailure(error)),
      (loginResponesModel) => emit(LoginSuccess(loginResponesModel)),
    );
  }
}
