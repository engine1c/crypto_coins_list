import 'package:flutter/material.dart';
import 'package:crypto_coins_list/router/router.dart';
import 'package:crypto_coins_list/theme/theme.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoApp extends StatefulWidget {
  const CryptoApp({super.key});

  @override
  State<CryptoApp> createState() => _CryptoAppState();
}

class _CryptoAppState extends State<CryptoApp> {
  final _appRouter = AppRouter();    
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      
      title: '___crypto___',
      theme: darkTheme,
      routerConfig: _appRouter.config(
       navigatorObservers: () => [
        TalkerRouteObserver(GetIt.I<Talker>() 
          ),
        ],
      //routes: routes,
      //initialRoute: '/main',
      ),
    );
  }
}