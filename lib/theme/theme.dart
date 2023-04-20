import 'package:flutter/material.dart';

final darkTheme = ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(132, 160, 160, 160),
        primarySwatch: Colors.amber,
        dividerColor: Colors.amber,
        appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(132, 160, 160, 160),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700)),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.greenAccent
         ),
         textTheme: TextTheme(
          bodyMedium:  const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            
          ), 
          labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w400,
            fontSize: 14,
            
          )
        )
      );