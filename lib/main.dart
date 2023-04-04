import 'package:flutter/material.dart';
import 'package:jstechno_practical_task/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue, appBarTheme: const AppBarTheme(iconTheme: IconThemeData(color: Colors.white))),
      home: const LoginScreen(),
    );
  }
}
