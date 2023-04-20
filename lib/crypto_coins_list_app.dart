import 'package:flutter/material.dart';
import 'package:crypto_coins_list/router/router.dart';
import 'package:crypto_coins_list/theme/theme.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: '___crypto___',
      theme: darkTheme,
      routes: routes,
      initialRoute: '/main',
      navigatorObservers: [
        TalkerRouteObserver(GetIt.I<Talker>()),
      ],
       );
  }
}