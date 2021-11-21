import 'package:mockva_app/src/data/session.dart';
import 'package:mockva_app/src/models/list_history_tf.dart';
import 'package:mockva_app/src/models/list_response_confirm.dart';
import 'package:mockva_app/src/models/list_response_detail_account.dart';
import 'package:mockva_app/src/models/list_response_login.dart';
import 'package:mockva_app/src/models/list_response_transfer.dart';
import 'package:mockva_app/src/resources/api_provider.dart';

class ApiRepository {
  // ignore: prefer_final_fields
  ApiProvider _apiProvider = ApiProvider();

  Future<ListResponseLogin> postLogin(
          String contactConts, String passwordConts) =>
      _apiProvider.postLogin(contactConts, passwordConts);

  Future<ListResponseConfirm> postConfirmTf(
          String sessionID,
          String accountSource,
          String accountDestination,
          String accountAmount,
          String inquiryId) =>
      _apiProvider.postConfirmTf(sessionID, accountSource, accountDestination,
          accountAmount, inquiryId);

  Future<ListDetailAccount> getDetailAccount(
          String sessionId, String accountId) =>
      _apiProvider.getDetailAccount(sessionId, accountId);

  Future<void> deleteLogout(String sessionId) =>
      _apiProvider.deleteLogout(sessionId);

  Future<ListHistory> getHistory(String sessionId, String accountId) =>
      _apiProvider.getHistory(sessionId, accountId);

  Future<ListResponsTransfer> postTransfer(String sessionId) =>
      _apiProvider.postTransfer(sessionId);

  Future<ListResponseLogin> getProfile() => Session.getProfile();
}
