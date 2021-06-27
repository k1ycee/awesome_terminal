import 'package:awesome_terminal/self/api/abstrac_self_api.dart';
import 'package:awesome_terminal/self/api/wallet_self_api_concrete.dart';
import 'package:awesome_terminal/self/models/self_check_balance.dart';
import 'package:awesome_terminal/self/models/self_transactions.dart';
import 'package:awesome_terminal/self/models/self_verify_bvn.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockWalletSelfAPI extends Mock implements WalletSelf {}

void main() {
  WalletSelfAPIConcrete selfAPI;
  MockWalletSelfAPI mockSelfAPI;

  setUp(() {
    mockSelfAPI = MockWalletSelfAPI();
    selfAPI = WalletSelfAPIConcrete(mockSelfAPI);
  });

  final currency = 'NGN';
  final respbalancecheck = CheckBalanceResponse(
    response: BalanceResponse.fromJson(
      {'ResponseCode': '200', 'Message': 'Balance Retrieved successfully'},
    ),
    data: BalanceData.fromJson(
      {'WalletBalance': 97900, 'WalletCurrency': 'NGN'},
    ),
  );

  // final transactionBody = {
  // 'skip': 0,
  // 'take': 10,
  // 'dateFrom': '2020-01-15',
  // 'dateTo': '2020-01-15',
  // 'transactionType': 1,
  // 'secretKey': 'hfucj5jatq8h',
  // 'currency': 'NGN'
  // };

  final transactionResponse = SelfTransactionsResponse(
      data: TransactionData.fromJson({
        'Transactions': [
          {
            'Amount': 100,
            'Currency': 'NGN',
            'Category': 'Wallet Transfer',
            'Narration': 'Received money from Okiemute Odekuma',
            'DateTransacted': '1/24/2020 5:37:01 PM',
            'PreviousBalance': 98720,
            'NewBalance': 98820,
            'Type': 'Credit'
          },
          {
            'Amount': 200,
            'Currency': 'NGN',
            'Category': 'Wallet Transfer',
            'Narration': 'Received money from Okiemute Odekuma',
            'DateTransacted': '1/24/2020 5:37:01 PM',
            'PreviousBalance': 99000,
            'NewBalance': 99200,
            'Type': 'Credit'
          }
        ]
      }),
      response: TransactionResponse.fromJson({
        'ResponseCode': '200',
        'Message': 'Transactions Retrieved successfully'
      }));

  final bvnStatus = SelfVerifyBVNResponse.fromJson({
    'Message': 'Success',
    'FirstName': 'Eduvie',
    'LastName': 'Agada',
    'Email': 'eduvie@wallet.ng',
    'WalletBalance': 97900,
    'BVN': '21231485915',
    'HasBVN': true,
    'PassCodeSet': true,
    'DisplayPicture': null,
    'Username': null,
    'UserProgress': 4,
    'AccountType': 0
  });

  group('Self Operations', () {
    test('Should return user balance', () async {
      when(mockSelfAPI.checkUserBalance(any))
          .thenAnswer((realInvocation) async => respbalancecheck);
      final result = await selfAPI.executeCheck(currency);
      expect(result, respbalancecheck);
      verify(mockSelfAPI.checkUserBalance(currency));
      verifyNoMoreInteractions(mockSelfAPI);
    });

    test('Should return user transactions', () async {
      when(mockSelfAPI.checkUserTransactions(
              currency: 'NGN',
              transactionType: 1,
              dateTo: DateTime.parse('2020-01-15'),
              dateFrom: DateTime.parse('2020-01-15'),
              skip: 0,
              take: 10))
          .thenAnswer((realInvocation) async => transactionResponse);
      final result = await selfAPI.executeTransaction(
          currency: 'NGN',
          transactionType: 1,
          dateTo: DateTime.parse('2020-01-15'),
          dateFrom: DateTime.parse('2020-01-15'),
          skip: 0,
          take: 10);
      expect(result, transactionResponse);
      verify(mockSelfAPI.checkUserTransactions(
          currency: 'NGN',
          transactionType: 1,
          dateTo: DateTime.parse('2020-01-15'),
          dateFrom: DateTime.parse('2020-01-15'),
          skip: 0,
          take: 10));
      verifyNoMoreInteractions(mockSelfAPI);
    });

    test('Should return user BVN status', () async {
      when(mockSelfAPI.verifyUserBVN(
              bvn: '22231485915', dateOfBirth: DateTime.parse('2020-01-15')))
          .thenAnswer((realInvocation) async => bvnStatus);
      final result = await selfAPI.executeBVNVerification(
          bvn: '22231485915', dateOfBirth: DateTime.parse('2020-01-15'));
      expect(result, bvnStatus);
      verify(mockSelfAPI.verifyUserBVN(
          bvn: '22231485915', dateOfBirth: DateTime.parse('2020-01-15')));
      verifyNoMoreInteractions(mockSelfAPI);
    });
  });
}
