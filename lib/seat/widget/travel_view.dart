import 'package:flutter/material.dart';

class travelView extends StatelessWidget {
  const travelView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '수서',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple,
            fontSize: 30,
          ),
        ),
        SizedBox(
          width: 60,
        ),
        Icon(
          Icons.arrow_circle_right_outlined,
          size: 30,
        ),
        SizedBox(
          width: 60,
        ),
        Text(
          '부산',
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
