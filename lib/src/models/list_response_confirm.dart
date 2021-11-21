// ignore_for_file: prefer_if_null_operators

class ListResponseConfirm {
  String accountSrcId;
  String accountDstId;
  int amount;
  String transactionTimestamp;
  String clientRef;
  String error;

  ListResponseConfirm.withError(String errorMessage) {
    error = errorMessage;
  }

  ListResponseConfirm(
      {this.accountSrcId,
      this.accountDstId,
      this.amount,
      this.transactionTimestamp,
      this.clientRef,
      this.error});

  factory ListResponseConfirm.fromJson(Map<String, dynamic> json) =>
      ListResponseConfirm(
        accountSrcId: json["accountSrcId"] == null || json["accountSrcId"] == ''
            ? null
            : json["accountSrcId"],
        accountDstId: json["accountDstId"] == null || json["accountDstId"] == ''
            ? null
            : json["accountDstId"],
        amount: json["amount"] == null ? null : json["amount"],
        transactionTimestamp: json["transactionTimestamp"] == null ||
                json["transactionTimestamp"] == ''
            ? null
            : json["transactionTimestamp"],
        clientRef: json["clientRef"] == null || json["clientRef"] == ''
            ? null
            : json["clientRef"],
      );

  Map<String, dynamic> toJson() => {
        "accountSrcId": accountSrcId == null ? null : accountSrcId,
        "accountDstId": accountDstId == null ? null : accountDstId,
        "amount": amount == null ? null : amount,
        "transactionTimestamp":
            transactionTimestamp == null ? null : transactionTimestamp,
        "clientRef": clientRef == null ? null : clientRef,
      };
}
