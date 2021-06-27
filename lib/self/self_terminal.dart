import 'package:awesome_terminal/self/api/wallet_self_api.dart';
import 'package:awesome_terminal/self/models/self_check_balance.dart';
import 'package:awesome_terminal/utils/error_handler.dart';

class UserSelfOperations{


  Failure _failure;
  Failure get failure => _failure;

  WalletSelfAPI self = WalletSelfAPI();

  Future<BalanceData> getUserBalance(String currency) async {
    try{
      final userBalance = await self.checkUserBalance(currency);
      return userBalance.data;
    } on Failure catch (failure){
      _failure = failure;
    }
  }
}