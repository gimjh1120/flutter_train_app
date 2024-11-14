import 'package:flutter/material.dart';

class travelView extends StatelessWidget {
  final String departureStation;
  final String arrivalStation;

  const travelView({
    Key? key,
    required this.departureStation,
    required this.arrivalStation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          departureStation, // 출발역 텍스트 표시
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple,
            fontSize: 30,
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Icon(
          Icons.arrow_circle_right_outlined,
          size: 30,
        ),
        SizedBox(
          width: 40,
        ),
        Text(
          arrivalStation, // 도착역 텍스트 표시
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple,
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
