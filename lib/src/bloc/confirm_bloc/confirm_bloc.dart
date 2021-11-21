import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mockva_app/src/data/session.dart';
import 'package:mockva_app/src/models/list_response_confirm.dart';
import 'package:mockva_app/src/resources/api_repository.dart';

part 'confirm_event.dart';
part 'confirm_state.dart';

class ConfirmBloc extends Bloc<ConfirmEvent, ConfirmState> {
  ConfirmBloc() : super(ConfirmInitial());

  final ApiRepository _repository = ApiRepository();
  @override
  Stream<ConfirmState> mapEventToState(
    ConfirmEvent event,
  ) async* {
    try {
      if (event is ConfirmStarted) {
        yield ConfirmProgress();

        String sessionId = await Session.getSessionId();
        final _response = await _repository.postConfirmTf(
            sessionId,
            event.accountSource,
            event.accountDestination,
            event.accountAmount,
            event.inquiryId);

        if (_response.accountDstId != null) {
          yield ConfirmCuccess(_response);
        } else {
          yield ConfirmFailure();
        }
      }
    } on Error {}
  }
}
