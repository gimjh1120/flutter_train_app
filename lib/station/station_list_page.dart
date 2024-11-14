import 'package:flutter/material.dart';

class StationListPage extends StatelessWidget {
  final String title;
  final String? excludedStation;

  const StationListPage({
    super.key,
    required this.title,
    this.excludedStation,
  });

  @override
  Widget build(BuildContext context) {
    // 전체 기차역 리스트
    final stations = [
      '수서',
      '동탄',
      '평택지제',
      '천안아산',
      '오송',
      '대전',
      '김천구미',
      '동대구',
      '경주',
      '울산',
      '부산',
    ];

    // excludedStation을 제외한 기차역 리스트 필터링
    final filteredStations =
        stations.where((station) => station != excludedStation).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: filteredStations.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context, filteredStations[index]);
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                filteredStations[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
