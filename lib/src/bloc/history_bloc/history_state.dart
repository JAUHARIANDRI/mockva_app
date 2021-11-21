part of 'history_bloc.dart';

@immutable
abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<DataHistory> response;
  HistoryLoaded(this.response);
}

class HistoryFailure extends HistoryState {}

class HistoryIsEmpty extends HistoryState {}

class HistoryProgress extends HistoryState {}
