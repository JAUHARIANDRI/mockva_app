// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:mockva_app/src/data/constants.dart';
import 'package:mockva_app/src/models/list_history_tf.dart';
import 'package:mockva_app/src/models/list_response_confirm.dart';
import 'package:mockva_app/src/models/list_response_detail_account.dart';
import 'package:mockva_app/src/models/list_response_login.dart';
import 'package:mockva_app/src/models/list_response_transfer.dart';
import 'package:mockva_app/src/utils/values/strings.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _baseUrl = EndPoints.baseUrlApi;

  ApiProvider() {
    _dio.options.baseUrl = _baseUrl;
    _dio.interceptors.add(
      InterceptorsWrapper(onRequest: (RequestOptions options) async {
        print("--> ${options.method} $_baseUrl${options.path}");
        print("Content type: ${options.contentType}");
        print("<-- END HTTP");
      }, onResponse: (Response response) async {
        print("--> RES : ${response.data} ");
        print("<-- END RES");
      }, onError: (DioError dioError) {
        print("--> ERROR : $dioError");
      }),
    );
  }

  Future<ListDetailAccount> getDetailAccount(
      String sessionId, String accountId) async {
    try {
      _dio.options.headers = await getHeaders(true, sessionId);
      Response response = await _dio.get(EndPoints.detailAccount + accountId);
      return ListDetailAccount.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ListDetailAccount.withError(Dictionary.warningDio);
    }
  }

  Future<void> deleteLogout(String sessionId) async {
    try {
      _dio.options.headers = await getHeaders(true, sessionId);
      Response response = await _dio.get(EndPoints.detailAccount);
      return ListDetailAccount.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ListDetailAccount.withError(Dictionary.warningDio);
    }
  }

  Future<ListHistory> getHistory(String sessionId, String accountId) async {
    try {
      _dio.options.headers = await getHeaders(true, sessionId);
      Response response = await _dio.get(EndPoints.historytf + accountId);
      return ListHistory.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ListHistory.withError(Dictionary.warningDio);
    }
  }

  Future<ListResponsTransfer> postTransfer(String sessionId) async {
    try {
      _dio.options.headers = await getHeaders(true, sessionId);
      Response response = await _dio.get(EndPoints.postTf);
      return ListResponsTransfer.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ListResponsTransfer.withError(Dictionary.warningDio);
    }
  }

  Future<ListResponseLogin> postLogin(
      String contactConts, String passwordConts) async {
    try {
      _dio.options.headers = await getHeaders(false, "");
      Response response = await _dio.post(EndPoints.postLogin,
          data: {"username": contactConts, "password": passwordConts});
      return ListResponseLogin.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ListResponseLogin.withError(Dictionary.warningDio);
    }
  }

  Future<ListResponseConfirm> postConfirmTf(
      String sessionId,
      String accountSource,
      String accountDestination,
      String accountAmount,
      String inquiryId) async {
    try {
      _dio.options.headers = await getHeaders(true, sessionId);
      Response response = await _dio.post(EndPoints.confirmTf, data: {
        "accountSrcId": accountSource,
        "accountDstId": accountDestination,
        "amount": accountAmount,
        "inquiryId": inquiryId
      });
      return ListResponseConfirm.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ListResponseConfirm.withError(Dictionary.warningDio);
    }
  }

  Future getHeaders(bool isContainBearer, String sessionId) async {
    Map<String, String> header = {};
    header.clear();
    if (isContainBearer) {
      return header = {
        // "Accept": "application/json;charset=UTF-8",
        // "Accept": "application/json",
        // "Charset": "utf-8",
        "_sessionId": sessionId
      };
    } else {
      return header = {
        "Accept": "application/json",
      };
    }
  }
}
