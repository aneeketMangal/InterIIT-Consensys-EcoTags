import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PointsViewer extends StatelessWidget {
  // points class variable
  final int points;

  const PointsViewer({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: <Widget>[
          Text(
            'Points',
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
          Text(
            points.toString(),
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
