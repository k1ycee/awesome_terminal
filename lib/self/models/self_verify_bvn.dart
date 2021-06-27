class SelfVerifyBVNRequest {
  String secretKey;
  String bvn;
  String dateOfBirth;

  SelfVerifyBVNRequest({this.secretKey, this.bvn, this.dateOfBirth});

  Map<String, dynamic> toJson() {
    return {'secretKey': secretKey, 'bvn': bvn, 'dateOfBirth': dateOfBirth};
  }
}

class SelfVerifyBVNResponse {
  String message;
  String firstName;
  String lastName;
  String email;
  int walletBalance;
  String bVN;
  bool hasBVN;
  bool passCodeSet;
  Null displayPicture;
  Null username;
  int userProgress;
  int accountType;

  SelfVerifyBVNResponse(
      {this.message,
      this.firstName,
      this.lastName,
      this.email,
      this.walletBalance,
      this.bVN,
      this.hasBVN,
      this.passCodeSet,
      this.displayPicture,
      this.username,
      this.userProgress,
      this.accountType});

  SelfVerifyBVNResponse.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    email = json['Email'];
    walletBalance = json['WalletBalance'];
    bVN = json['BVN'];
    hasBVN = json['HasBVN'];
    passCodeSet = json['PassCodeSet'];
    displayPicture = json['DisplayPicture'];
    username = json['Username'];
    userProgress = json['UserProgress'];
    accountType = json['AccountType'];
  }
}