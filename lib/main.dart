import 'package:flutter/material.dart';

import './screens/stock%20detail/stock_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yaro',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
          // decorationColor: Colors.white
        ),
        primarySwatch: Colors.blue,
      ),
      home: const StockDetailScreen(),
    );
  }
}
