import 'package:flutter/material.dart';

class MyInformation extends StatelessWidget {
  final String keys;
  final String values;
  const MyInformation({
    super.key,
    required this.keys,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          Text(
            keys,
            style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.normal,
                fontSize: 17),
          ),
          const SizedBox(width: 8.0),
          Text(
            values,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600, fontSize: 17
            ),
          ),
        ],
      ),
    );
  }
}
