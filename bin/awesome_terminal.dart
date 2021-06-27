
import 'package:awesome_terminal/self/self_terminal.dart';

void main(List<String> arguments) async{
  var selfOperations = UserSelfOperations();
  final balance = await selfOperations.getUserBalance('NGN');
  print(balance.walletBalance);
}
