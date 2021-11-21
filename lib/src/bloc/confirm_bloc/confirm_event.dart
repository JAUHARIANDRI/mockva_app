part of 'confirm_bloc.dart';

@immutable
abstract class ConfirmEvent {}

class ConfirmStarted extends ConfirmEvent {
  final String accountSource;
  final String accountDestination;
  final String accountAmount;
  final String inquiryId;

  ConfirmStarted(this.accountSource, this.accountDestination,
      this.accountAmount, this.inquiryId);
}
