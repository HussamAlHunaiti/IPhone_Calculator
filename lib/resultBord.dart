import 'package:flutter/material.dart';

class ResultBord extends StatelessWidget {
  final String _borderNumber;

  ResultBord(this._borderNumber);

  @override
  Widget build(BuildContext context) {
    return Text(
      _borderNumber,
      style: TextStyle(color: Colors.white, fontSize: 60),
      textAlign: TextAlign.right,
    );
  }
}
