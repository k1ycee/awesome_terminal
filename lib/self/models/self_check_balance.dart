class CheckBalanceRequest {
  final String currency;
  final String secretKey;

  CheckBalanceRequest({this.currency, this.secretKey});

  Map<String, dynamic> toJson() {
    return {'currency': currency, 'secretKey': secretKey};
  }
}

class CheckBalanceResponse {
  BalanceResponse response;
  BalanceData data;

  CheckBalanceResponse({this.response, this.data});

  CheckBalanceResponse.fromJson(Map<String, dynamic> json) {
    response =
        json['Response'] != null ? BalanceResponse.fromJson(json['Response']) : null;
    data = json['Data'] != null ? BalanceData.fromJson(json['Data']) : null;
  }
}

class BalanceResponse {
  String responseCode;
  String message;

  BalanceResponse({this.responseCode, this.message});

  BalanceResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    message = json['Message'];
  }
}

class BalanceData {
  double walletBalance;
  String walletCurrency;

  BalanceData({this.walletBalance, this.walletCurrency});

  BalanceData.fromJson(Map<String, dynamic> json) {
    walletBalance = json['WalletBalance'];
    walletCurrency = json['WalletCurrency'];
  }
}
