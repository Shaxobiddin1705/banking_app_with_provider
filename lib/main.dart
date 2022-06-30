import 'package:banking_app_with_provider/pages/home_page.dart';
import 'package:banking_app_with_provider/pages/add_card_page.dart';
import 'package:banking_app_with_provider/providers/add_card_provider.dart';
import 'package:banking_app_with_provider/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddCardProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banking app',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lime
        ),
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/add_card': (context) => const AddCardPage(),
      },
    );
  }
}