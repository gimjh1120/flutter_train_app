import 'package:flutter/material.dart';

class selectView extends StatelessWidget {
  const selectView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text('선택됨'),
          SizedBox(
            width: 20,
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.grey[300]!,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Text('선택안됨'),
        ],
      ),
    );
  }
}
