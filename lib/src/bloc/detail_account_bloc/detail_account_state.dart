part of 'detail_account_bloc.dart';

@immutable
abstract class DetailAccountState {}

class DetailAccountInitial extends DetailAccountState {}

class DetailAccountLoaded extends DetailAccountState {
  final ListDetailAccount response;
  DetailAccountLoaded(this.response);
}

class DetailAccountProgress extends DetailAccountState {}

class DetailAccountFailure extends DetailAccountState {}
