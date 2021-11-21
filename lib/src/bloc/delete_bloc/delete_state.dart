part of 'delete_bloc.dart';

@immutable
abstract class DeleteState {}

class DeleteInitial extends DeleteState {}

class DeleteSuccess extends DeleteState {}

class DeleteFailured extends DeleteState {}

class DeleteProgress extends DeleteState {}
