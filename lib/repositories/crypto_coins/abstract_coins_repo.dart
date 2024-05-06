import 'package:some_project/repositories/crypto_coins/models/crypto_coins.dart';

abstract class AbstractCoinsRepo {
  Future<List<CryptoCoin>> getCoinsList();
}
