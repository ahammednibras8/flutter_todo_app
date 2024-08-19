import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('box');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.indigo[400],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo[800],
          foregroundColor: Colors.white,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
