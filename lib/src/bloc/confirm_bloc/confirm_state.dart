part of 'confirm_bloc.dart';

@immutable
abstract class ConfirmState {}

class ConfirmInitial extends ConfirmState {}

class ConfirmProgress extends ConfirmState {}

class ConfirmCuccess extends ConfirmState {
  final ListResponseConfirm dataConfirm;
  ConfirmCuccess(this.dataConfirm);
}

class ConfirmFailure extends ConfirmState {}
