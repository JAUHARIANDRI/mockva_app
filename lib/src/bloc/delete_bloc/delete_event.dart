part of 'delete_bloc.dart';

@immutable
abstract class DeleteEvent {}

class DeleteStarted extends DeleteEvent {}
