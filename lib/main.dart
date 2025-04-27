import 'package:flutter/material.dart';
import 'package:laba_1/login_street.dart';
import 'package:provider/provider.dart';
import 'travel_screen.dart';
import 'photo_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PhotoProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
