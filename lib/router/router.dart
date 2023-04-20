import 'package:crypto_coins_list/features/crypto_coin/view/view.dart';
import 'package:crypto_coins_list/features/crypto_list/crypto_list.dart';

final routes = {
        '/main' : (context) => const CryptoListScreen(),
      '/coin' : (context) => const CryptoCoinScreen(),
      };