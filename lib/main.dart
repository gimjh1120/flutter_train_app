import 'package:flutter/material.dart';
import 'package:flutter_train_app/home/homa_page.dart';
import 'package:flutter_train_app/seat/seat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomaPage(),
    );
  }
}
