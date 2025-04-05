import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News & Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 16, color: Colors.grey),
          bodyLarge: TextStyle(fontSize: 16),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}