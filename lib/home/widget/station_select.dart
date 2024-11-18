import 'package:flutter/material.dart';

class StationSelect extends StatelessWidget {
  final String? departureStation;
  final String? arrivalStation;
  final VoidCallback onSelectDeparture;
  final VoidCallback onSelectArrival;

  const StationSelect({
    super.key,
    required this.departureStation,
    required this.arrivalStation,
    required this.onSelectDeparture,
    required this.onSelectArrival,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //출발역 영역
          Expanded(
            child: GestureDetector(
              onTap: onSelectDeparture,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '출발역',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    departureStation ?? '선택', //출발역 데이터가 null인 경우 '선택' 출력
                    style: TextStyle(
                      fontSize: 40,
                      color: departureStation == null
                          ? Colors.grey
                          : Colors.black, //출발역이 null인 경우 텍스트 회색, 아닌 경우 검정색
                    ),
                  )
                ],
              ),
            ),
          ),
          //중앙 구분선
          Container(
            width: 2,
            height: 50,
            color: Colors.grey[400],
          ),
          //도착역 영역
          Expanded(
            child: GestureDetector(
              onTap: onSelectArrival,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '도착역',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    arrivalStation ?? '선택',
                    style: TextStyle(
                      fontSize: 40,
                      color:
                          arrivalStation == null ? Colors.grey : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
