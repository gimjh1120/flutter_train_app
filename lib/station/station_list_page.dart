import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final String title;
  const StationListPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(),
    );
  }
}
