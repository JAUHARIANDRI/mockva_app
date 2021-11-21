// ignore_for_file: unused_field

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mockva_app/src/data/session.dart';
import 'package:mockva_app/src/models/list_response_detail_account.dart';
import 'package:mockva_app/src/resources/api_repository.dart';

part 'detail_account_event.dart';
part 'detail_account_state.dart';

class DetailAccountBloc extends Bloc<DetailAccountEvent, DetailAccountState> {
  DetailAccountBloc() : super(DetailAccountInitial());

  final ApiRepository _repository = ApiRepository();

  String sessionID, accountID;

  @override
  Stream<DetailAccountState> mapEventToState(
    DetailAccountEvent event,
  ) async* {
    try {
      if (event is DetailAccountStarted) {
        yield DetailAccountProgress();
        String sessionId = await Session.getSessionId();
        String accountId = await Session.getAccountID();
        final _response =
            await _repository.getDetailAccount(sessionId, accountId);
        if (_response.id != '') {
          yield DetailAccountLoaded(_response);
        } else {}
      }
    } on Error {
      yield DetailAccountFailure();
    }
  }
}
