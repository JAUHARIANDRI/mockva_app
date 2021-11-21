// ignore_for_file: prefer_if_null_operators

class ListResponsTransfer {
  List<DataTransfer> dataTransfer;

  String error;
  ListResponsTransfer({this.dataTransfer, this.error});

  ListResponsTransfer.withError(final String errorMessage) {
    error = errorMessage;
  }

  factory ListResponsTransfer.fromJson(Map<String, dynamic> json) =>
      ListResponsTransfer(
        dataTransfer: json["dataTransfer"] == null
            ? null
            : List<DataTransfer>.from(
                json["data"].map((x) => DataTransfer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dataTransfer": dataTransfer == null
            ? null
            : List<dynamic>.from(dataTransfer.map((x) => x.toJson())),
      };
}

class DataTransfer {
  String inquiryId;
  String accountSrcId;
  String accountDstId;
  String accountSrcName;
  String accountDstName;
  int amount;

  DataTransfer(
      {this.inquiryId,
      this.accountSrcId,
      this.accountDstId,
      this.accountSrcName,
      this.accountDstName,
      this.amount});

  factory DataTransfer.fromJson(Map<String, dynamic> json) => DataTransfer(
        inquiryId: json["inquiryId"] == null || json["inquiryId"] == ''
            ? null
            : json["inquiryId"],
        accountSrcId: json["accountSrcId"] == null || json["accountSrcId"] == ''
            ? null
            : json["accountId"],
        accountDstId: json["accountDstId"] == null || json["accountDstId"] == ''
            ? null
            : json["accountDstId"],
        accountSrcName:
            json["accountSrcName"] == null || json["accountSrcName"] == ''
                ? null
                : json["accountSrcName"],
        accountDstName:
            json["accountDstName"] == null || json["accountDstName"] == ''
                ? null
                : json["accountDstName"],
        amount: json["amount"] == null ? null : json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "inquiryId": inquiryId == null ? null : inquiryId,
        "accountSrcId": accountSrcId == null ? null : accountSrcId,
        "accountDstId": accountDstId == null ? null : accountDstId,
        "accountSrcName": accountSrcName == null ? null : accountSrcName,
        "accountDstName": accountDstName == null ? null : accountDstName,
        "amount": amount == null ? null : amount,
      };
}
