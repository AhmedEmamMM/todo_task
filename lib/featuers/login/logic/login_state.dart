part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponesModel loginRespondModel;
  const LoginSuccess(this.loginRespondModel);
  @override
  List<Object> get props => [loginRespondModel];
}

class LoginFailure extends LoginState {
  final String errorMessage;
  const LoginFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
