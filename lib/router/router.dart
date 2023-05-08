import 'package:auto_route/auto_route.dart';
import 'package:crypto_coins_list/features/crypto_coin/crypto_coin.dart';
import 'package:crypto_coins_list/features/crypto_list/crypto_list.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
part 'router.gr.dart';  

// final routes = {
//         '/main' : (context) => const CryptoListScreen(),
//       '/coin' : (context) => const CryptoCoinScreen(),
//       };


          
 //flutter packages pub run build_runner build / watch            
@AutoRouterConfig()      
class AppRouter extends _$AppRouter {      
    
  @override      
  List<AutoRoute> get routes => [ 
    AutoRoute(page: CryptoListRoute.page, path: '/'),
    AutoRoute(page: CryptoCoinRoute.page),     
   /// routes go here     
   ];    
 }        