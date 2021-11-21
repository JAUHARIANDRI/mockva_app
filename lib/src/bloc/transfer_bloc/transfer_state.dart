part of 'transfer_bloc.dart';

@immutable
abstract class TransferState {}

class TransferInitial extends TransferState {}

class TransferLoaded extends TransferState {
  final List<DataTransfer> response;
  TransferLoaded(this.response);
}

class TransferFailure extends TransferState {
  final String message;
  TransferFailure(this.message);
}

class TransferProgress extends TransferState {}
