// ignore_for_file: avoid_print

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mockva_app/src/data/session.dart';
import 'package:mockva_app/src/models/list_response_detail_account.dart';
import 'package:mockva_app/src/models/list_response_login.dart';
import 'package:mockva_app/src/resources/api_repository.dart';
import 'package:mockva_app/src/utils/values/strings.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  final ApiRepository _repository = ApiRepository();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    try {
      yield LoginProgress();

      if (event is LoginStarted) {
        final _response = await _repository.postLogin(
            event.contactConts, event.passwordConts);
        if (_response.error != null) {
          yield LoginFailure(_response.error);
        } else {
          Session.setAccountID(_response.accountId);
          Session.setSessionId(_response.id);
          if (_response.id != '') {
            String sessionId = await Session.getSessionId();
            String accountId = await Session.getAccountID();
            print(sessionId);
            print(accountId);

            yield LoginSuccess(_response);
          } else {
            yield LoginFailure(_response.error);
          }
        }
      }

      if (event is LoginDetail) {
        final _response =
            await _repository.getDetailAccount(event.id, event.accountId);
        if (_response.username != '') {
          yield LoginDetailLoaded(_response);
        } else {
          yield LoginFailure(_response.error);
        }
      }
    } on Error {
      yield LoginFailure(Dictionary.warningDio);
    }
  }
}
