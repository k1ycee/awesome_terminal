import 'package:awesome_terminal/self/api/abstrac_self_api.dart';
import 'package:awesome_terminal/self/models/self_check_balance.dart';
import 'package:awesome_terminal/self/models/self_transactions.dart';
import 'package:awesome_terminal/self/models/self_verify_bvn.dart';

class WalletSelfAPIConcrete {
  final WalletSelf walletSelf;
  WalletSelfAPIConcrete(this.walletSelf);

  Future<CheckBalanceResponse> executeCheck(String currency) async {
    return await walletSelf.checkUserBalance(currency);
  }

  Future<SelfTransactionsResponse> executeTransaction(
      {String currency,
      int transactionType,
      DateTime dateFrom,
      DateTime dateTo,
      int skip,
      int take}) async {
    return await walletSelf.checkUserTransactions(
        currency: currency,
        transactionType: transactionType,
        dateFrom: dateFrom,
        dateTo: dateTo,
        skip: skip,
        take: take);
  }
  Future<SelfVerifyBVNResponse> executeBVNVerification({String bvn, DateTime dateOfBirth}){
    return walletSelf.verifyUserBVN(bvn: bvn, dateOfBirth: dateOfBirth);
  }
}
