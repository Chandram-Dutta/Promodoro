import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:promodoro/screens/home.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Promodoro',
      theme: ThemeData(
        fontFamily: "SF",
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          centerTitle: true,
        ),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(
          secondary: Color.fromRGBO(255, 0, 0, 1),
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: "SF",
        primaryColor: Colors.black,
        appBarTheme:
            AppBarTheme(backgroundColor: Colors.black, centerTitle: true),
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(
          secondary: Color.fromRGBO(255, 0, 0, 1),
        ),
      ),
      home: Home(),
    );
  }
}
