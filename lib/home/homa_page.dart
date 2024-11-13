import 'package:flutter/material.dart';
import 'package:flutter_train_app/home/widget/seat_button.dart';
import 'package:flutter_train_app/home/widget/station_select.dart';

class HomaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기차예매'),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StationSelect(),
            SizedBox(
              height: 20,
            ),
            seatButton(),
          ],
        ),
      ),
    );
  }
}
