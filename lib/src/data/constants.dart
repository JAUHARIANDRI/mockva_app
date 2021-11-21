// ignore_for_file: constant_identifier_names

class EndPoints {
  static const String baseUrl = "https://mockva.daksa.co.id/mockva-rest";
  static const String baseUrlApi = baseUrl;

  static const String postLogin = "/rest/auth/login";
  static const String detailAccount = "/rest/account/detail?id=";
  static const String historytf = "/rest/account/transaction/log?accountSrcId=";
  static const String postTf = "/rest/account/transaction/transferInquiry";
  static const String confirmTf = "/rest/account/transaction/transfer";
}

class SharedPrefKeys {
  static const String SESSIONID = "SESSIONID";
  static const String ACCOUNTID = "ACCOUNTID";
}
