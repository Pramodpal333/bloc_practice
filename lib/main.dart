import 'package:bloc_practice/features/home/ui/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:const AppBarTheme(
          backgroundColor: Colors.teal
        ),
          primaryColor: Colors.teal,
        useMaterial3: true
      ),
      home: const HomeScreen(),
    );
  }
}
