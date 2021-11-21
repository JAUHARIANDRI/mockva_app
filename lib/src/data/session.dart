import 'dart:async';
import 'package:mockva_app/src/data/constants.dart';
import 'package:mockva_app/src/models/list_response_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Session {
  static Future<SharedPreferences> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future<String> getSessionId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.SESSIONID);
  }

  static Future<String> getAccountID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.ACCOUNTID);
  }

  static Future<void> setSessionId(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SharedPrefKeys.SESSIONID, id);
  }

  static Future<void> setAccountID(String accountiD) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SharedPrefKeys.ACCOUNTID, accountiD);
  }

  static Future<ListResponseLogin> getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ListResponseLogin detailView = ListResponseLogin();
    detailView.id = prefs.getString(SharedPrefKeys.SESSIONID);
    detailView.accountId = prefs.getString(SharedPrefKeys.ACCOUNTID);

    return detailView;
  }
}
