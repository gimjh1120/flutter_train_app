import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat/widget/reserve_button.dart';
import 'package:flutter_train_app/seat/widget/select_view.dart';
import 'package:flutter_train_app/seat/widget/travel_view.dart';

class SeatPage extends StatelessWidget {
  final String departureStation;
  final String arrivalStation;

  const SeatPage({
    Key? key,
    required this.departureStation,
    required this.arrivalStation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            travelView(
              departureStation: departureStation,
              arrivalStation: arrivalStation,
            ),
            selectView(),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text('A'),
                          ...List.generate(20, (_) => seat()), // 반복적으로 좌석 생성
                        ],
                      ),
                      Column(
                        children: [
                          Text('B'),
                          ...List.generate(20, (_) => seat()), // 반복적으로 좌석 생성
                        ],
                      ),
                      Column(
                        children: [
                          Text(' '),
                          ...List.generate(
                              20, (index) => seatNum((index + 1).toString())),
                        ],
                      ),
                      Column(
                        children: [
                          Text('C'),
                          ...List.generate(20, (_) => seat()), // 반복적으로 좌석 생성
                        ],
                      ),
                      Column(
                        children: [
                          Text('D'),
                          ...List.generate(20, (_) => seat()), // 반복적으로 좌석 생성
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            reserveButton(
                departureStation: departureStation,
                arrivalStation: arrivalStation),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Container seatNum(String num) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      margin: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 2,
      ),
      child: Text(
        num,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }

  Container seat() {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[300]!,
      ),
    );
  }
}
