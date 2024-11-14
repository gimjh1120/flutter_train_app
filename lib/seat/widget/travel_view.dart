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
        Expanded(
          child: Text(
            departureStation, // 출발역 텍스트 표시
            textAlign: TextAlign.center, // 텍스트를 오른쪽 정렬
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple,
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Icon(
          Icons.arrow_circle_right_outlined,
          size: 30,
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            arrivalStation, // 도착역 텍스트 표시
            textAlign: TextAlign.center, // 텍스트를 왼쪽 정렬
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.purple,
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }
}
