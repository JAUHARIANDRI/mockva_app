// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mockva_app/src/data/session.dart';
import 'package:mockva_app/src/models/list_response_transfer.dart';
import 'package:mockva_app/src/resources/api_repository.dart';
import 'package:mockva_app/src/utils/values/strings.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc() : super(TransferInitial());

  final ApiRepository _repository = ApiRepository();

  @override
  Stream<TransferState> mapEventToState(
    TransferEvent event,
  ) async* {
    try {
      if (event is TransferStarted) {
        yield TransferProgress();
        String sessionId = await Session.getSessionId();
        String accountId = await Session.getAccountID();

        final _response = await _repository.postTransfer(sessionId);
        if (_response.dataTransfer != null) {
          yield TransferLoaded(_response.dataTransfer);
        } else {
          yield TransferFailure(_response.error);
        }
      }
    } on Error {
      yield TransferFailure(Dictionary.warningEmpty);
    }
  }
}
