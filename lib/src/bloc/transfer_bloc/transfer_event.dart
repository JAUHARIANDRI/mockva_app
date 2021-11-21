part of 'transfer_bloc.dart';

@immutable
abstract class TransferEvent {}

class TransferStarted extends TransferEvent {}
