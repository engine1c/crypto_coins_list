import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    Key? key,
    required this.coin, 

  }) : super(key: key);

   final CryptoCoin coin;

  @override
  Widget build(BuildContext context) { 
    final theme = Theme.of(context);
    return ListTile(
      leading: Image.network(coin.imageURL),
      /*SvgPicture.asset(
        'img/btc.svg',
        width: 30,
        height: 30,),*/

      title: Text(
        coin.name,
        style: Theme
            .of(context)
            .textTheme
            .bodyMedium,
      ),
      subtitle: Text(
        '${coin.priceInUSD} \$',
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(
          Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed('/coin',  arguments: coin,            );
      },
    );
  }
}