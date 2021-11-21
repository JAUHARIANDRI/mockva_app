import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mockva_app/src/data/session.dart';
import 'package:mockva_app/src/models/list_history_tf.dart';
import 'package:mockva_app/src/resources/api_repository.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial());

  final ApiRepository _repository = ApiRepository();
  @override
  Stream<HistoryState> mapEventToState(
    HistoryEvent event,
  ) async* {
    try {
      if (event is HistoryStarted) {
        yield HistoryProgress();
        String sessionId = await Session.getSessionId();
        String accountId = await Session.getAccountID();

        final _response = await _repository.getHistory(sessionId, accountId);

        if (_response.data != null) {
          yield HistoryLoaded(_response.data);
        } else {
          HistoryIsEmpty();
        }
      }
    } on Error {
      yield HistoryFailure();
    }
  }
}
