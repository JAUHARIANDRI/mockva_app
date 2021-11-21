// ignore_for_file: prefer_if_null_operators

class ListHistory {
  List<DataHistory> data;
  String error;
  ListHistory({this.data, this.error});
  ListHistory.withError(String errorMessage) {
    error = errorMessage;
  }
  factory ListHistory.fromJson(Map<String, dynamic> json) => ListHistory(
        data: json["data"] == null
            ? null
            : List<DataHistory>.from(
                json["data"].map((x) => DataHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataHistory {
  String id;
  String accountSrcId;
  String accountDstId;
  String clientRef;
  double amount;
  String transactionTimestamp;

  DataHistory(
      {this.id,
      this.accountSrcId,
      this.accountDstId,
      this.clientRef,
      this.amount,
      this.transactionTimestamp});
  factory DataHistory.fromJson(Map<String, dynamic> json) => DataHistory(
        id: json["id"] == null || json["id"] == '' ? null : json["id"],
        accountSrcId: json["accountSrcId"] == null || json["accountSrcId"] == ''
            ? null
            : json["accountSrcId"],
        accountDstId: json["accountDstId"] == null || json["accountDstId"] == ''
            ? null
            : json["accountDstId"],
        clientRef: json["clientRef"] == null || json["clientRef"] == ''
            ? null
            : json["clientRef"],
        amount: json["amount"] == null ? null : json["amount"],
        transactionTimestamp: json["transactionTimestamp"] == null ||
                json["transactionTimestamp"] == ''
            ? null
            : json["transactionTimestamp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "accountSrcId": accountSrcId == null ? null : accountSrcId,
        "accountDstId": accountDstId == null ? null : accountDstId,
        "clientRef": clientRef == null ? null : clientRef,
        "amount": amount == null ? null : amount,
        "transactionTimestamp":
            transactionTimestamp == null ? null : transactionTimestamp,
      };
}
