import 'package:flutter/material.dart';
import 'package:flutter_train_app/station/station_list_page.dart';
import 'package:flutter_train_app/home/widget/station_select.dart';
import 'package:flutter_train_app/home/widget/seat_button.dart';

//출발역과 도착역 데이터를 받고 변경되는 ui를 위해 stateFulWidget 사용
class HomaPage extends StatefulWidget {
  @override
  _HomaPageState createState() => _HomaPageState();
}

//선택한 도착역, 출발역 변수 정의(빈 값이 필요해 nullable로 정의)
class _HomaPageState extends State<HomaPage> {
  String? selectedDepartureStation;
  String? selectedArrivalStation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기차예매'),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20), //body영역 좌우 패딩 값
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //위젯 가운데 정렬
          children: [
            //역 선택 위젯
            StationSelect(
              departureStation: selectedDepartureStation,
              arrivalStation: selectedArrivalStation,
              //출발역 데이터 비동기 설계
              onSelectDeparture: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StationListPage(
                      title: '출발역', //출발역 선택 페이지에서 출발역 앱 바 타이틀
                    ),
                  ),
                );
                //출발역 데이터를 받아온 경우
                if (result != null) {
                  setState(() {
                    selectedDepartureStation = result;
                    selectedArrivalStation = null; // 출발역을 바꾸면 도착역 초기화
                  });
                }
              },
              //도착역 데이터 비동기 설계
              onSelectArrival: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StationListPage(
                      title: '도착역', //도착역 선택 페이지에서 도착역 앱 바 타이틀
                      excludedStation:
                          selectedDepartureStation, // 출발역은 선택할 수 없게 제외
                    ),
                  ),
                );
                //도착역 데이터를 받아온 경우
                if (result != null) {
                  setState(() {
                    selectedArrivalStation = result;
                  });
                }
              },
            ),
            SizedBox(height: 20), //역 정보 박스와 거리 조정
            //좌석 선택 버튼 위젯으로 출발역과 도착역 데이터 넘겨줌
            seatButton(
              departureStation: selectedDepartureStation,
              arrivalStation: selectedArrivalStation,
            ),
          ],
        ),
      ),
    );
  }
}
