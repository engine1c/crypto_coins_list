import 'package:crypto_coins_list/theme/theme.dart';
import 'package:flutter/material.dart';

import 'router/router.dart';

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'crypto',
      theme: darkTheme,
      routes: routes,
      initialRoute: '/main',
       );
  }
}