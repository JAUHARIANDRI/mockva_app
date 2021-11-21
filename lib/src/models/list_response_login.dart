// ignore_for_file: prefer_if_null_operators

class ListResponseLogin {
  String id;
  String accountId;
  String lastLoginTimestamp;
  String sessionStatus;
  String error;

  ListResponseLogin(
      {this.id,
      this.accountId,
      this.lastLoginTimestamp,
      this.sessionStatus,
      this.error});
  ListResponseLogin.withError(final String errorMessage) {
    error = errorMessage;
  }

  factory ListResponseLogin.fromJson(Map<String, dynamic> json) =>
      ListResponseLogin(
        id: json["id"] == null || json["id"] == '' ? null : json["id"],
        accountId: json["accountId"] == null || json["accountId"] == ''
            ? null
            : json["accountId"],
        lastLoginTimestamp: json["lastLoginTimestamp"] == null ||
                json["lastLoginTimestamp"] == ''
            ? null
            : json["lastLoginTimestamp"],
        sessionStatus:
            json["sessionStatus"] == null || json["sessionStatus"] == ''
                ? null
                : json["sessionStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "accountId": accountId == null ? null : accountId,
        "lastLoginTimestamp":
            lastLoginTimestamp == null ? null : lastLoginTimestamp,
        "sessionStatus": sessionStatus == null ? null : sessionStatus,
      };
}
