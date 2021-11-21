// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mockva_app/src/data/session.dart';
import 'package:mockva_app/src/resources/api_repository.dart';

part 'delete_event.dart';
part 'delete_state.dart';

class DeleteBloc extends Bloc<DeleteEvent, DeleteState> {
  DeleteBloc() : super(DeleteInitial());

  final ApiRepository _repository = ApiRepository();
  @override
  Stream<DeleteState> mapEventToState(
    DeleteEvent event,
  ) async* {
    try {
      if (event is DeleteStarted) {
        yield DeleteProgress();
        String sessionId = await Session.getSessionId();
        final _response = await _repository.deleteLogout(sessionId);
        yield DeleteSuccess();
      }
    } on Error {
      yield DeleteFailured();
    }
  }
}
