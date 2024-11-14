import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat/seat_page.dart';

class seatButton extends StatelessWidget {
  const seatButton({
    super.key,
    this.arrivalStation,
    this.departureStation,
  });

  final String? departureStation;
  final String? arrivalStation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: () {
          if (departureStation != null && arrivalStation != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SeatPage(
                    departureStation: departureStation!,
                    arrivalStation: arrivalStation!,
                  );
                },
              ),
            );
          } else {
            // 출발역과 도착역이 선택되지 않았을 경우 알림
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("출발역과 도착역을 선택해주세요.")),
            );
          }
        },
        child: Text(
          '좌석 선택',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
