part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final ListResponseLogin response;
  LoginSuccess(this.response);
}

class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}

class LoginProgress extends LoginState {}

class LoginDetailLoaded extends LoginState {
  final ListDetailAccount response;
  LoginDetailLoaded(this.response);
}
