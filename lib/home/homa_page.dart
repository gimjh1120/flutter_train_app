import 'package:flutter/material.dart';
import 'package:flutter_train_app/station/station_list_page.dart';
import 'package:flutter_train_app/home/widget/station_select.dart';
import 'package:flutter_train_app/home/widget/seat_button.dart';

class HomaPage extends StatefulWidget {
  @override
  _HomaPageState createState() => _HomaPageState();
}

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StationSelect(
              departureStation: selectedDepartureStation,
              arrivalStation: selectedArrivalStation,
              onSelectDeparture: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StationListPage(
                      title: '출발역',
                    ),
                  ),
                );
                if (result != null) {
                  setState(() {
                    selectedDepartureStation = result;
                    selectedArrivalStation = null; // 출발역을 바꾸면 도착역 초기화
                  });
                }
              },
              onSelectArrival: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StationListPage(
                      title: '도착역',
                      excludedStation: selectedDepartureStation, // 출발역 제외
                    ),
                  ),
                );
                if (result != null) {
                  setState(() {
                    selectedArrivalStation = result;
                  });
                }
              },
            ),
            SizedBox(height: 20),
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
