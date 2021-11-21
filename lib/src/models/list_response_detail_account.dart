// ignore_for_file: prefer_if_null_operators

class ListDetailAccount {
  String id;
  String name;
  String username;
  dynamic balance;
  String error;
  ListDetailAccount(
      {this.id, this.name, this.username, this.balance, this.error});

  ListDetailAccount.withError(final String errorMessage) {
    error = errorMessage;
  }

  factory ListDetailAccount.fromJson(Map<String, dynamic> json) =>
      ListDetailAccount(
        id: json["id"] == null || json["id"] == '' ? null : json["id"],
        name: json["name"] == null || json["name"] == '' ? null : json["name"],
        username: json["username"] == null || json["username"] == ''
            ? null
            : json["username"],
        balance: json["balance"] == null ? null : json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "username": username == null ? null : username,
        "balance": balance == null ? null : balance,
      };
}
