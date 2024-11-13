import 'package:flutter/material.dart';
import 'package:flutter_train_app/station/station_list_page.dart';

class StationSelect extends StatelessWidget {
  const StationSelect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200, // 부모 컨테이너의 높이 제한
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: stations(context, '출발역')),
          Container(
            width: 2,
            height: 50,
            color: Colors.grey[400],
          ),
          Expanded(child: stations(context, '도착역')),
        ],
      ),
    );
  }

  Widget stations(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => StationListPage(title: title)),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '선택',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ],
      ),
    );
  }
}
