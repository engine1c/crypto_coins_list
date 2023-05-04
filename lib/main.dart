import 'dart:async';

import 'package:crypto_coins_list/crypto_coins_list_app.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'firebase_options.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const cryptoCoinsBoxName = 'crypto_coin_box';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug('Talker started...');
  
  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();

    // if (!Hive.isAdapterRegistered(1)) {
  //     Hive.registerAdapter(CryptoCoinDetailAdapter());
  //   }
  //  if (!Hive.isAdapterRegistered(2)) {
  //     Hive.registerAdapter(CryptoCoinAdapter());
  //   }


  Hive.registerAdapter(CryptoCoinDetailAdapter());
  Hive.registerAdapter(CryptoCoinAdapter());


  final cryptoCoinsBox = await Hive.openBox<CryptoCoin>(cryptoCoinsBoxName);

  talker.info(app.options.projectId);

  final dio = Dio();

  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printResponseData: false,
      ),
    ),
  );

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printStateFullData: false,
      printEventFullData: false,
    ),
  );

  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CryptoCoinsRepository(
      dio: dio, 
      cryptoCoinsBox: cryptoCoinsBox
      ),
  );

  FlutterError.onError =
      (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

  runZonedGuarded(() => runApp(const CryptoApp()), (e, st) {
    GetIt.I<Talker>().handle(e, st);
  });
}
