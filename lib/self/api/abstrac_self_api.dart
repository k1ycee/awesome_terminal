import 'package:awesome_terminal/self/models/self_check_balance.dart';
import 'package:awesome_terminal/self/models/self_transactions.dart';
import 'package:awesome_terminal/self/models/self_verify_bvn.dart';

abstract class WalletSelf {
  Future<CheckBalanceResponse> checkUserBalance(String currency);
  Future<SelfTransactionsResponse> checkUserTransactions(
      {String currency,
      int transactionType,
      DateTime dateFrom,
      DateTime dateTo,
      int skip,
      int take});
  Future<SelfVerifyBVNResponse> verifyUserBVN(
      {String bvn, DateTime dateOfBirth});
}
