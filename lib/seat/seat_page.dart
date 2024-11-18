import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat/widget/select_view.dart';
import 'package:flutter_train_app/seat/widget/travel_view.dart';

//좌석 선택 시 ui 변경을 위해 stateFulWidget 사용
class SeatPage extends StatefulWidget {
  final String departureStation;
  final String arrivalStation;

  const SeatPage({
    Key? key,
    required this.departureStation,
    required this.arrivalStation,
  }) : super(key: key);

  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  // 선택된 좌석을 저장할 리스트
  List<String> selectedSeats = [];

  //좌석 선택 시 좌석 번호 데이터
  void toggleSeatSelection(String seatNumber) {
    setState(() {
      if (selectedSeats.contains(seatNumber)) {
        selectedSeats.remove(seatNumber); // 선택 해제
      } else {
        selectedSeats.add(seatNumber); // 선택 추가
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20), //body 좌우 패딩
        child: Column(
          children: [
            //상단 출발역, 도착역 widget
            travelView(
              //위젯에 데이터 공유
              departureStation: widget.departureStation,
              arrivalStation: widget.arrivalStation,
            ),
            selectView(), //선택 여부 알림
            //좌석 리스트
            Expanded(
              //스크롤
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, //가운데 정렬
                    children: [
                      //각 열 생성
                      buildSeatColumn('A'),
                      buildSeatColumn('B'),
                      buildSeatColumn(' '), //중앙 행 안내
                      buildSeatColumn('C'),
                      buildSeatColumn('D'),
                    ],
                  ),
                ],
              ),
            ),
            reserveButton(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 좌석 열을 생성하는 메서드
  Column buildSeatColumn(String row) {
    //행 안내 열
    if (row == ' ') {
      // 번호 표시 열
      return Column(
        children: [
          Text(' '),
          ...List.generate(
            20,
            (index) => seatNum((index + 1).toString()),
          ),
        ],
      );
    }
    //좌석 선택 버튼 생성
    else {
      return Column(
        children: [
          Text(row),
          ...List.generate(20, (index) {
            String seatNumber = '${index + 1}-$row'; //시트 번호
            return GestureDetector(
              onTap: () => toggleSeatSelection(seatNumber),
              child: seat(
                seatNumber,
                selectedSeats.contains(seatNumber)
                    ? Colors.purple
                    : Colors.grey[300]!,
              ),
            );
          }),
        ],
      );
    }
  }

  // 좌석 번호 표시
  Container seatNum(String num) {
    return Container(
      alignment: Alignment.center,
      width: 50,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      child: Text(
        num,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  // 좌석 박스 (선택 시 색상 변경)
  Container seat(String seatNumber, Color color) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
    );
  }

  // 예약 버튼
  Widget reserveButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('예약하시겠습니까?'),
                  content: Text(
                    '${widget.departureStation} > ${widget.arrivalStation}\n선택된 좌석: ${selectedSeats.join(', ')}',
                  ),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('취소'),
                    ),
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.of(context).pop();
                        // 예약 확정 처리 로직을 여기에 추가할 수 있습니다.
                      },
                      child: Text('확인'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text(
            '예매 하기',
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
      ),
    );
  }
}
