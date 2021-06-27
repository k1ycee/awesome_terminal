import 'dart:convert';
import 'dart:io';
import 'package:awesome_terminal/Constants/strings.dart';
import 'package:awesome_terminal/self/api/abstrac_self_api.dart';
import 'package:awesome_terminal/self/models/self_verify_bvn.dart';
import 'package:awesome_terminal/self/models/self_transactions.dart';
import 'package:awesome_terminal/self/models/self_check_balance.dart';
import 'package:awesome_terminal/utils/error_handler.dart';
import 'package:http/http.dart' as http;

class WalletSelfAPI implements WalletSelf {
  Map<String, String> header = {
    'Authorization': 'Bearer $publicKey',
  };

  @override
  Future<CheckBalanceResponse> checkUserBalance(String currency) async {
    try {
      print(header.values);
      final getBalance = await http.post(Uri.parse('$baseUrl/self/balance'),
          body: {'secretKey': secretKey, 'currency': currency},
          headers: header);
      if (getBalance.statusCode == 200) {
        final json = jsonDecode(getBalance.body);
        var some = CheckBalanceResponse.fromJson(json).data;
        print(some);
        return CheckBalanceResponse.fromJson(json);
      }
    } on SocketException {
      throw Failure(message: "You're Currently not connected to the internet");
    } catch (error) {
      throw Failure(message: error.toString());
    }
    throw Failure(message: 'This failure should never happen');
  }

  @override
  Future<SelfTransactionsResponse> checkUserTransactions(
      {String currency,
      int transactionType,
      DateTime dateFrom,
      DateTime dateTo,
      int skip,
      int take}) async {
    try {
      final getTransactions =
          await http.post(Uri.parse('$baseUrl/self/transactions'),
              body: {
                'currency': currency,
                'secretKey': secretKey,
                'dateFrom': dateFrom,
                'dateTo': dateTo,
                'skip': skip,
                'take': take,
              },
              headers: header);
      if (getTransactions.statusCode == 200) {
        final json = jsonDecode(getTransactions.body);
        return SelfTransactionsResponse.fromJson(json);
      }
    } on SocketException {
      throw Failure(message: "You're Currently not connected to the internet");
    } catch (error) {
      throw Failure(message: error.toString());
    }
    throw Failure(message: 'This failure should never happen');
  }

  @override
  Future<SelfVerifyBVNResponse> verifyUserBVN(
      {String bvn, DateTime dateOfBirth}) async {
    try {
      final bvnVerification =
          await http.post(Uri.parse('$baseUrl/self/verifybvn'),
              body: {
                'secretKey': secretKey,
                'bvn': bvn,
                'dateOfBirth': dateOfBirth,
              },
              headers: header);
      if (bvnVerification.statusCode == 200) {
        final json = jsonDecode(bvnVerification.body);
        return SelfVerifyBVNResponse.fromJson(json);
      }
    } on SocketException {
      throw Failure(message: "You're Currently not connected to the internet");
    } catch (error) {
      throw Failure(message: error.toString());
    }
    throw Failure(message: 'This failure should never happen');
  }
}
