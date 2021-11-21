part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginStarted extends LoginEvent {
  final String contactConts;
  final String passwordConts;

  LoginStarted(this.contactConts, this.passwordConts);
}

class LoginDetail extends LoginEvent {
  final String id;
  final String accountId;
  LoginDetail(this.id, this.accountId);
}
