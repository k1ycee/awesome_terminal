class SelfTransactionsRequest {
  int skip;
  int take;
  String dateFrom;
  String dateTo;
  int transactionType;
  String secretKey;
  String currency;

  SelfTransactionsRequest(
      {this.skip,
      this.take,
      this.dateFrom,
      this.dateTo,
      this.transactionType,
      this.secretKey,
      this.currency});

  Map<String, dynamic> toJson() {
    return {
      'skip': skip,
      'take': take,
      'dateFrom': dateFrom,
      'dateTo': dateTo,
      'transactionType': transactionType,
      'secretKey': secretKey,
      'currency': currency
    };
  }
}

class SelfTransactionsResponse {
  TransactionResponse response;
  TransactionData data;

  SelfTransactionsResponse({this.response, this.data});

  SelfTransactionsResponse.fromJson(Map<String, dynamic> json) {
    response =
        json['Response'] != null ? TransactionResponse.fromJson(json['Response']) : null;
    data = json['Data'] != null ? TransactionData.fromJson(json['Data']) : null;
  }
}

class TransactionResponse {
  String responseCode;
  String message;

  TransactionResponse({this.responseCode, this.message});

  TransactionResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    message = json['Message'];
  }
}

class TransactionData {
  List<Transactions> transactions;

  TransactionData({this.transactions});

  TransactionData.fromJson(Map<String, dynamic> json) {
    if (json['Transactions'] != null) {
      transactions = [];
      json['Transactions'].forEach((v) {
        transactions.add(Transactions.fromJson(v));
      });
    }
  }
}

class Transactions {
  int amount;
  String currency;
  String category;
  String narration;
  String dateTransacted;
  int previousBalance;
  int newBalance;
  String type;

  Transactions(
      {this.amount,
      this.currency,
      this.category,
      this.narration,
      this.dateTransacted,
      this.previousBalance,
      this.newBalance,
      this.type});

  Transactions.fromJson(Map<String, dynamic> json) {
    amount = json['Amount'];
    currency = json['Currency'];
    category = json['Category'];
    narration = json['Narration'];
    dateTransacted = json['DateTransacted'];
    previousBalance = json['PreviousBalance'];
    newBalance = json['NewBalance'];
    type = json['Type'];
  }
}
